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
  (split-window-vertically)
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
	(let* ((line (string-to-number (match-string 1 (pop args))))
	       (file (pop args)))
	  (view-file-other-window file)
	  (goto-line line))
      (view-file-other-window (pop args)))))

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
            (set (make-local-variable 'ac-auto-start) nil)
            (local-set-key (kbd "C-,") 'helm-eshell-history)
            ;; (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
            ;; (define-key eshell-mode-map (kbd "M-n") 'helm-esh-pcomplete)
            ;; (define-key eshell-mode-map (kbd "C-a") 'eshell-bol)
            ))

(setq eshell-ask-to-save-history 'always)
(setq eshell-cmpl-ignore-case t)
(setq eshell-hist-ignoredups nil)
(setq eshell-last-dir-ring-size 1024)


;; prompt
(require 'em-prompt)
(custom-set-faces
 '(eshell-prompt-face ((t (:foreground "violet" :bold nil)))))

(defun fish-path (path max-len)
  "Return a potentially trimmed-down version of the directory PATH, replacing
parent directories with their initial characters to try to get the character
length of PATH (sans directory slashes) down to MAX-LEN."
  (let* ((components (split-string (abbreviate-file-name path) "/"))
         (len (+ (1- (length components))
                 (reduce '+ components :key 'length)))
         (str ""))
    (while (and (> len max-len)
                (cdr components))
      (setq str (concat str
                        (cond ((= 0 (length (car components))) "/")
                              ((= 1 (length (car components)))
                               (concat (car components) "/"))
                              (t
                               (if (string= "."
                                            (string (elt (car components) 0)))
                                   (concat (substring (car components) 0 2)
                                           "/")
                                 (string (elt (car components) 0) ?/)))))
            len (- len (1- (length (car components))))
            components (cdr components)))
    (concat str (reduce (lambda (a b) (concat a "/" b)) components))))

(setq eshell-prompt-function
      (lambda ()
        (concat
         (fish-path (eshell/pwd) 20)
         ;; " ("
         ;; (vc-git-mode-line-string (eshell/pwd))
         ;; ") "
         "$"
         " "
         )))

(setq eshell-prompt-regexp "^[^#$]*[$#] ")

(when nt-p
  (custom-set-variables
   '(eshell-hosts-file "c:/Windows/System32/drivers/etc/hosts")))

(eval-after-load 'eshell
  '(progn (require 'eshell-autojump nil t)
          ;; (defalias 'eshell/z 'eshell/j)
          (require 'eshell-z)
          ))


;; エスケープシーケンスを処理
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)

(add-hook 'eshell-load-hook 'ansi-color-for-comint-mode-on)

(require 'ansi-color)

(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))

(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)
