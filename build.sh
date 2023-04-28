#!/bin/bash
set -e

rm -f src/*.hi src/*.o
ghc -O src/MyModule.hs src/Foo.hs
