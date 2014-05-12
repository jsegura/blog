#!/bin/bash
rm -rf public/*
hugo
cd public
git add -A . && git commit -m "Updated" && git push
cd ..
