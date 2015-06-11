;;;----------------------------------------
;;; dired
;;;----------------------------------------

;; dired and wdired
(require 'dired)
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
(setq wdired-allow-to-change-permissions t)
(setq dired-dwim-target t)
(setq dired-recursive-copies 'always)
(setq dired-isearch-filenames t)
(define-key dired-mode-map (kbd "(") 'dired-hide-details-mode)
(define-key dired-mode-map (kbd ")") 'dired-hide-details-mode)
(add-to-list 'dired-compress-file-suffixes '("\\.zip\\'" ".zip" "unzip"))

;; dired-filter
(defun my-dired-mode-hooks()
  (dired-filter-mode))
(add-hook 'dired-mode-hook 'my-dired-mode-hooks)

;; async
(with-eval-after-load "dired-aux" (require 'dired-async))

;; dired-k
(define-key dired-mode-map (kbd "g") 'dired-k)
(add-hook 'dired-initial-position-hook 'dired-k)
