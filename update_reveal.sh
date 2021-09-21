#!/usr/bin/env bash

# Check https://github.com/hakimel/reveal.js/releases
VERSION=4.1.2

rm -rf docs/reveal.js
rm -rf docs/tmp
mkdir docs/reveal.js
wget https://codeload.github.com/hakimel/reveal.js/zip/refs/tags/${VERSION} -O reveal.js.zip
unzip reveal.js.zip "reveal.js-${VERSION}/*" -d docs/tmp/
mv docs/tmp/reveal.js-${VERSION}/* docs/reveal.js/
