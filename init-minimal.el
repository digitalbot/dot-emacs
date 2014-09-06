;;;----------------------------------------
;;; init-minimal
;;;----------------------------------------

;; no start-up, back-up
(setq inhibit-startup-message t)
(setq make-backup-file nil)
(setq auto-save-default nil)
(setq backup-inhibited t)

;; no menu tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; auto-revert
(setq global-auto-revert-mode t)

;; buffer-menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; delete last whitespace
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; hilight line
(require 'hl-line)
(global-hl-line-mode)
(setq hl-line-face 'underline)

;; icomplete
(icomplete-mode 1)

;; partial-completion
(setq partial-completion-mode 1)

;; find-file big char small char a A
(setq completion-ignore-case t)

;; case insensitive
(custom-set-variables
 '(read-file-name-completion-ignore-case t))

;; dired
(require 'dired-x)
(require 'wdired)
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)

;; split window
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-o") 'other-window-or-split)

;; show line and column
(column-number-mode t)
(line-number-mode t)

;; hilight ()
(show-paren-mode 1)

;; image
(auto-image-file-mode t)

;; C-w
(defun kill-region-or-backward-kill-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (point) (mark))
    (backward-kill-word 1)))

;; keybind
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "C-x C-h") 'help-command)
(global-set-key (kbd "M-b") 'backward-word)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "C-c C-r") 'revert-buffer)
(global-set-key (kbd "C-c C-g") 'goto-line)
(global-set-key (kbd "C-c r") 'replace-regexp)
(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)
(global-set-key (kbd "C-m") 'newline-and-indent)
(setq kill-whole-line t)

;; tab key
(setq c-tab-always-indent t)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq indent-line-function 'indent-relative-maybe)
(add-hook 'java-mode-hook
	  (lambda ()
	    (setq c-basic-offset 4)))

;; background
(custom-set-faces
 '(default ((t
             (:background "black" :foreground "#55FF55")
             )))
 '(cursor ((((class color)
             (background dark))
            (:background "#00AA00"))
           (((class color)
             (background light))
            (:background "#000000"))
           (t ())
           )))
