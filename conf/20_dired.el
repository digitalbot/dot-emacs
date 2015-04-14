;;;----------------------------------------
;;; dired
;;;----------------------------------------

;; dired and wdired
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
(setq wdired-allow-to-change-permissions t)
(setq dired-dwim-target t)
(setq dired-recursive-copies 'always)
(setq dired-isearch-filenames t)
(define-key dired-mode-map (kbd "(") 'dired-hide-details-mode)
(define-key dired-mode-map (kbd ")") 'dired-hide-details-mode)

;; dired-filter
(defun my-dired-mode-hooks()
  (dired-filter-mode))

(add-hook 'dired-mode-hook 'my-dired-mode-hooks)
