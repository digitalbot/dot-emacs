;;;----------------------------------------
;;; grep
;;;----------------------------------------

;; ag
(require 'ag)
(custom-set-variables
 '(ag-highlight-search t)
 '(ag-reuse-window 'nil)
 '(ag-reuse-buffers 'nil))

;; wgrep
(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)
(setq wgrep-auto-save-buffer t)
(setq wgrep-change-readonly-file t)

;; and helm-ag is in helm.el
