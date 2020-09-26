#!/bin/bash
echo "Building and Deploying Site"
cd ~/dev/documentation
echo "Generating site"
docker run --rm -it -v ${PWD}:/docs custom/mkdocs-material build
echo "Removing existing git content"
rm -rf ~/dev/DaveSvatora.github.io/*
echo "Copying site"
cp -r ~/dev/documentation/site/. ~/dev/DaveSvatora.github.io/
echo "CD to git pages branch"
cd ~/dev/DaveSvatora.github.io/
echo "Git add"
git add .
echo "Git commit"
git commit -m "automated commit"
echo "Git push"
git push