# SPDX-License-Identifier: MIT
#
# This file is formatted with Python Black

from templates import Request, Response, Session, MockParams
from typing import Dict
from itertools import count

import dbus
import dbus.service
import enum
import logging

logger = logging.getLogger(f"templates.{__name__}")

BUS_NAME = "org.freedesktop.portal.Desktop"
MAIN_OBJ = "/org/freedesktop/portal/desktop"
SYSTEM_BUS = False
MAIN_IFACE = "org.freedesktop.portal.RemoteDesktop"

_restore_tokens = count()


class RDSession(Session):
    class State(enum.IntEnum):
        CREATED = enum.auto()
        SELECTED = enum.auto()
        STARTED = enum.auto()
        CONNECTED = enum.auto()

    @property
    def state(self):
        try:
            return self._session_state
        except AttributeError:
            self._session_state = RDSession.State.CREATED
            return self._session_state

    def advance_state(self):
        if self.state != RDSession.State.CONNECTED:
            self._session_state += 1


def load(mock, parameters):
    logger.debug(f"loading {MAIN_IFACE} template")

    params = MockParams.get(mock, MAIN_IFACE)
    params.delay = 500
    params.version = parameters.get("version", 2)
    params.response = parameters.get("response", 0)
    params.devices = parameters.get("devices", 0b111)
    params.sessions: Dict[str, RDSession] = {}

    mock.AddProperties(
        MAIN_IFACE,
        dbus.Dictionary(
            {
                "version": dbus.UInt32(params.version),
                "AvailableDeviceTypes": dbus.UInt32(
                    parameters.get("device-types", params.devices)
                ),
            }
        ),
    )


@dbus.service.method(
    MAIN_IFACE,
    sender_keyword="sender",
    in_signature="a{sv}",
    out_signature="o",
)
def CreateSession(self, options, sender):
    try:
        logger.debug(f"CreateSession: {options}")
        params = MockParams.get(self, MAIN_IFACE)
        request = Request(bus_name=self.bus_name, sender=sender, options=options)

        session = RDSession(bus_name=self.bus_name, sender=sender, options=options)
        params.sessions[session.handle] = session

        response = Response(params.response, {"session_handle": session.handle})

        request.respond(response, delay=params.delay)

        return request.handle
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    sender_keyword="sender",
    in_signature="oa{sv}",
    out_signature="o",
)
def SelectDevices(self, session_handle, options, sender):
    try:
        logger.debug(f"SelectDevices: {session_handle} {options}")
        params = MockParams.get(self, MAIN_IFACE)
        request = Request(bus_name=self.bus_name, sender=sender, options=options)

        try:
            session = params.sessions[session_handle]
            if session.state != RDSession.State.CREATED:
                raise dbus.exceptions.DBusException(
                    f"Session in state {session.state}, expected CREATED",
                    name="org.freedesktop.DBus.Error.AccessDenied",
                )
            else:
                resp = params.response
                if resp == 0:
                    session.advance_state()
        except KeyError:
            raise dbus.exceptions.DBusException(
                "Invalid session", name="org.freedesktop.DBus.Error.AccessDenied"
            )

        response = Response(resp, {})
        request.respond(response, delay=params.delay)

        return request.handle
    except Exception as e:
        logger.critical(e)
        if isinstance(e, dbus.exceptions.DBusException):
            raise e


@dbus.service.method(
    MAIN_IFACE,
    sender_keyword="sender",
    in_signature="osa{sv}",
    out_signature="o",
)
def Start(self, session_handle, parent_window, options, sender):
    try:
        logger.debug(f"Start: {session_handle} {options}")
        params = MockParams.get(self, MAIN_IFACE)
        request = Request(bus_name=self.bus_name, sender=sender, options=options)

        results = {
            "devices": dbus.UInt32(params.devices),
        }

        try:
            session = params.sessions[session_handle]
            if session.state != RDSession.State.SELECTED:
                raise dbus.exceptions.DBusException(
                    f"Session in state {session.state}, expected SELECTED",
                    name="org.freedesktop.DBus.Error.AccessDenied",
                )
            else:
                resp = params.response
                if resp == 0:
                    session.advance_state()
        except KeyError:
            raise dbus.exceptions.DBusException(
                "Invalid session", name="org.freedesktop.DBus.Error.AccessDenied"
            )

        response = Response(resp, results)
        request.respond(response, delay=params.delay)

        return request.handle
    except Exception as e:
        logger.critical(e)
        if isinstance(e, dbus.exceptions.DBusException):
            raise e


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}dd",
    out_signature="",
)
def NotifyPointerMotion(self, session_handle, options, dx, dy):
    try:
        logger.debug(f"NotifyPointerMotion: {session_handle} {options} {dx} {dy}")
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}udd",
    out_signature="",
)
def NotifyPointerMotionAbsolute(self, session_handle, options, stream, x, y):
    try:
        logger.debug(
            f"NotifyPointerMotionAbsolute: {session_handle} {options} {stream} {x} {y}"
        )
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}iu",
    out_signature="",
)
def NotifyPointerButton(self, session_handle, options, button, state):
    try:
        logger.debug(
            f"NotifyPointerButton: {session_handle} {options} {button} {state}"
        )
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}dd",
    out_signature="",
)
def NotifyPointerAxis(self, session_handle, options, dx, dy):
    try:
        logger.debug(f"NotifyPointerAxis: {session_handle} {options} {dx} {dx}")
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}ui",
    out_signature="",
)
def NotifyPointerAxisDiscrete(self, session_handle, options, axis, steps):
    try:
        logger.debug(
            f"NotifyPointerAxisDiscrete: {session_handle} {options} {axis} {steps}"
        )
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}iu",
    out_signature="",
)
def NotifyKeyboardKeycode(self, session_handle, options, keycode, state):
    try:
        logger.debug(
            f"NotifyKeyboardKeycode: {session_handle} {options} {keycode} {state}"
        )
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}iu",
    out_signature="",
)
def NotifyKeyboardKeysym(self, session_handle, options, keysym, state):
    try:
        logger.debug(
            f"NotifyKeyboardKeysym: {session_handle} {options} {keysym} {state}"
        )
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}uudd",
    out_signature="",
)
def NotifyTouchDown(self, session_handle, options, stream, slot, x, y):
    try:
        logger.debug(
            f"NotifyTouchDown: {session_handle} {options} {stream} {slot} {x} {y}"
        )
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}uudd",
    out_signature="",
)
def NotifyTouchMotion(self, session_handle, options, stream, slot, x, y):
    try:
        logger.debug(
            f"NotifyTouchMotion: {session_handle} {options} {stream} {slot} {x} {y}"
        )
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}u",
    out_signature="",
)
def NotifyTouchUp(self, session_handle, options, slot):
    try:
        logger.debug(f"NotifyTouchMotion: {session_handle} {options} {slot}")
    except Exception as e:
        logger.critical(e)


@dbus.service.method(
    MAIN_IFACE,
    in_signature="oa{sv}",
    out_signature="h",
)
def ConnectToEIS(self, session_handle, options):
    try:
        logger.debug(f"ConnectToEIS: {session_handle} {options}")

        params = MockParams.get(self, MAIN_IFACE)
        try:
            session = params.sessions[session_handle]
            if session.state != RDSession.State.STARTED:
                logger.error(f"Session in state {session.state}, expected STARTED")
                raise dbus.exceptions.DBusException(
                    "Session must be started before ConnectToEIS",
                    name="org.freedesktop.DBus.Error.AccesDenied",
                )
        except KeyError:
            raise dbus.exceptions.DBusException(
                "Invalid session", name="org.freedesktop.DBus.Error.AccessDenied"
            )

        import socket

        sockets = socket.socketpair()
        # Write some random data down so it'll break anything that actually
        # expects the socket to be a real EIS socket, plus it makes it
        # easy to check if we connected to the right EIS socket in our tests.
        sockets[0].send(b"VANILLA")
        fd = sockets[1]
        logger.debug(f"ConnectToEIS with fd {fd.fileno()}")
        return dbus.types.UnixFd(fd)
    except Exception as e:
        logger.critical(e)
        if isinstance(e, dbus.exceptions.DBusException):
            raise e
