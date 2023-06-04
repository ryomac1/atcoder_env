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

### AtCoder CLI の使用方法

1. Online Judge Tools にログインする: `oj login https://atcoder.jp/`
2. AtCoder のアカウントでログインする: `acc login`
3. ログイン状態を確認する: `acc session`
   - ログインセッションはローカルファイルに保存されますが、パスワードは保存されません。
   - ログインセッションを削除するには `acc logout` を使用します。
4. 新規コンテストを作成する（例：abc001）: `acc new abc001`
   - `abc001/` ディレクトリが作成されます。
5. 作成したコンテストのディレクトリに移動する: `cd abc001/`
6. コンテスト情報を表示する: `acc contest`
7. タスクリストを表示する: `acc tasks`
8. タスクを追加する: `acc add`
9. 追加したタスクのディレクトリに移動する（例：タスク a）: `cd a/`
10. 解答コードを記述する（例：main.py）: `touch main.py'
11. 解答コードをテストする 'test'
12. 解答を提出する: `acc submit main.py`

詳細なヘルプは `acc -h` や `acc [command] -h` を実行して確認できます。
