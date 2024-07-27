#PATH
export CPLUS_INCLUDE_PATH=/workspace/.config/ac-library # atcoder library for c++

# history
HISTFILE=$HOME/.zsh_history     # 履歴を保存するファイル
HISTSIZE=100000                 # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000                # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history       # 実行時に履歴をファイルにに追加していく
setopt share_history            # 履歴を他のシェルとリアルタイム共有する

setopt hist_ignore_all_dups     # ヒストリーに重複を表示しない
setopt hist_save_no_dups        # 重複するコマンドが保存されるとき、古い方を削除する。
setopt extended_history         # コマンドのタイムスタンプをHISTFILEに記録する
setopt hist_expire_dups_first   # HISTFILEのサイズがHISTSIZEを超える場合は、最初に重複を削除します

# enable completion
autoload -Uz compinit; compinit
autoload -Uz colors; colors
# プロンプトをfullpath にして色を緑色にする
export PS1='%F{green}%d$ %f'

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# カッコを自動補完
setopt auto_param_keys
# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs
# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu
# スペルミス訂正
setopt correct
# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# 語の途中でもカーソル位置で補完
setopt complete_in_word
# ディレクトリ名だけでcdする
setopt auto_cd
# ビープ音を消す
setopt no_beep
#cdしたら自動的にls
chpwd() {
	ls
}

# コマンドを途中まで入力後、historyから絞り込み
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end

# setting alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vs='code'
alias ls='ls -G'
# c++関係のalias
alias g="g++ -std=c++23 -O2"
alias a="./a.out"
alias ga="g++ -std=c++23 -O2 a.cpp -o a.out && ./a.out"
# python関係のalias
alias p="python3"
alias python="python3"
# acc関係のalias
alias test='oj t -c "python3 ./main.py" -d ./tests/'
alias sub='acc s main.py -- --guess-python-interpreter pypy -w 0 -y'
alias subp='acc s main.py -w 0 -y'
alias an='acc new'
