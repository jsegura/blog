#!/bin/bash
hugo
cd public
git add . && git commit -m "Updated" && git push
cd ..
