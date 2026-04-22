#!/bin/bash
# JapanLife デプロイスクリプト
# 使い方: ./deploy.sh "コミットメッセージ"

MSG=${1:-"update"}

cd "$(dirname "$0")"

echo "📦 Staging..."
git add index.html

echo "💬 Committing: $MSG"
git commit -m "$MSG"

echo "🚀 Pushing to GitHub..."
git push origin main

echo "⚡ Deploying to Vercel..."
vercel --prod

echo "✅ Done! https://japanlife.vercel.app"
