#!/bin/sh
# 把最新的 deliverable 网页复制到本仓库并推送到 GitHub Pages（绕过本机 git 代理设置）
set -e
cd "$(dirname "$0")"
cp "../deliverable/$(ls -t ../deliverable | grep '\.html$' | head -1)" index.html
git add -A && git commit -m "update site $(date +%Y-%m-%d)" || true
git -c http.proxy= -c https.proxy= -c http.postBuffer=524288000 -c http.version=HTTP/1.1 push
echo "pushed; GitHub Pages 会在约 1 分钟内更新 https://haohanchen.github.io/ai-tracker-demo/"
