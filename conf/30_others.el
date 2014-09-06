;;;----------------------------------------
;;; others
;;;----------------------------------------


(setq auto-mode-alist
      (append '(("\\.\\(txt\\)$" . org-mode))
              auto-mode-alist))

;; markdown-mode
(setq auto-mode-alist
      (append '(("\\.\\(md\\)$" . markdown-mode))
              auto-mode-alist))
(when windows-p
  (setq markdown-css-path "~/.emacs.d/etc/github.css")
  ;;(setq markdown-command "perl C:/strawberry/perl/site/bin/Markdown.pl")
  (setq markdown-command "iconv -f sjis -t utf-8 | pandoc -s -S -p --template=html-github -f markdown_github")
  (setenv "LC_ALL" "C")
  )


;; paredit
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interacton-mode-hook 'enable-paredit-mode)
