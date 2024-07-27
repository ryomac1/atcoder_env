# AtCoder Environment with VSCode and Docker

## Overview

- 本プロジェクトは、AtCoder の問題を効率的に解くための環境構築を目指しています。
- `VSCode`, `Docker`, を組み合わせて使用します。
- 使用可能言語はpythonです。

## Prerequisites

- Docker
- Docker Compose
- VSCode
- Remote - Containers (VSCode Extension)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)をインストールして起動しておく必要があります。

## Environments

- python 3.11.4
  - ruff
  - mypy
  - ACL for python

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
  - `rye add library_name`で追加できます
