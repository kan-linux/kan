# Release tools used for curl 8.23.0-20260925

The following tools and their Debian package version numbers were used to
produce this release tarball.

- autoconf: 2.72-3.1
- automake: 1:1.17-4
- libtool: 2.5.4-4
- make: 4.4.1-2
- perl: 5.40.1-6+deb13u1
- git: 1:2.47.3-0+deb13u1

# Reproduce the tarball

- Clone the repo and checkout the tag/commit: 1845ae1b8c0e5ae9a11703b8fed3e2fa3a4ab247
- Install the same set of tools + versions as listed above

## Do a standard build

- autoreconf -fi
- ./configure [...]
- make

## Generate the tarball with the same timestamp

- export SOURCE_DATE_EPOCH=1790296254
- ./scripts/maketgz [version]

