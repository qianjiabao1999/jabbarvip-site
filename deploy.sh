#!/usr/bin/env bash
# jabbarvip-site 一键发布：
#   1) 提交并推送到 GitHub 备份仓库 (origin/main)
#   2) rsync 同步到香港服务器 jabbarviphk:/var/www/jabbarvip（正式上线目录）
#
# 用法:
#   ./deploy.sh "提交说明"      # 提交+推GitHub+同步服务器
#   ./deploy.sh                 # 不传说明则用时间戳
#   ./deploy.sh -n "说明"       # 演练(dry-run)，只看 rsync 会改哪些文件，不实际改
set -euo pipefail

cd "$(dirname "$0")"

DRY=""
if [[ "${1:-}" == "-n" ]]; then DRY="--dry-run"; shift; fi

MSG="${1:-backup $(date '+%Y-%m-%d %H:%M:%S')}"

SERVER="jabbarviphk"
REMOTE_DIR="/var/www/jabbarvip"

# --- 1. GitHub 备份 ---
if [[ -n "$(git status --porcelain)" ]]; then
  echo ">> 有改动，提交并推送到 GitHub …"
  git add -A
  git commit -m "$MSG"
  git push origin main
else
  echo ">> 工作区无改动，跳过提交（仍会同步服务器）"
fi

# --- 2. 同步到服务器 ---
# 排除 git/系统文件；--delete 让服务器与本地完全一致（删掉本地已删的文件）
echo ">> rsync -> ${SERVER}:${REMOTE_DIR} ${DRY:+(dry-run)}"
rsync -avz --delete $DRY \
  --exclude='.git/' \
  --exclude='.gitignore' \
  --exclude='.DS_Store' \
  --exclude='deploy.sh' \
  ./ "${SERVER}:${REMOTE_DIR}/"

echo ">> 完成。"
