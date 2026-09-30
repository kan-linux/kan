Hacking on man-db
=================

man-db is not a large or particularly complicated project, but there is
still plenty for an interested developer to contribute. Here's a very brief
guide on how to get started.


Directory layout
----------------

The source tree looks something like this, ignoring some directories added
by autoconf, automake, gettext, and gnulib:

<dl>
  <dt><code>docs/</code></dt>
  <dd>Assorted documentation.</dd>

  <dt><code>man/</code></dt>
  <dd>Man pages for man-db's programs.</dd>

  <dt><code>manual/</code></dt>
  <dd>The man-db manual, written in <code>troff</code>.</dd>

  <dt><code>include/</code></dt>
  <dd>Header files used throughout the package.</dd>

  <dt><code>lib/</code></dt>
  <dd>
    Basic library files, some of which supplement inadequate C libraries on
    various systems and some of which implement utility functions used
    throughout the package.
  </dd>

  <dt><code>libdb/</code></dt>
  <dd>
    The database access library. Code outside this directory should not know
    about specific back-end database implementations.
  </dd>

  <dt><code>src/</code></dt>
  <dd>Source code to the man-db programs themselves.</dd>

  <dt><code>tools/</code></dt>
  <dd>Miscellaneous add-on scripts.</dd>

  <dt><code>po/</code></dt>
  <dd>Translations.</dd>
</dl>


Coding style
------------

`clang-format` enforces a consistent style, configured in `.clang-format`.
You can ensure that this and other checks are applied to your git commits
locally by installing the [`pre-commit`](https://pre-commit.com/) package
and running `pre-commit install`. Whether you do this or not, if you push
your changes to a fork on GitLab, then GitLab CI will run them for you.


Facilities and portability
--------------------------

man-db uses Gnulib to provide portability support and utility functions
common to many GNU packages (although man-db is not itself a GNU package),
while the `lib/` directory provides some other utility functions specific to
man-db. Please make use of these facilities where available. In particular,
there are various functions beginning with 'x' which check the return values
from the system's memory allocation calls, which you should use instead of
their non-'x' siblings.

`appendstr()` provides manageable string concatenation. Use it where
appropriate. Remember to terminate its argument list with `nullptr`. In many
cases, `xasprintf()` from Gnulib may be more readable.

If you're calling any of the `is*()` or `to*()` functions in `<ctype.h>`,
please do so via the `CTYPE()` macro in `include/manconfig.h` to ensure that
the argument type is correct.

You may assume C99.


Testing
-------

There is a small test suite in `src/tests/`, as well as basic tests in
`man/` to ensure that man-db's own manual pages format without errors. Tests
for new bug fixes are not *required*, but are generally a good idea.

Various test library facilities are available in `src/tests/testlib.sh`.
Feel free to extend this as necessary.


Things to do
------------

`docs/TODO` has a number of outstanding projects. Things near the bottom are
usually more detailed and accurate.

The Debian bug tracking system has a number of [outstanding reports on
man-db](https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=man-db;ordering=upstream).

Much of the work needed on man-db is for maintainability. Patches that take
difficult-to-understand code with hairy memory allocation and replace it
with clean, obvious, and reliable code are most welcome, especially if they
introduce new abstractions which are of more general use. The replacement of
`splitline()` with the `page_description` interface is a good example of
this.

Work on porting to platforms other than GNU/Linux is welcome. It's been a
while since serious effort in that direction has been invested in man-db.
Most of the code should be quite portable, but the occasional teething
problem would not be a surprise.


Sending patches
---------------

GitLab merge requests are preferred. Create an account on gitlab.com,
[fork](https://gitlab.com/man-db/man-db/-/forks/new) the repository to your
own account, push your branch, and create a merge request.

If you can't or don't want to use GitLab merge requests, then you can fall
back to sending patches in unified diff format (use `git diff`, or GNU diff
with the -u option) to man-db-devel@nongnu.org (see [subscription
instructions](https://lists.nongnu.org/mailman/listinfo/man-db-devel)).


Revision control
----------------

man-db is revision-controlled using [git](https://git-scm.com/). The archive
may be fetched from here using `git clone`, and merge requests are accepted
in the usual way:

  https://gitlab.com/man-db/man-db

Generated files should be added to `.gitignore` and should not be committed
to revision control.


Release process
---------------

1. Update the `AC_INIT` version number in `configure.ac` to "x.y.z-pre1".
   Commit and tag.

2. Pushing the tag should cause the GitLab CI machinery to upload a
   preliminary tarball for translators to the [package
   registry](https://gitlab.com/man-db/man-db/-/packages). Send this to the
   Translation Project robot, to provide context for `po/man-db.pot`.

3. Wait a couple of weeks for a reasonable number of translation updates to
   arrive. During this time, test until your eyeballs fall out, but try to
   avoid changing any translated messages.

4. Once you're ready to release, update `NEWS.md`, and
   the `AC_INIT` version number and `date` in `configure.ac`. Commit and
   tag.

5. Pushing the tag should cause the GitLab CI machinery to upload the
   release tarball to the [package
   registry](https://gitlab.com/man-db/man-db/-/packages). GPG-sign that
   tarball, and upload the tarball and its signature to Savannah so that the
   URLs in the newly-created [GitLab release
   notes](https://gitlab.com/man-db/man-db/-/releases) are valid.

6. Announce to wherever seems appropriate.
