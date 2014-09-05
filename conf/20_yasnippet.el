;;;----------------------------------------
;;; yasnippet
;;;----------------------------------------

(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))

(setq yas-key-syntaxes (nreverse yas-key-syntaxes))
(defun fun (args)
  (interactive "P")
  )
(custom-set-variables '(yas-trigger-key "TAB"))

(yas-global-mode 1)
(call-interactively 'yas-reload-all)
