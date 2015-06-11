;;;----------------------------------------
;;; others
;;;----------------------------------------


;; org
(setq auto-mode-alist
      (append '(("\\.\\(txt\\)$" . org-mode))
              auto-mode-alist))
(setq org-startup-truncated nil)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "WIP(i)" "DONE(d)")))
(org-ac/config-default)

;; (require 'os-gfm)

;; markdown-mode
(setq auto-mode-alist
      (append '(("\\.\\(md\\)$" . markdown-mode))
              auto-mode-alist))
;; (setq markdown-css-path (concat user-emacs-directory "etc/github.css"))
(setq markdown-css-path
      (concat "file://" (expand-file-name (concat user-emacs-directory "etc/github.css"))))
(when windows-p
  (if (and (executable-find "iconv") (executable-find "pandoc"))
      (setq markdown-command "iconv -f sjis -t utf-8 | pandoc -s -S -p --template=html-github -f markdown_github")
    (setq markdown-command "perl C:/strawberry/perl/site/bin/Markdown.pl"))
  (setenv "LC_ALL" "C"))


;; paredit
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interacton-mode-hook 'enable-paredit-mode)


;; js
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
