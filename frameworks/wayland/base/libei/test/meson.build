if get_option('tests').disabled()
    summary({'Test suite enabled': false}, section: 'Test options')
    subdir_done()
endif

subproject('munit', default_options: 'werror=false')

munit = dependency('munit', fallback: ['munit', 'munit_dep'])

lib_unittest = static_library('unittest',
    '../src/util-munit.c',
    dependencies: munit,
    include_directories: [inc_builddir],
)

dep_unittest = declare_dependency(
    link_with: lib_unittest,
    dependencies: munit
)

test('unit-tests-utils',
     executable('unit-tests-utils',
                'unit-tests.c',
                src_libutil,
                include_directories: [inc_src, inc_builddir],
                c_args: ['-D_enable_tests_'],
                dependencies: [dep_unittest, dep_math, dep_epoll],
     ),
     args: ['--log-visible', 'debug'],
)

if build_libei
    test('unit-tests-ei',
         executable('unit-tests-ei',
                    'unit-tests.c',
                    src_libei,
                    include_directories: [inc_src, inc_builddir],
                    c_args: ['-D_enable_tests_'],
                    dependencies: deps_libei + [dep_unittest],
         ),
         args: ['--log-visible', 'debug'],
    )
endif

if build_libeis
    test('unit-tests-eis',
         executable('unit-tests-eis',
                    'unit-tests.c',
                    src_libeis,
                    include_directories: [inc_src, inc_builddir],
                    c_args: ['-D_enable_tests_'],
                    dependencies: [dep_unittest, dep_libutil],
         ),
         args: ['--log-visible', 'debug'],
    )
endif

if build_oeffis
    test('unit-tests-oeffis',
         executable('unit-tests-oeffis',
                    'unit-tests.c',
                    src_liboeffis,
                    include_directories: [inc_src, inc_builddir],
                    c_args: ['-D_enable_tests_'],
                    dependencies: deps_liboeffis + [dep_unittest],
         ),
         args: ['--log-visible', 'debug'],
    )
endif

if build_libei and build_libeis
    lib_eierpecken = static_library('eierpecken',
                                    'eierpecken.h',
                                    'eierpecken.c',
                                    include_directories: [inc_src, inc_builddir],
                                    dependencies: [munit, dep_libutil, dep_libei, dep_libeis],
    )

    eierpecken = executable('eierpecken',
                            'test-ei-device.c',
                            'test-ei-seat.c',
                            'test-ei.c',
                            'test-eis.c',
                            'test-main.c',
                            link_with: lib_eierpecken,
                            include_directories: [inc_builddir],
                            dependencies: [dep_unittest, dep_libei, dep_libeis],
    )

    test('eierpecken',
        eierpecken,
        args: ['--log-visible', 'debug', '--enable-sigalarm'],
        suite: 'sigalrm',
    )

    test('eierpecken-no-sigalrm',
        eierpecken,
        args: ['--log-visible', 'debug'],
        suite: 'nosigalrm',
    )
endif

valgrind = find_program('valgrind', required: false)
if valgrind.found()
    add_test_setup('valgrind',
                   exe_wrapper: [valgrind,
                                 '--leak-check=full',
                                 '--gen-suppressions=all',
                                 '--error-exitcode=3'],
                   exclude_suites: ['python', 'sigalrm'],  # we don't want to valgrind python and SIGALRM tests
                   timeout_multiplier: 100,
    )
else
    message('valgrind not found, disabling valgrind test suite')
endif

if build_libei
    # build-test only
    executable('test-build-libei',
               'buildtest.c',
               dependencies: [dep_libei],
               include_directories: [inc_src],
               c_args: ['-Werror', '-DINCLUDE_LIBEI=1'],
               install: false,
    )
endif

if build_libeis
    executable('test-build-libeis',
               'buildtest.c',
               dependencies: [dep_libeis],
               include_directories: [inc_src],
               c_args: ['-Werror', '-DINCLUDE_LIBEIS=1'],
               install: false,
    )
endif

if add_languages('cpp', required: false)
    if build_libei
        executable('test-build-cxx-libei',
                   'buildtest.cc',
                   dependencies: [dep_libei],
                   include_directories: [inc_src],
                   c_args: ['-Werror', '-DINCLUDE_LIBEI=1'],
                   install: false,
        )
    endif

    if build_libeis
        executable('test-build-cxx-libeis',
                   'buildtest.cc',
                   dependencies: [dep_libeis],
                   include_directories: [inc_src],
                   c_args: ['-Werror', '-DINCLUDE_LIBEIS=1'],
                   install: false,
        )
    endif
endif

# Python-based tests

pymod = import('python')
required_python_modules = ['pytest', 'structlog']
python = pymod.find_installation('python3', required: get_option('tests'))
if python.found() and python.language_version().version_compare('< 3.11')
    required_python_modules += ['strenum']
endif
if build_oeffis
    required_python_modules += ['dbusmock']
endif

python = pymod.find_installation('python3',
                                 modules: required_python_modules,
                                 required: get_option('tests'),
)
pytest = find_program('pytest-3', 'pytest', required: get_option('tests'))
pytest_args = ['--verbose', '--log-level=DEBUG']

enable_pytest = python.found() and pytest.found() and build_libeis

if enable_pytest
    # pytest xdist is nice because it significantly speeds up our
    # test process, but it's not required
    optional_python_modules = ['xdist']
    if pymod.find_installation('python3', modules: optional_python_modules, required: false).found()
        pytest_args += ['-n', 'auto']
        configure_file(input: 'conftest.py', output: '@PLAINNAME@', copy: true)
    endif

    eiproto_python_template = files('eiproto.py.tmpl')
    eiproto_python = custom_target('eiproto.py',
                                   input: protocol_xml,
                                   output: 'eiproto.py',
                                   command: [scanner, '--component=ei', '--output=@OUTPUT@', '@INPUT@', eiproto_python_template],
                                   build_by_default: true,
    )

    protocol_test_config = configuration_data()
    protocol_test_config.set('LIBEI_TEST_SERVER', eis_demo_server.full_path())
    configure_file(input: 'test_protocol.py',
                   output: '@PLAINNAME@',
                   configuration: protocol_test_config,
    )

    test('protocol-test', pytest,
        args: pytest_args + ['-k', 'TestEiProtocol'],
        suite: 'python',
        workdir: meson.project_build_root(),
    )
    if valgrind.found()
        env = environment()
        env.set('LIBEI_USE_VALGRIND', '1')
        test('protocol-test-valgrind', pytest,
            args: pytest_args + ['-k', 'TestEiProtocol'],
            suite: 'python',
            workdir: meson.project_build_root(),
            env: env,
            timeout: 300,
        )
    endif

    if build_oeffis
        env = environment()
        env.set('LD_LIBRARY_PATH', fs.parent(lib_liboeffis.full_path()))
        test('oeffis-pytest', pytest,
            args: pytest_args,
            suite: 'python',
            workdir: meson.current_source_dir(),
            env: env,
        )
    endif

    test_scanner_config = configuration_data()
    test_scanner_config.set('PROTOFILE', protocol_xml_path)

    # ei-scanner can't be imported as-is in python, so we copy + rename it
    configure_file(input: scanner_source,
                   output: 'eiscanner.py',
                   copy: true,
    )
    configure_file(input: 'test_scanner.py',
                   output: '@PLAINNAME@',
                   configuration: test_scanner_config,
    )
    test('scanner-pytest', pytest,
         args: pytest_args + ['-k', 'TestScanner'],
         suite: 'python',
         workdir: meson.current_build_dir(),
    )
endif

summary({'valgrind available': valgrind.found(),
         'unit tests enabled': true,
         'pytest tests enabled': enable_pytest,
        }, section: 'Test options',
)
