import os

try:
    import xdist  # noqa: F401

    # Otherwise we get unknown hook 'pytest_xdist_auto_num_workers'
    def pytest_xdist_auto_num_workers(config):
        return os.getenv("FDO_CI_CONCURRENT", None)

except ImportError:
    pass
