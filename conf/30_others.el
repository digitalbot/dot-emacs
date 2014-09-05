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
(setq markdown-css-path "C:/Users/kosuke/.emacs.d/etc/github.css")
;;(setq markdown-command "perl C:/strawberry/perl/site/bin/Markdown.pl")
(setq markdown-command "iconv -f sjis -t utf-8 | pandoc -s -S -p --template=html-github -f markdown_github")
(setenv "LC_ALL" "C")


;; go
(add-hook 'go-mode-hook
          '(lambda ()
             (require 'go-autocomplete)
             (setq tab-width 4)
             (add-hook 'before-save-hook 'gofmt-before-save)))
