;;;----------------------------------------
;;; eshell
;;;----------------------------------------

;; eshell での補完に auto-complete.el を使う
(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
            (define-key eshell-mode-map (kbd "M-n") 'helm-esh-pcomplete)
            ;; (define-key eshell-mode-map (kbd "C-a") 'eshell-bol)
            ))

(setq eshell-ask-to-save-history 'always)
(setq eshell-hist-ignoredups t)
(when nt-p
  (custom-set-variables '(eshell-hosts-file "c:/Windows/System32/drivers/etc/hosts")))

(require 'eshell-autojump)
(defalias 'eshell/z 'eshell/j)

