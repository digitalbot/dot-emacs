Emacsの使い方
==================

前提
----------

* `a` は単独で `a` キーを入力
* `C-a` は `Control` キーと `a` キーを同時入力
* `C-A` は `Control` キーと `A` キー(シフト + a)を同時入力
* `M-a` は `Alt` キーと `a` キーを同時入力
* `C-M-a` は `Control` キーと `Alt` キーと `a` キーを同時入力
* `C-a a` は `Control` キーと `a` キーを同時入力した後に `a` を単独入力
* `RET` は `Enter` キーを意味する
* `TAB` はタブキーを意味する
* 何か意図しないことがあったら `C-g` 連打
    + 勝手に画面分割したときや、何かの入力をやめたときなど


基本操作
----------

### 移動

* `C-a` は現在位置によって挙動が変わる
    + 文中にいる場合: 行頭に移動
    + 行頭にいる場合: ファイル(バッファ)の先頭へ移動
    + `C-u` の後に `C-a` で __インデントの頭__ へ移動

* `C-e` は現在位置によって挙動が変わる
    + 文中にいる場合: 行末に移動
    + 行末にいる場合: ファイル(バッファ)の末尾へ移動

* `C-.` で __位置のアンドゥ(戻る)__ が可能
    + つまり、 行頭での `C-a` でファイル先頭に移動してしまった後、元の位置に戻りたいときなどに `C-.` で戻ってくることができる
        - ちなみに、 `C->` で __位置の進む__ になる

* `C-n`, `C-p` は間を置かずに素早く連続で実行すると徐々に加速する
    + 例: 連続で10回目移行は2行飛ばしで移動するようになる


### 文字列選択・操作

* `C-w` は選択状態かどうかで挙動が変わる
    + 選択していないと __前の単語(一塊)を切り取り__
    + 選択状態だと __選択範囲を切り取り__
    + 選択状態且つ `C-u` の後に `C-w` で __削除せずに単にコピー__

* `C-q C-a` でバッファ全選択

* `C-k` は位置によって挙動が変わる
    + 行頭で実行すると文末の改行コードごと削除(つまり1行まるごと)
    + 文中で実行すると文末の改行コードの前までを削除

* `C-q` のあとに `j` (下) or `k` (上)で複数行にカーソルを増やせる
    + 選択状態だと同じモノを同時に選択する
        - `C-q` のあとに `*` で同じモノ全てを選択する
    + これは実際にやってみたほうが早い。 __カーソルが増える__ のがミソ

* `C-@` は単語選択
    + 例えば _i can f|ly._ という文があるとき( `|` はカーソル位置)に実行すると `fly` を選択する
    + 更に、`C-@` を連続で実行すると選択範囲が広がるので便利(カッコ類と相性が良い)
        - (a (b (c (d )))) ←で試そう
    + 単語選択した状態で `"` や `(` など一般にペアで使用するものを使うと、自動で囲んでくれる

* `C-c r` で実行した位置より下へ向かって置換コマンド(正規表現)が発動する
    + 範囲選択中だと選択範囲のみに実行
    + 置換のFromToを指定した後、ひとつひとつに対して適用するか問われるので、 `y` で置換実行、 `n` でスキップ、 `!` で一括置換となる

* `C-y` で貼付け可能
    + `C-y` 実行直後に `M-y` でそれ以前にkillring(クリップボードのようなもの)へ入れたものから貼り付け可能
    + 単体で `M-y` でいきなり履歴貼り付け可能

* `C-RET` で矩形選択モード
    + 画面下部に現れるヒントを頼りに選択や削除などができる
    + 注意点: 矩形貼り付けは矩形選択モードでしかできないので、一度矩形選択モードを抜けてから以前の矩形copy内容を貼り付ける場合は再度貼り付けたい場所で矩形選択モードに入る必要がある


### 画面操作

* `C-o` は画面分割しているかどうかで挙動が変わる
    + 既に画面分割しているときは分割している画面を順に移動
    + 画面がひとつの場合は画面を縦にふたつに分割する

* `C-q C-o` で画面分割をやめ、現在バッファのみを表示

* `C-z C-c` でタブを作成
    + `C-z C-p` で前のタブへ移動
        - `C-z p p p p` などで連続で移動可能
    + `C-z C-n` で次のタブへ移動
        - `C-z n n n n` などで連続で移動可能
    + `C-z C-k` でタブを削除(バッファは残るので他のタブから開ける)

* `C-+` で文字サイズを変更できる
    + 連続で実行できる。詳しくはミニバッファに表示される情報を見てね
        - 例: `C-+ + + + + - - + 0` とか練習してみて


### ディレクトリ・ファイル操作

* `C-q e` で現在ディレクトリをExplorerで開く


### Helm.el (絞り込み検索・実行コマンド)

* `C-x C-f` で現在ディレクトリからファイルを探してオープン
    + 文字を入力しながら絞り込みが可能、 `TAB` で補完も可能

* `C-;` で現在開いているバッファ・最近開いたバッファなど全てのリストからの絞り込みが可能

* `C-x C-r` で最近開いたファイルのみのファイル絞り込みが可能

* `M-x` が絞り込み可能になっている

### その他

* `C-t` はダイナミックマクロ
    + 直前の動作を繰り返すコマンド
        - 例えば `hogehoge` と入力した後に `C-t` を実行すると `hoge` と繰り返される
    + 工夫すると便利

* `C-\` で戻る、 `C-_` で進む
    + 更に、`C-x C-u` でリッチな戻る・進むが可能

* マークダウンファイル(.md)を開いているときに `C-c C-c p` でブラウザで整形されたHTMLファイルを見ることができる
    + 要 `Perl`, `_Markdown.pl` or `Pandoc`

memo
----------

### (参考) .emacs.dの構成(一部どうでも良いの省略)
```
~/.emacs.d
  |-- .gitignore
  |-- .gitmodules
  |-- .mc-lists.el
  |-- .session
  |-- ac-comphist.dat
  |-- eww-bookmarks
  |-- history
  |-- init-minimal.el
  |-- init.el
  |-- kill-ring-saved.el
  |-- README.md
  |-- scratch
  |-- srecode-map.el
  |-- tramp
  |-- .python-environments/
  |-- ac-dict/
  |-- auto-save-list/
  |-- bin/
  |     `-- byte-compile-conf.sh
  |-- conf/
  |     |-- 00_prepare.el
  |     |-- 03_path.el
  |     |-- 10_helm.el
  |     |-- 11_helm-fontfamily.el
  |     |-- 15_pos-tip.el
  |     |-- 16_popwin.el
  |     |-- 20_auto-complete.el
  |     |-- 20_autoinsert.el
  |     |-- 20_bm.el
  |     |-- 20_cmigemo.el
  |     |-- 20_dic.el
  |     |-- 20_dired.el
  |     |-- 20_dired_ext.el
  |     |-- 20_doc.el
  |     |-- 20_elscreen.el
  |     |-- 20_git.el
  |     |-- 20_global.el
  |     |-- 20_grep.el
  |     |-- 20_imenu.el
  |     |-- 20_isearch.el
  |     |-- 20_multiple-cursors.el
  |     |-- 20_quickrun.el
  |     |-- 20_recentf.el
  |     |-- 20_region.el
  |     |-- 20_session.el
  |     |-- 20_smartparens.el
  |     |-- 20_tramp.el
  |     |-- 20_undo.el
  |     |-- 20_view.el
  |     |-- 20_yasnippet.el
  |     |-- 25_flycheck.el
  |     |-- 30_cc.el
  |     |-- 30_cl.el
  |     |-- 30_clojure.el
  |     |-- 30_cobol.el
  |     |-- 30_go.el
  |     |-- 30_java.el
  |     |-- 30_js.el
  |     |-- 30_others.el
  |     |-- 30_perl.el
  |     |-- 30_python.el
  |     |-- 30_ruby.el
  |     |-- 30_web.el
  |     |-- 40_eshell.el
  |     |-- 40_shell.el
  |     |-- 50_byte-compile.el
  |     |-- 60_eww.el
  |     |-- 61_ace-link.el
  |     |-- 90_appearance.el
  |     |-- 90_font-face.el
  |     |-- 90_powerline.el
  |     |-- 90_scroll.el
  |     |-- 90_setup_0.el
  |     |-- 90_setup_1.el
  |     |-- 90_setup_2.el
  |     |-- 90_setup_3.el
  |     |-- 90_util.el
  |     |-- 99_helm-keybind.el
  |     |-- 99_keybind.el
  |     |-- 99_mykie.el
  |     |-- 99_private.el
  |     |-- 99_smart-newline.el
  |     `-- _26_key-combo.el
  |-- elpa/
  |-- eshell/
  |     |-- alias
  |     |-- history
  |     `-- lastdir
  |-- etc/
  |     `-- github.css
  |-- site-lisp/
  |     |-- cobol-mode.el
  |     |-- dmacro.el
  |     |-- eshell-autojump.el
  |     |-- load-theme-buffer-local.el
  |     |-- multi-scratch.el
  |     |-- ox-gfm.el
  |     |-- popup-pos-tip.el
  |     |-- python.el
  |     |-- save-frame-posize.el
  |     |-- sl.el
  |     `-- auto-java-complete/
  |-- snippets/
  |-- temp/
  |-- tmpl/
  |     |-- c-tmpl.c
  |     |-- elisp-tmpl.el
  |     |-- html-tmpl.html
  |     |-- Makefile-tmpl
  |     |-- perlheader-tmpl.pl
  |     `-- perlpackage-tmpl.pm
  |-- undohist/
  `-- url/
```


### (参考) 以下主要なキーバインドをgrepした結果
```
(global-set-key (kbd "C-q") ctrl-q-map)
(global-set-key (kbd "C-q C-q") 'quoted-insert)
(define-key global-map (kbd "C-x p") 'popwin:display-last-buffer)
(define-key ac-completing-map (kbd "M-n") 'ac-next)
(define-key ac-completing-map (kbd "M-p") 'ac-previous)
(define-key ac-completing-map (kbd "<backtab>") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
(define-key global-map (kbd "C-q C-i") 'auto-complete)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)
(global-set-key (kbd "M-RET") 'bm-toggle-or-helm)
(global-set-key (kbd "C-x t") 'google-translate-enja-or-jaen)
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "(") 'dired-hide-details-mode)
(define-key dired-mode-map (kbd ")") 'dired-hide-details-mode)
(define-key dired-mode-map (kbd "g") 'dired-k)
(define-key dired-mode-map (kbd "W")
(define-key dired-mode-map (kbd "E") 'os-open-dir)
(global-set-key (kbd "C-q e") 'os-open-dir)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(setq elscreen-prefix-key (kbd "C-z"))
(global-set-key (kbd "C-(") 'mark-up-list)
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-c @") 'er/expand-region)
(global-set-key (kbd "C-q C-v") 'view-mode)
(global-set-key (kbd "C-x C-u") 'undo-tree-visualize)
(global-set-key (kbd "C-\\") 'undo-tree-undo)
(global-set-key (kbd "C-?") 'undo-tree-redo)
(global-set-key (kbd "C-M-\\") 'undo-tree-redo)
(global-set-key (kbd "C-.") 'point-undo)
(global-set-key (kbd "C->") 'point-redo)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "C-x C-h") 'help-command)
(global-set-key (kbd "M-b") 'backward-word)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "C-c C-r") 'revert-buffer)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-q C-o") 'delete-other-windows)
(global-set-key (kbd "C-q g") 'goto-line)
(global-set-key (kbd "C-q C-.") '(lambda () (interactive) (insert "->")))
(global-set-key (kbd "C-q C-d") 'describe-bindings)
(global-set-key (kbd "M-d") 'kill-word-or-delete-horizontal-space)
(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c ;") 'helm-for-files)
(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-c i")   'helm-imenu)
(global-set-key (kbd "C-x b")   'helm-buffers-list)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-w") 'kill-region-or-backward-kill-word)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-w") 'kill-region-or-backward-kill-word)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "C-:") 'helm-select-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "C-:") 'helm-select-action)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(global-set-key (kbd "C-q C-y") 'helm-c-yas-complete)
(global-set-key (kbd "C-x C-d") 'helm-ls-git-ls)
(global-set-key (kbd "C-x a s") 'auto-save-buffers-enhanced-toggle-activity)
(global-set-key (kbd "C-,") 'duplicate-thing)
(global-set-key (kbd "M-;") 'comment-dwim-2)
(global-set-key (kbd "C-o") 'other-window-or-split)
(global-set-key (kbd "C-c 0") 'my/copy-current-path)
```
