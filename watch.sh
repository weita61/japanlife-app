#!/bin/bash
# JapanLife 自動デプロイ監視スクリプト
# 使い方: ./watch.sh
# index.html を保存するたびに git commit → push → Vercel 自動デプロイ

DIR="$(dirname "$0")"
TARGET="$DIR/index.html"

echo "Watching $TARGET ..."
echo "index.html を保存すると自動で git push されます。Ctrl+C で停止。"

fswatch -o "$TARGET" | while read -r; do
  cd "$DIR"

  # 変更がなければスキップ
  if git diff --quiet index.html; then
    continue
  fi

  TIMESTAMP=$(date "+%Y-%m-%d %H:%M")
  echo "[$TIMESTAMP] 変更を検知 → commit & push"

  git add index.html
  git commit -m "auto: update $TIMESTAMP"
  git push origin main

  echo "[$TIMESTAMP] push 完了 → Vercel デプロイ中..."
done
