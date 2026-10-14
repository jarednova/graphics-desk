#!/bin/sh
# Builds dist/graphics-desk.zip, the skill an org Owner uploads to Claude.
# CHARTS.md stays at the repo root and is copied in here, so the repo keeps one source.
set -eu

root=$(cd "$(dirname "$0")/.." && pwd)
out="$root/dist"

rm -rf "$out/graphics-desk" "$out/graphics-desk.zip"
mkdir -p "$out/graphics-desk"
cp "$root/skill/SKILL.md" "$root/CHARTS.md" "$out/graphics-desk/"
(cd "$out" && zip -qr graphics-desk.zip graphics-desk)

echo "$out/graphics-desk.zip"
