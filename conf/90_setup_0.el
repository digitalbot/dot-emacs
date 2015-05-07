;;;----------------------------------------
;;; setup
;;;----------------------------------------


;; no start-up, back-upa
(setq inhibit-startup-message t)
(setq make-backup-file nil)
(setq auto-save-default nil)
(setq backup-inhibited t)

;; yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)
