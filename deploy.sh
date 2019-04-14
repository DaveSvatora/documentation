#!/bin/bash
echo "Building and Deploying Site"
cd ~/Documents/documentation
echo "Removing public folder"
rm -rf public
echo "Generating site"
hugo
echo "Removing existing git content"
rm -rf ~/Documents/DaveSvatora.github.io/*
echo "Copying site"
cp -r ~/Documents/documentation/public/. ~/Documents/DaveSvatora.github.io/
echo "CD to git pages branch"
cd ~/Documents/DaveSvatora.github.io/
echo "Git add"
git add .
echo "Git commit"
git commit -m "automated commit"
echo "Git push"
git push