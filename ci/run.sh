#!/bin/env sh
set -e

cabal build
cabal test
cabal bench
