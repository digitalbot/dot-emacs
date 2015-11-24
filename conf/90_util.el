;;;----------------------------------------
;;; util
;;;----------------------------------------


;; emacsclient
(require 'server)
(if windows-p
    (server-force-delete))
(server-start)

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

;; auto-save-buffer
(setq auto-save-buffers-enhanced-interval 1)
(setq auto-save-buffers-enhanced-quiet-save-p t)
(auto-save-buffers-enhanced t)
(setq auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
(setq auto-save-buffers-enhanced-file-related-with-scratch-buffer
      (locate-user-emacs-file "scratch"))
(global-set-key (kbd "C-x a s") 'auto-save-buffers-enhanced-toggle-activity)

(require 'savekill)

;; duplicate-thing
(global-set-key (kbd "C-,") 'duplicate-thing)
(global-set-key (kbd "C-c ,") 'duplicate-thing)

;; comment-dwim-2
(global-set-key (kbd "M-;") 'comment-dwim-2)

(require 'ediff)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; hideshow
(setq hs-isearch-open nil)

;; tab-jump-out
;; yasnippetと併用する場合はこの設定をする
(setq yas-fallback-behavior '(apply tab-jump-out 1))

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

(defun my/get-curernt-path ()
    (if (equal major-mode 'dired-mode)
	default-directory
	(buffer-file-name)))

(defun my/copy-current-path ()                                                         
  (interactive)
  (let ((fPath (my/get-curernt-path)))
    (when fPath
      (message "stored path: %s" fPath)
      (kill-new (file-truename fPath)))))

(global-set-key (kbd "C-c 0") 'my/copy-current-path)
