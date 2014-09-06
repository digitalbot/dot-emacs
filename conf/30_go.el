;;;----------------------------------------
;;; go
;;;----------------------------------------


(add-hook 'go-mode-hook
          '(lambda ()
             (require 'go-autocomplete)
             (setq tab-width 4)
             (add-hook 'before-save-hook 'gofmt-before-save)))
