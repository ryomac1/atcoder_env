# AtCoder Environment with VSCode and Docker

## Overview

- 本プロジェクトは、AtCoder の問題を効率的に解くための環境構築を目指しています。
- `VSCode`, `Docker`, `atcoder-cli` を組み合わせて使用します。
- 使用可能言語はpython, C++です。

## Prerequisites

- Docker
- Docker Compose
- VSCode
- Remote - Containers (VSCode Extension)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)をインストールして起動しておく必要があります。

## Environments

- python 3.11.4
  - poetry
  - ruff
  - mypy
  - ACL for python
- C++
  - gcc
  - ACL

## Setup

1. Docker イメージの build とコンテナの起動

   ```bash
   docker compose up -d --build
   ```

2. VSCode でリモートコンテナに接続します。[Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)拡張機能が必要です。

## Usage
基本的にmain配下にて自由に使うことを想定していますが、src/sample下にpythonとC++のサンプルファイルがあります

### python
- sampleの使用方法
  - src/sampleにa.py,b.pyがあります。
  - どちらもNをうけとってそのまま出力するファイルです
  - `python a.py`で実行できます
  - 右上の>やcommmand + returnでも実行できます
  - a.pyは一般的な書き方、b.pyはファイル内に入力まで書いておけるやり方です
- Libraryの追加
  - `poetry add library_name`で追加できます

### C++
- src/samplにa.cppがあります
- どちらもNをうけとってそのまま出力するファイルです
- `g++ a.cpp -o a`でコンパイルして
- `./a`で実行できます
- もしくは右上の>でコンパイルから実行までされます


### Usage for AtCoder CLI

1. Online Judge Tools にログインする: `oj login https://atcoder.jp/`
2. AtCoder のアカウントでログインする: `acc login`
   - `abc001/` ディレクトリが作成されます。
3. 作成したコンテストのディレクトリに移動する: `cd abc001/`
4. コンテスト情報を表示する: `acc contest`
5. タスクリストを表示する: `acc tasks`
6. タスクを追加する: `acc add`
7. 追加したタスクのディレクトリに移動する（例：タスク a）: `cd a/`
8. 解答コードを記述する（例：main.py）: `touch main.py`
9. 解答コードをテストする : `test` or `oj t -c "python3 ./main.py" -d ./tests/`
10. 解答を提出する:
    - python で提出したい場合 `subp` or `acc s main.py`
    - PyPy で提出したい場合 `sub` or `acc s main.py -- --guess-python-interpreter pypy`

詳細なヘルプは `acc -h` や `acc [command] -h` を実行して確認できます。

### Reference
- [atcoder-cli GitHub](https://github.com/Tatamo/atcoder-cli)
