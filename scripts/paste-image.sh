#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: scripts/paste-image.sh [--no-paste]

Saves the clipboard image to assets/ with a timestamped filename,
puts markdown in the clipboard, and (by default) pastes it into the
frontmost app.

Options:
  --no-paste  Only copy markdown to clipboard, do not auto-paste.
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

NO_PASTE=0
if [[ "${1:-}" == "--no-paste" ]]; then
  NO_PASTE=1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ASSETS_DIR="$ROOT_DIR/assets"

mkdir -p "$ASSETS_DIR"

base_ts="$(date +"%Y-%m-%d-%H-%M-%S")"
filename="$base_ts.png"
path="$ASSETS_DIR/$filename"

if [[ -e "$path" ]]; then
  i=1
  while [[ -e "$ASSETS_DIR/${base_ts}-${i}.png" ]]; do
    i=$((i + 1))
  done
  filename="${base_ts}-${i}.png"
  path="$ASSETS_DIR/$filename"
fi

if command -v pngpaste >/dev/null 2>&1; then
  if ! pngpaste "$path" >/dev/null 2>&1; then
    echo "No image data found in clipboard." >&2
    exit 1
  fi
else
  if ! osascript - "$path" <<'OSAEOF'
on run argv
  set outPath to item 1 of argv
  try
    set imgData to the clipboard as PNG picture
  on error
    error "No image data found in clipboard." number 1
  end try

  set outFile to POSIX file outPath
  set outRef to open for access outFile with write permission
  set eof outRef to 0
  write imgData to outRef
  close access outRef
end run
OSAEOF
  then
    echo "No image data found in clipboard." >&2
    exit 1
  fi
fi

if [[ ! -s "$path" ]]; then
  echo "Failed to write image to $path" >&2
  exit 1
fi

md="![](/assets/$filename)"
printf "%s" "$md" | pbcopy

if [[ "$NO_PASTE" -eq 0 ]]; then
  osascript -e 'tell application "System Events" to keystroke "v" using {command down}'
fi

echo "Saved $path"
