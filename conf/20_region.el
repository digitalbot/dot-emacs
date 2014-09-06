;;;----------------------------------------
;;; region
;;;----------------------------------------


(cua-mode t)
(setq cua-enable-cua-keys nil)

;; thingopt
(require 'thingopt)
(define-thing-commands)
(if window-system
    (progn
      (global-set-key (kbd "C-(") 'mark-up-list)
      (global-set-key (kbd "C-@") 'er/expand-region)    ;; expand-region

      )
  (progn
    (global-set-key (kbd "C-c @") 'er/expand-region)
    )
  )

(transient-mark-mode t)
