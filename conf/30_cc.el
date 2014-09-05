;;;----------------------------------------
;;; cc
;;;----------------------------------------


;;a align
(c-set-offset 'statement-count 'c-lineup-math)
(c-set-offset 'case-label '+)

;; hook
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "cc-mode")
             (setq-default indent-tabs-mode nil)
             (setq-default tab-width 4)
             ))
