;;;----------------------------------------
;;; doc
;;;----------------------------------------

;; eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'eldoc-mode)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")

;; c-eldoc
(load "c-eldoc")
(my/c-add-hook
 '(lambda ()
   (set (make-local-variable 'eldoc-idle-delay) 0.2)
   (c-turn-on-eldoc-mode)))
