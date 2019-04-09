#!/bin/bash -ex
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

# build Doxygen docs and Sphinx docs
make -C docs
