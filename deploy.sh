#!/usr/bin/env bash
# jabbarvip-site 一键发布：
#   提交并推送到 GitHub。GitHub Pages 会从 main 分支根目录直接发布。
#
# 用法:
#   ./deploy.sh "提交说明"      # 提交+推送 GitHub Pages 源码
#   ./deploy.sh                 # 不传说明则用时间戳
#   ./deploy.sh -n "说明"       # 演练(dry-run)，只显示将要提交的改动
set -euo pipefail

cd "$(dirname "$0")"

DRY=0
if [[ "${1:-}" == "-n" ]]; then DRY=1; shift; fi

MSG="${1:-backup $(date '+%Y-%m-%d %H:%M:%S')}"

if [[ -n "$(git status --porcelain)" ]]; then
  if [[ "$DRY" -eq 1 ]]; then
    echo ">> 演练模式：以下改动会提交到 GitHub Pages 源码仓库"
    git status --short
    exit 0
  fi

  echo ">> 有改动，提交并推送到 GitHub Pages 源码仓库 …"
  git add -A
  git commit -m "$MSG"
  git push origin main
else
  echo ">> 工作区无改动，跳过提交。"
fi

echo ">> 完成。正式地址：https://qianjiabao1999.github.io/jabbarvip-site/"
