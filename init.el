;;;----------------------------------------
;;; init
;;;----------------------------------------


;; language
(set-language-environment 'japanese)

;; avoid warn
(require 'cl)
(setq byte-compile-warnings
      '(free-vars
        unresolved
        callargs
        redefine
        obsolete
        noruntime
        cl-functions
        interactive-only
        make-local))

;; load-path
;;(setq load-path (cons user-emacs-directory load-path))
(let ((default-directory (concat user-emacs-directory "site-lisp")))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))

;; for older byte-compiled file issue
(when (version<= "24.4" emacs-version)
  (setq load-prefer-newer t))

;; package
(when (require 'package nil t)
  (when (version<= "24.4" emacs-version)
    (fset 'package-desc-vers 'package--ac-desc-version))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
  
  (defvar my-package-list
    '(
      packed adaptive-wrap
      auto-async-byte-compile auto-highlight-symbol auto-save-buffers-enhanced
      init-loader exec-path-from-shell diminish
      clojure-mode cider clojure-cheatsheet clojure-snippets slime paredit
      auto-complete ac-cider ac-python ac-slime go-autocomplete
      c-eldoc codic google-translate
      el-spec el-spy elscreen org org-ac
      magit git-gutter gitconfig-mode gitignore-mode
      go-mode go-snippets
      migemo anzu gtags fill-column-indicator ag wgrep all-ext
      helm helm-ag helm-c-yasnippet helm-descbinds helm-gtags
      helm-ls-git helm-migemo helm-swoop helm-themes
      highlight-indentation highlight-parentheses hl-line+ volatile-highlights powerline
      js2-mode json-mode web-mode emmet-mode markdown-mode cperl-mode
      mykie key-combo ace-jump-mode ace-isearch
      multiple-cursors thingopt duplicate-thing expand-region
      open-junk-file quickrun
      popwin pos-tip
      recentf-ext savekill session
      shell-pop multi-term eshell-prompt-extras
      smart-newline smartparens smartrep smooth-scroll
      undohist undo-tree point-undo
      yascroll yasnippet
      comment-dwim-2
      ))
  (let ((not-installed
         (loop for package in my-package-list
               when (not (package-installed-p package))
               collect package)))
    (when not-installed
      (package-refresh-contents)
      (dolist (package not-installed)
        (package-install package))))
  )


;; init-loader
(if (require 'init-loader nil t)
     (init-loader-load (concat user-emacs-directory "conf"))
   (load-file (concat user-emacs-directory "init-minimal.el")))
   

(cd "~/")
