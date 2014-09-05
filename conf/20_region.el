;;;----------------------------------------
;;; region
;;;----------------------------------------


(cua-mode t)
(setq cua-enable-cua-keys nil)

(require 'thingopt)
(define-thing-commands)
(global-set-key (kbd "C-@") 'mark-word*)
(global-set-key (kbd "C-(") 'mark-up-list)

(require 'expand-region)
(global-set-key (kbd "C-`") 'er/expand-region)
(transient-mark-mode t)
