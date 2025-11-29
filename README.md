# TORO-Configs

これは、Minecraft クリエイティブサーバー「**TORO Server**」で使用している公開できる範囲の設定ファイルです。

<https://github.com/TORO-Server/TORO-Configs-Enforcer> が必要です。

## ディレクトリ構成

- `/main` メインサーバーの設定ファイル

- `docker-compose.yml` ローカルでの動作確認、適用環境用

- `.env.example` 環境変数の設定例ファイル

- `update.sh` 設定の更新、適用スクリプト

## 環境構築と使用方法

### 1. リポジトリのクローン

```bash
git clone https://github.com/TORO-Server/TORO-Configs.git
cd TORO-Configs
```

### 2. 環境変数の設定と更新スクリプトの実行

```bash
# .env ファイルを作成
cp .env.example .env

# 必要に応じて .env ファイルを編集
vi .env
```

## コントリビューション

TORO Server の設定改善に関するプルリクエストは歓迎します。

変更を加える際は、既存の設定を破壊しないよう注意してください。

1. このリポジトリをフォークします。

2. 変更を加えたブランチを作成します。

3. プルリクエストを送信してください。
