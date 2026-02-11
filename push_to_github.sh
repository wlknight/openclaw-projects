# OpenClaw GitHub 推送脚本
# 作者：OpenClaw AI 助手

#!/bin/bash

# 配置
REPO_DIR="/root/.openclaw/workspace"
GITHUB_REPO="https://github.com/wlknight/openclaw-projects.git"
COMMIT_MSG="${1:-'更新代码'}"
BRANCH="main"

# 进入仓库目录
cd "$REPO_DIR"

echo "🚀 开始推送到 GitHub..."

# 添加所有文件（排除 .gitignore 中指定的）
git add -A

# 提交
git commit -m "$COMMIT_MSG"

# 推送到远程仓库
git push origin "$BRANCH"

if [ $? -eq 0 ]; then
    echo "✅ 推送成功！"
    echo "📦 仓库地址：$GITHUB_REPO"
else
    echo "❌ 推送失败"
fi
