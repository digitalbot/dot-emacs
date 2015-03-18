;;;----------------------------------------
;;; eshell
;;;----------------------------------------

(require 'eshell)
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/less (&rest args)                    
  "Invoke `view-file' on the file.                 
\"less +42 foo\" also goes to line 42 in the buffer,"
  (interactive)                                    
  (while args                                      
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
	(let* ((line (string-to-number (match-strig1 (pop args))))
	       (file (pop args)))                  
	  (view-file file)                         
	  (goto-line line))                        
      (view-file (pop args)))))


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
(setq eshell-cmpl-ignore-case t)
(setq eshell-hist-ignoredups nil)
(setq eshell-last-dir-ring-size 1024)

(require 'em-prompt)
(custom-set-faces
 '(eshell-prompt-face ((t (:foreground "violet" :bold nil)))))

(when nt-p
  (custom-set-variables
   '(eshell-hosts-file "c:/Windows/System32/drivers/etc/hosts")))

(eval-after-load 'eshell
  '(progn (require 'eshell-autojump nil t)
          (defalias 'eshell/z 'eshell/j)))


;; エスケープシーケンスを処理
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)

(add-hook 'eshell-load-hook 'ansi-color-for-comint-mode-on)

(require 'ansi-color)

(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))

(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)
