;;;----------------------------------------
;;; util
;;;----------------------------------------


;; emacsclient
(require 'server)
(unless (server-running-p) (server-start))

;; kill process when quit
(defadvice save-buffers-kill-terminal (before my-save-buffers-kill-terminal activate)
  (when (process-list)
    (dolist (p (process-list))
      (set-process-query-on-exit-flag p nil))))

;; unique
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; dired and wdired
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
(setq wdired-allow-to-change-permissions t)
(setq dired-dwim-target t)
(setq dired-recursive-copies 'always)
(setq dired-isearch-filenames t)

;; ace jump
(global-set-key (kbd "C-q SPC") 'ace-jump-mode)

;; recentf
(setq recentf-auto-cleanup 'never)
(recentf-mode 1)
;; recentf-ext
(setq recentf-max-menu-items 8000)
(setq recentf-max-saved-items 10000)

;; anzu
(global-anzu-mode +1)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-use-migemo t))
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)

;; auto-save-buffer
(setq auto-save-buffers-enhanced-interval 1)
(auto-save-buffers-enhanced t)

(require 'savekill)

;; duplicate-thing
(global-set-key (kbd "C-,") 'duplicate-thing)
(global-set-key (kbd "C-c ,") 'duplicate-thing)


;;--- function ---
(defun dot-emacs()
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun kill-region-or-backward-kill-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (point) (mark))
    (backward-kill-word 1)))

;; split window
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-o") 'other-window-or-split)

