;;;----------------------------------------
;;; eshell
;;;----------------------------------------

(require 'eshell)
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(require 'auto-complete)
(require 'pcomplete)
(add-to-list 'ac-modes 'eshell-mode)
(ac-define-source pcomplete
  '((candidates . pcomplete-completions)))

(defun my-ac-eshell-mode ()
  (setq ac-sources
        '(ac-source-pcomplete
          ac-source-filename
          ac-source-files-in-current-dir
          ac-source-dictionary
          ac-source-words-in-buffer)))

(add-hook 'eshell-mode-hook
          (lambda ()
            (smartparens-mode 1)
            (my-ac-eshell-mode)
            (auto-complete-mode 1)
            (setq ac-auto-start nil)
            (local-set-key (kbd "C-,") 'helm-eshell-history)
            ;; (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
            ;; (define-key eshell-mode-map (kbd "M-n") 'helm-esh-pcomplete)
            ;; (define-key eshell-mode-map (kbd "C-a") 'eshell-bol)
            ))

(setq eshell-ask-to-save-history 'always)
(setq eshell-hist-ignoredups t)
(setq eshell-last-dir-ring-size 1024)

(require 'em-prompt)
(set-face-foreground 'eshell-prompt-face "violet")

(when nt-p
  (custom-set-variables '(eshell-hosts-file "c:/Windows/System32/drivers/etc/hosts")))

(eval-after-load 'eshell
  '(progn (require 'eshell-autojump nil t)
          (defalias 'eshell/z 'eshell/j)))
