#!/bin/sh
# 把最新的 deliverable 网页复制到本仓库并推送到 GitHub Pages
set -e
cd "$(dirname "$0")"
cp "../deliverable/$(ls -t ../deliverable | grep '\.html$' | head -1)" index.html
git add -A && git commit -m "update site $(date +%Y-%m-%d)" && git push
