;;;----------------------------------------
;;; setup
;;;----------------------------------------


;; auto-revert
(setq global-auto-revert-mode t)

;; delete last whitespace
(setq require-final-newline t)
;;(defvar my:delete-trailing-whitespace-exclude-suffix
;;  (list "\\.rd$" "\\.md$" "\\.rbt$" "\\.txt$"))
;;(defun my:delete-trailing-whitespace ()
;;  (interactive)
;;  (cond
;;   ((equal nil
;;           (loop for pattern in my:delete-trailing-whitespace-exclude-suffix
;;                 thereis (string-match pattern buffer-file-name)))
;;    (delete-trailing-whitespace))))
;;(add-hook 'before-save-hook 'my:delete-trailing-whitespace)
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; truncate-lines
(setq truncate-partial-width-windows nil)
;; (setq visual-line-fringe-indicators '(t t))
;; (global-visual-line-mode)

;; partial-completion
(setq partial-completion-mode 1)

;; find-file big char small char a A
(setq completion-ignore-case t)

;; case insensitive
(custom-set-variables
 '(read-file-name-completion-ignore-case t))

;; Bell
(setq ring-bell-function 'ignore)

;; symlink to truename
(setq-default find-file-visit-truename t)

(setq eval-expression-print-level nil
      eval-expression-print-length nil
      eval-expression-debug-on-error nil)

(when windows-p
  (setq default-input-method "W32-IME")
  (setq-default w32-ime-mode-line-state-indicator "[A]")
  (setq w32-ime-mode-line-state-indicator-list '("[A]" "[J]" "[A]"))
  (w32-ime-initialize)
  (wrap-function-to-control-ime 'universal-argument t nil)
  (wrap-function-to-control-ime 'read-string nil nil)
  (wrap-function-to-control-ime 'read-from-minibuffer nil nil)
  (wrap-function-to-control-ime 'y-or-n-p nil nil)
  (wrap-function-to-control-ime 'yes-or-no-p nil nil)
  (wrap-function-to-control-ime 'map-y-or-n-p nil nil))

