;;;----------------------------------------
;;; util
;;;----------------------------------------


;; emacsclient
(require 'server)
(unless (server-running-p) (server-start))

;; open-junk-file
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y%m%d-%H%M%S.")

;; kill process when quit
(defadvice save-buffers-kill-terminal (before my-save-buffers-kill-terminal activate)
  (when (process-list)
    (dolist (p (process-list))
      (set-process-query-on-exit-flag p nil))))

;; unique
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; recentf
(setq recentf-auto-cleanup 'never)
(recentf-mode 1)
;; recentf-ext
(setq recentf-max-menu-items 8000)
(setq recentf-max-saved-items 10000)

;; auto-save-buffer
(setq auto-save-buffers-enhanced-interval 1)
(setq auto-save-buffers-enhanced-quiet-save-p t)
(auto-save-buffers-enhanced t)
(global-set-key (kbd "C-x a s") 'auto-save-buffers-enhanced-toggle-activity)

(require 'savekill)

;; duplicate-thing
(global-set-key (kbd "C-,") 'duplicate-thing)
(global-set-key (kbd "C-c ,") 'duplicate-thing)

;; comment-dwim-2
(global-set-key (kbd "M-;") 'comment-dwim-2)


;;--- function ---
(defun load-dot-emacs()
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun go-dot-emacs()
  (interactive)
  (find-file user-emacs-directory))

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

