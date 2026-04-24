#!/bin/bash
# JapanLife デプロイスクリプト
# 使い方: ./deploy.sh "コミットメッセージ"
# git push すると Vercel が自動デプロイ

MSG=${1:-"update"}

cd "$(dirname "$0")"

echo "Staging..."
git add index.html

echo "Committing: $MSG"
git commit -m "$MSG"

echo "Pushing to GitHub (Vercel auto-deploy)..."
git push origin main

echo "Done! Vercel deployment triggered. https://japanlife.vercel.app"
