# MFIX-Exa
This is the public face of the MFiX-Exa project.

The code for now lives at NETL; instructions for how to get access to the code
will be given below.

This repo is designed to host the documentation, gallery of results, etc.

## Editing

Do not push any edits to the `gh-pages` branch as these will be overwritten.
Instead, commit your changes to the `master` branch, and the `gh-pages` branch
will be updated automatially a few minutes later. The documentation source is
in `docs/source/` and the html source for the cover page is in `docs/webroot/`.

### Doxygen

Whenever the online documentation is updated, a fresh doxygen will be generated
also. Note that the configuration in `docs/doxygen/doxygen.conf` specifically
prevent source code from being displayed. This is by design. If you want to
create your own private doxygen containing the source code also, please
configure and run the `doc/Doxyfile.in` in your clone of the MFiX-Exa repo.
