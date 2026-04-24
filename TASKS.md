# やさしい日本語AI — 開発タスクリスト

このファイルはClaude Codeが自律的に読み進め、実装を進めるためのタスク定義です。
完了したタスクは `[x]` に変更し、コミットしてください。

---

## Phase 1: Gemini APIを使ったやさしい日本語変換機能

### タスク 1: APIエンドポイント設計（index.html内に実装）
- [ ] `index.html` に やさしい日本語変換UIを追加する
  - 入力テキストエリア（日本語原文）
  - 変換ボタン
  - 出力テキストエリア（やさしい日本語）
  - ローディング表示
- [ ] Gemini 2.5 Flash-Lite API（`https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-preview-05-20:generateContent`）をfetchで呼び出す実装
- [ ] APIキーは `window.GEMINI_API_KEY` 変数から読む（後でユーザーが入力またはlocalStorageに保存）

### タスク 2: few-shotプロンプト設計
- [ ] システムプロンプトを作成する
  - やさしい日本語の変換ルール（短い文・和語優先・ふりがなつき）を指示
  - 変換例（few-shot）を3〜5件埋め込む
- [ ] few-shot例：
  - 「就労ビザの更新手続きについて」→「はたらくためのビザを、もう一ど もらう てつづき について」
  - 「在留資格変更許可申請書」→「にほんに いる ための しかくを かえる もうしこみしょ」

### タスク 3: UI/UXの調整
- [ ] 変換結果にふりがな表示（rubyタグ or 括弧表記）
- [ ] コピーボタンの追加
- [ ] 対応言語選択（日本語→やさしい日本語、日本語→英語・ベトナム語・インドネシア語・中国語）

### タスク 4: APIキー設定UI
- [ ] 設定画面にGemini APIキー入力欄を追加
- [ ] localStorageに暗号化せず保存（開発段階）
- [ ] キー未設定時はデモモード（固定レスポンス返却）で動作させる

---

## 実装メモ

- アプリはシングルHTMLファイル（`index.html`）のPWA
- ビルドシステムなし。純粋なHTML/CSS/JS
- Vercelへ自動デプロイ済み（`deploy.sh` 参照）
- Gemini APIは無料枠（RPD: 1,000）で十分
- やさしい日本語ルールは `.claude/memory/project_japanlife_yasashii.md` を参照

---

## 完了済みタスク

（なし）
