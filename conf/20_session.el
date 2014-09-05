;;;----------------------------------------
;;; session
;;;----------------------------------------


(require 'session)
(add-hook 'after-init-hook
          '(lambda ()
             (setq session-initialize '(de-saveplace session keys menus))
             (setq session-global-include
                   '((kill-ring 100)
                     (session-file-alist 500 t)
                     (file-name-history 500))
                   )
             (setq session-global-exclude
                   `(,@(apropos-internal (concat "^helm.*" session-globals-regexp) 'boundp)))
             (session-initialize)
             ))
(setq session-save-print-spec '(t nil 40000))
