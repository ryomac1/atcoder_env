# AtCoder Environment with VSCode and Docker

## Overview

本プロジェクトは、AtCoder の問題を効率的に解くための環境構築を目指しています。VSCode, Docker, `atcoder-cli` を組み合わせて使用します。

## Prerequisites

- Docker
- Docker Compose
- VSCode

## Setup

1. Docker イメージの build とコンテナの起動

   ```bash
   docker-compose up -d --build
   ```
2. VSCode でリモートコンテナに接続します。[Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)拡張機能が必要です。

## Usage

### wAtCoder CLI (`acc`)

`atcoder-cli`（通称：acc）は AtCoder の問題を効率的に解くための CLI ツールです。基本的な使い方は以下の通りです：

1. **ログイン**: `acc login` コマンドを実行して AtCoder にログインします。
2. **コンテストの問題をダウンロード**: `acc new [contest ID]` コマンドで指定したコンテストの全問題をダウンロードします。
3. **問題を解く**: ダウンロードした問題を開き、解答コードを書きます。
4. **テスト**: `acc test` コマンドで解答コードのテストを実行します。
5. **提出**: 解答が正しいと判断されたら、`acc submit [file]` コマンドで解答を提出します。

詳細なヘルプは `acc -h` や `acc [command] -h` を実行して確認できます。
