#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

# Then we build and deploy the sphinx / doxygen documentation
SOURCE_BRANCH="master"
#TARGET_BRANCH="gh-pages"

# Pull requests and commits to other branches shouldn't try to deploy
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deploy."
    exit 0
fi

# Save some useful information
#REPO=`git config remote.origin.url`
#SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
#SHA=`git rev-parse --verify HEAD`

# build the Doxygen documentation
#cd Docs/Doxygen
#doxygen doxygen.conf
#cd ../..

# move it to the right place
#mkdir -p out/doxygen
#mv Docs/Doxygen/html/* out/doxygen/

# now do sphinx
cd docs    # ..................................... now we're in /docs
make html
cd build   # ..................................... now we're in /docs/build
mv html docs_html

# Sphinx is set up to treat build/html (and by mv, build/docs_html) as the
# webroot. Hence the .nojekyll file is in the wrong place
mv docs_html/.nojekyll .

# PWD is currently /docs/build, we want to move /docs/webroot into /docs/build
mv ../webroot/* .
