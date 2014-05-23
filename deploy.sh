#!/bin/bash
rm -rf public/*
cp CNAME public/
hugo
cd public
git status
read
git add -A . && git commit -m "Updated" && git push
cd ..
