#!/usr/bin/env python3

# We can't import ei-scanner, so let's go via this route. The proper
# handling would be to have ei-scanner be the entry point for a ei_scanner
# module but.. well, one day we'll do that maybe.
import pytest

try:
    from eiscanner import parse, scanner, Protocol
except ImportError:
    print("Run tests from within the build directory")
    pytest.skip(allow_module_level=True)

from pathlib import Path

# set to the protocol file by meson
protofile = "@PROTOFILE@"


@pytest.fixture
def protocol_xml() -> Path:
    return Path(protofile)


@pytest.fixture
def protocol(protocol_xml: Path, component: str) -> Protocol:
    print(f"protocol for component {component}")
    return parse(protocol_xml, component)


@pytest.mark.skipif(
    protofile.startswith("@"),
    reason="Protocol XML file path invalid, run tests in the build dir",
)
class TestScanner:
    @pytest.mark.parametrize("component", ("eis", "ei", "brei"))
    def test_ei_names(self, component: str, protocol: Protocol):
        for interface in protocol.interfaces:
            assert interface.name.startswith(component)
            assert not interface.plainname.startswith(component)
            assert not interface.plainname.startswith("ei_")

        # just some manual checks
        assert "handshake" in [i.plainname for i in protocol.interfaces]
        assert "connection" in [i.plainname for i in protocol.interfaces]
        assert "button" in [i.plainname for i in protocol.interfaces]

    @pytest.mark.parametrize("component", ("ei",))
    def test_interface_arg(self, protocol: Protocol):
        intf = next((i for i in protocol.interfaces if i.name == "ei_device"))
        event = next((e for e in intf.events if e.name == "interface"))

        obj, interface_name, version = event.arguments
        assert obj.interface_arg == interface_name
        assert obj.interface_arg_for is None
        assert interface_name.interface_arg_for == obj
        assert interface_name.interface_arg is None
        assert version.interface_arg is None
        assert version.interface_arg_for is None

    def iterate_args(self, protocol: Protocol):
        for interface in protocol.interfaces:
            for request in interface.requests:
                for arg in request.arguments:
                    yield interface, request, arg
            for event in interface.events:
                for arg in event.arguments:
                    yield interface, event, arg

    @pytest.mark.parametrize("component", ("ei",))
    def test_version_arg(self, protocol: Protocol):
        for interface, message, arg in self.iterate_args(protocol):
            if arg.protocol_type == "new_id":
                if f"{interface.plainname}.{message.name}" not in [
                    "connection.sync",
                ]:
                    assert arg.version_arg is not None, (
                        f"{interface.name}.{message.name}::{arg.name}"
                    )
                    assert arg.version_arg.name == "version", (
                        f"{interface.name}.{message.name}::{arg.name}"
                    )
            elif arg.name == "version":
                if f"{interface.plainname}.{message.name}" not in [
                    "handshake.handshake_version",
                    "handshake.interface_version",
                ]:
                    assert arg.version_arg_for is not None, (
                        f"{interface.name}.{message.name}::{arg.name}"
                    )
                    assert arg.version_arg_for.name != "version", (
                        f"{interface.name}.{message.name}::{arg.name}"
                    )
            else:
                assert arg.version_arg is None, (
                    f"{interface.name}.{message.name}::{arg.name}"
                )
                assert arg.version_arg_for is None, (
                    f"{interface.name}.{message.name}::{arg.name}"
                )

    @pytest.mark.parametrize("method", ("yamlfile", "jsonfile", "string"))
    def test_cli_extra_data(self, tmp_path, method):
        result_path = tmp_path / "result"
        tmpl_path = tmp_path / "template"
        with open(tmpl_path, "w") as template:
            template.write(">{{extra.foo}}<")

        if method == "yamlfile":
            extra_path = tmp_path / "extra_data.yml"
            with open(extra_path, "w") as extra_data:
                extra_data.write("foo: 'yes'")
            extra_data_arg = f"--jinja-extra-data-file={extra_path}"
        elif method == "jsonfile":
            extra_path = tmp_path / "extra_data.json"
            with open(extra_path, "w") as extra_data:
                extra_data.write('{"foo": "yes"}')
            extra_data_arg = f"--jinja-extra-data-file={extra_path}"
        elif method == "string":
            extra_data = '{"foo": "yes"}'
            extra_data_arg = f"--jinja-extra-data={extra_data}"
        else:
            pytest.fail(f"Unsupported method {method}")

        try:
            scanner(
                [
                    f"--output={result_path}",
                    extra_data_arg,
                    protofile,
                    str(tmpl_path),
                ]
            )
        except SystemExit as e:
            pytest.fail(reason=f"Unexpected system exit code {e}")

        assert result_path.exists()
        with open(result_path) as fd:
            result = fd.read()
            assert result == ">yes<"
