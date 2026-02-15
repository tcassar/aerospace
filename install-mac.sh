#!/usr/bin/env bash

set -euo pipefail -o functrace -o errtrace

assert_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "FATAL::brew not installed" >&2
    exit 1
  fi
}

assert_no_aerospace() {
  local aerospace
  aerospace="$(command -v aerospace || true)"

  if [[ -n $aerospace ]]; then
    echo "INFO:: Already installed at $aerospace"
    exit 0
  fi
}

main() {
  assert_brew
  assert_no_aerospace

  brew install --cask nikitabobko/tap/aerospace
}

main "$@"
