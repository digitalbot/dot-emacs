;;;----------------------------------------
;;; auto-complete
;;;----------------------------------------


(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case 'smart)
(add-to-list 'ac-modes 'cobol-mode)

(define-key ac-completing-map (kbd "M-n") 'ac-next)
(define-key ac-completing-map (kbd "M-p") 'ac-previous)
(define-key ac-completing-map (kbd "<backtab>") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
(ac-set-trigger-key "TAB")
