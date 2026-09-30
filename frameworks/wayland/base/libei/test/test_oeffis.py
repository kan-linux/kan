#!/usr/bin/env python3
#
# SPDX-License-Identifier: MIT
#
# This file is formatted with Python Black
#
# Introduction
# ============
#
# This is a Python-based test suite making use of DBusMock to test the
# liboeffis.so C library.
#
# The main components are:
# - LibOeffis: the Python class wrapping liboeffis.so via ctypes.
#   This is a manually maintained mapping, any API additions/changes must
#   updated here.
# - Oeffis: a pythonic wrapper around LibOeffis so the tests look like Python
# - TestOeffis: the test class for all tests that must talk to DBus
#
# DBusMock integration
# ====================
#
# DBusMock works in that a **separate process** is started that provides a
# DBus session bus that our tests connect to. Templates for dbusmock provide
# the behavior of that bus. Note that the mocked bus cannot be controlled
# from our test code, it's a separate process. Unless you set up special
# DBus signals/methods to talk to it, which we don't.
#
# Any test that requires DBus looks like this:
#
# ```python
# class TestOeffis():
#     ....
#     def test_foo(self, daemon, mainloop):
#         # now you can talk to the RemoteDesktop portal
#         ...
# ```
# See the RemoteDesktop template for parameters that can be passed in.
#
# DBusMock templates
# ------------------
#
# See the templates/ directory for the templates used by DBusMock. Templates
# are named after the portal. Available parameters are in the `load()` function.
#


from ctypes import c_char_p, c_int, c_uint32, c_void_p
from typing import Iterator, List, Tuple, Type, Optional, TextIO
from gi.repository import GLib  # type: ignore
from dbus.mainloop.glib import DBusGMainLoop
from dataclasses import dataclass

import ctypes
import dbus
import dbus.proxies
import dbusmock
import fcntl
import os
import pytest
import socket
import subprocess

DBusGMainLoop(set_as_default=True)

PREFIX = "oeffis_"

# Uncomment this to have dbus-monitor listen on the normal session address
# rather than the test DBus. This can be useful for cases where *something*
# messes up and tests run against the wrong bus.
#
# session_dbus_address = os.environ["DBUS_SESSION_BUS_ADDRESS"]


def version_at_least(have, required) -> bool:
    for h, r in zip(have.split("."), required.split(".")):
        if h < r:
            return False
        elif h > r:
            return True

    return True


@dataclass
class _Api:
    name: str
    args: Tuple[Type[ctypes._SimpleCData], ...]
    return_type: Optional[Type[ctypes._SimpleCData]]

    @property
    def basename(self) -> str:
        return self.name[len(PREFIX) :]


@dataclass
class _Enum:
    name: str
    value: int

    @property
    def basename(self) -> str:
        return self.name[len(PREFIX) :]


class LibOeffis(object):
    """
    liboeffis.so wrapper. This is a singleton ctypes wrapper into liboeffis.so with
    minimal processing. Example:

    >>> lib = LibOeffis.instance()
    >>> ctx = lib.oeffis_new(None)
    >>> lib.oeffis_unref(ctx)
    >>> print(lib.OEFFIS_EVENT_CLOSED)

    In most cases you probably want to use the ``Oeffis`` class instead.
    """

    _lib = None

    @staticmethod
    def _cdll():
        return ctypes.CDLL("liboeffis.so.1", use_errno=True)

    @classmethod
    def _load(cls):
        cls._lib = cls._cdll()
        for api in cls._api_prototypes:
            func = getattr(cls._lib, api.name)
            func.argtypes = api.args
            func.restype = api.return_type
            setattr(cls, api.name, func)

        for e in cls._enums:
            setattr(cls, e.name, e.value)

    _api_prototypes: List[_Api] = [
        _Api(name="oeffis_new", args=(c_void_p,), return_type=c_void_p),
        _Api(name="oeffis_ref", args=(c_void_p,), return_type=c_void_p),
        _Api(name="oeffis_unref", args=(c_void_p,), return_type=c_void_p),
        _Api(name="oeffis_set_user_data", args=(c_void_p, c_void_p), return_type=None),
        _Api(name="oeffis_get_user_data", args=(c_void_p,), return_type=c_void_p),
        _Api(name="oeffis_get_fd", args=(c_void_p,), return_type=c_int),
        _Api(name="oeffis_get_eis_fd", args=(c_void_p,), return_type=c_int),
        _Api(name="oeffis_create_session", args=(c_void_p, c_uint32), return_type=None),
        _Api(
            name="oeffis_create_session_on_bus",
            args=(c_void_p, c_char_p, c_uint32),
            return_type=None,
        ),
        _Api(name="oeffis_dispatch", args=(c_void_p,), return_type=None),
        _Api(name="oeffis_get_event", args=(c_void_p,), return_type=c_int),
        _Api(name="oeffis_get_error_message", args=(c_void_p,), return_type=c_char_p),
    ]

    _enums: List[_Enum] = [
        _Enum(name="OEFFIS_DEVICE_ALL_DEVICES", value=0),
        _Enum(name="OEFFIS_DEVICE_KEYBOARD", value=1),
        _Enum(name="OEFFIS_DEVICE_POINTER", value=2),
        _Enum(name="OEFFIS_DEVICE_TOUCHSCREEN", value=4),
        _Enum(name="OEFFIS_EVENT_NONE", value=0),
        _Enum(name="OEFFIS_EVENT_CONNECTED_TO_EIS", value=1),
        _Enum(name="OEFFIS_EVENT_CLOSED", value=2),
        _Enum(name="OEFFIS_EVENT_DISCONNECTED", value=3),
    ]

    @classmethod
    def instance(cls):
        if cls._lib is None:
            cls._load()
        return cls


class Oeffis:
    """
    Convenience wrapper to make using liboeffis a bit more pythonic.

    >>> o = Oeffis()
    >>> fd = o.fd
    >>> o.create_session(o.DEVICE_POINTER)

    """

    def __init__(self, userdata=None):
        lib = LibOeffis.instance()
        self.ctx = lib.oeffis_new(userdata)  # type: ignore

        def wrapper(func):
            return lambda *args, **kwargs: func(self.ctx, *args, **kwargs)

        for api in lib._api_prototypes:
            # skip some APIs that are not be exposed because they don't make sense
            # to have in python.
            if api.name not in (
                "oeffis_ref",
                "oeffis_unref",
                "oeffis_get_user_data",
                "oeffis_set_user_data",
            ):
                func = getattr(lib, api.name)
                setattr(self, api.basename, wrapper(func))

        for e in lib._enums:
            val = getattr(lib, e.name)
            setattr(self, e.basename, val)

    @property
    def fd(self) -> TextIO:
        """
        Return the fd we need to monitor for oeffis_dispatch()
        """
        return os.fdopen(self.get_fd(), "rb")  # type: ignore

    @property
    def eis_fd(self) -> Optional[socket.socket]:
        """Return the socket connecting us to the EIS implementation or None if we're not ready/disconnected"""
        fd = self.get_eis_fd()  # type: ignore
        if fd != -1:
            return socket.socket(fileno=fd)
        else:
            return None

    @property
    def error_message(self) -> Optional[str]:
        return self.get_error_message()  # type: ignore

    def __del__(self):
        LibOeffis.instance().oeffis_unref(self.ctx)  # type: ignore


@pytest.fixture()
def liboeffis():
    return LibOeffis.instance()


def test_ref_unref(liboeffis):
    o = liboeffis.oeffis_new(None)
    assert o is not None
    o2 = liboeffis.oeffis_ref(o)
    assert o2 == o
    assert liboeffis.oeffis_unref(o) is None
    assert liboeffis.oeffis_unref(o2) is None
    assert liboeffis.oeffis_unref(None) is None


def test_set_user_data(liboeffis):
    o = liboeffis.oeffis_new(None)
    assert liboeffis.oeffis_get_user_data(o) is None
    liboeffis.oeffis_unref(o)

    data = ctypes.pointer(ctypes.c_int(52))
    o = liboeffis.oeffis_new(data)
    assert o is not None


def test_ctx():
    oeffis = Oeffis()
    assert oeffis.error_message is None

    fd = oeffis.fd
    assert fd is not None

    eisfd = oeffis.eis_fd
    assert eisfd is None


def test_error_out():
    # Bus doesn't exist
    oeffis = Oeffis()
    oeffis.create_session_on_bus(b"org.freedesktop.OeffisTest", oeffis.DEVICE_POINTER)
    oeffis.dispatch()
    e = oeffis.get_event()
    assert e == oeffis.EVENT_DISCONNECTED
    assert oeffis.error_message is not None


@pytest.fixture()
def session_bus_unmonitored() -> Iterator[dbusmock.DBusTestCase]:
    """
    Fixture that yields a newly created session bus
    """
    bus = dbusmock.DBusTestCase()
    bus.start_session_bus()
    bus.setUp()
    yield bus
    bus.tearDown()
    bus.tearDownClass()


@pytest.fixture()
def session_bus(session_bus_unmonitored) -> Iterator[dbusmock.DBusTestCase]:
    """
    Fixture that yields a newly created session bus
    with dbus-monitor running on that bus (printing to stdout).
    """
    import subprocess

    env = os.environ.copy()
    try:
        env["DBUS_SESSION_BUS_ADDRESS"] = session_dbus_address
    except NameError:
        # See comment above
        pass

    argv = ["dbus-monitor", "--session"]
    mon = subprocess.Popen(argv, env=env)

    def stop_dbus_monitor():
        mon.terminate()
        mon.wait()

    GLib.timeout_add(2000, stop_dbus_monitor)

    yield session_bus_unmonitored

    mon.terminate()
    mon.wait()


@pytest.fixture()
def mock(
    session_bus, portal_name="RemoteDesktop", params=None, extra_templates=[]
) -> Iterator[dbus.proxies.ProxyObject]:
    """
    Fixture that starts a DBusMock daemon in a separate process and returns
    the ProxyObject for the mock.

    If extra_templates is specified, it is a list of tuples with the
    portal name as first value and the param dict to be passed to that
    template as second value, e.g. ("ScreenCast", {...}).
    """
    p_mock, obj_portal = session_bus.spawn_server_template(
        template=f"templates/{portal_name.lower()}.py",
        parameters=params or {},
        stdout=subprocess.PIPE,
    )

    flags = fcntl.fcntl(p_mock.stdout, fcntl.F_GETFL)
    fcntl.fcntl(p_mock.stdout, fcntl.F_SETFL, flags | os.O_NONBLOCK)

    for t, tparams in extra_templates:
        template = f"templates/{t.lower()}.py"
        obj_portal.AddTemplate(
            template,
            dbus.Dictionary(tparams, signature="sv"),
            dbus_interface=dbusmock.MOCK_IFACE,
        )

    yield obj_portal

    if p_mock.stdout:
        out = (p_mock.stdout.read() or b"").decode("utf-8")
        if out:
            print(out)
        p_mock.stdout.close()
    p_mock.terminate()
    p_mock.wait()


@pytest.fixture()
def mainloop() -> Iterator[GLib.MainLoop]:
    """
    Yields a mainloop that automatically quits after a
    fixed timeout, but only on the first run. That's usually enough for
    tests, if you need to call mainloop.run() repeatedly ensure that a
    timeout handler is set to ensure quick test case failure  in case of
    error.
    """

    loop = GLib.MainLoop()
    GLib.timeout_add(2000, loop.quit)
    yield loop


@pytest.mark.skipif(
    not version_at_least(dbusmock.__version__, "0.28.5"),
    reason="dbusmock >= 0.28.5 required",
)
class TestOeffis:
    """
    Test class that sets up a mocked DBus session bus to be used by liboeffis.so.
    """

    def test_create_session(self, mock, mainloop):
        oeffis = Oeffis()
        oeffis.create_session(oeffis.DEVICE_POINTER | oeffis.DEVICE_KEYBOARD)  # type: ignore
        oeffis.dispatch()  # type: ignore

        def _dispatch(source, condition):
            oeffis.dispatch()  # type: ignore
            return True

        GLib.io_add_watch(oeffis.fd, 0, GLib.IO_IN, _dispatch)

        mainloop.run()

        e = oeffis.get_event()  # type: ignore
        assert e == oeffis.EVENT_CONNECTED_TO_EIS, oeffis.error_message  # type: ignore

        eisfd = oeffis.eis_fd
        assert eisfd is not None

        assert eisfd.recv(64) == b"VANILLA"  # that's what the template sends

    def test_create_session_all_devices(self, mock, mainloop):
        oeffis = Oeffis()
        oeffis.create_session(oeffis.DEVICE_ALL_DEVICES)  # type: ignore
        oeffis.dispatch()  # type: ignore

        def _dispatch(source, condition):
            oeffis.dispatch()  # type: ignore
            return True

        GLib.io_add_watch(oeffis.fd, 0, GLib.IO_IN, _dispatch)

        mainloop.run()
        e = oeffis.get_event()  # type: ignore
        assert e == oeffis.EVENT_CONNECTED_TO_EIS, oeffis.error_message  # type: ignore

        mock_interface = dbus.Interface(mock, dbusmock.MOCK_IFACE)
        method_calls = mock_interface.GetMethodCalls("SelectDevices")
        assert len(method_calls) > 0
        _, args = method_calls[-1]
        options = args[1]
        assert "handle_token" in options
        # if OEFFIS_DEVICE_ALL_DEVICES is selected, liboeffis skips the types option
        assert "types" not in options


def test_version_compare():
    assert version_at_least("1", "1.0")
    assert version_at_least("1.0", "1.0")
    assert version_at_least("1.1", "1.0")
    assert version_at_least("1.0.1", "1.0.0")
    assert version_at_least("1.0.2", "1.0.1")
    assert version_at_least("1.1", "1.0.2")
    assert version_at_least("1.1.1", "1.0.2")
    assert version_at_least("1.0.2.dev1234", "1.0.2")
    assert version_at_least("2", "1.3")

    assert not version_at_least("1.0", "1.1")
    assert not version_at_least("1.0.2", "1.0.3")
    assert not version_at_least("1.0.2.dev1234", "1.0.3")


# Try loading the instance once, if that fails we're probably in
# the source directory so let's skip everything.
try:
    LibOeffis.instance()
except OSError:
    pytest.skip(allow_module_level=True)
