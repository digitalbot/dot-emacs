;;;----------------------------------------
;;; smart-newline
;;;----------------------------------------


(require 'smart-newline)
(add-hook 'c-mode-common-hook
          (lambda ()
            (smart-newline-mode 1)))
(add-hook 'cperl-mode-hook
          (lambda ()
            (smart-newline-mode 1)))
