#!/usr/bin/env bash
# macOS/Linux port of incbin.bat: extract [start,end) hex byte range from a file
# into "<file>_<startHex>_<endHex>.extracted" (skips if it already exists).
set -euo pipefail
[ $# -ge 3 ] || { echo "Usage: $0 filename startHexOffset endHexOffset"; exit 1; }
f="$1"; sHex="$2"; eHex="$3"
out="${f}_${sHex}_${eHex}.extracted"
[ -f "$out" ] && exit 0
start=$(( sHex )); end=$(( eHex )); len=$(( end - start ))
dd if="$f" of="$out" bs=1 skip="$start" count="$len" status=none
echo "Done. Extracted -> $out"
