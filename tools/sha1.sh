#!/usr/bin/env bash
# macOS/Linux port of sha1.bat
[ $# -ge 1 ] || { echo "Usage: $0 <file>"; exit 1; }
shasum "$1" | awk '{print $1}'
