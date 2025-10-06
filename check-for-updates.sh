#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

function main() {
    cd "$(dirname $0)"
    nix flake update
    nixos-rebuild build --flake .
    nvd diff /run/current-system result
    rm -f result
}

main
