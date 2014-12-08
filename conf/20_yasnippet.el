;;;----------------------------------------
;;; yasnippet
;;;----------------------------------------

(require 'yasnippet)
(setq yas-snippet-dirs
      (list (concat user-emacs-directory "snippets")))

(setq yas-key-syntaxes (nreverse yas-key-syntaxes))
(custom-set-variables '(yas-trigger-key "TAB"))

(yas-global-mode 1)
(call-interactively 'yas-reload-all)

