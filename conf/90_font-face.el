;;;----------------------------------------
;;; font-face
;;;----------------------------------------

;; face at point
(defun describe-face-at-point ()
 (interactive)
 (message "%s" (get-char-property (point) 'face)))

(defface my-objc-at-face
  '((t (:foreground "#c79" :background "#000"))) nil)
(defface my-objc-private-face
  '((t (:foreground "#76e" :background "#000"))) nil)
(defvar my-objc-at-face 'my-objc-at-face)
(defvar my-objc-private-face 'my-objc-private-face)

;; http://d.hatena.ne.jp/buzztaiki/20111209/1323444755
(defun font-lock-user-keywords (mode &optional keywords)
  "Add user highlighting to KEYWORDS to MODE.
See `font-lock-add-keywords' and `font-lock-defaults'."
  (unless mode
    (error "mode should be non-nil "))
  (font-lock-remove-keywords mode (get mode 'font-lock-user-keywords))
  (font-lock-add-keywords mode keywords)
  (put mode 'font-lock-user-keywords keywords))

;; objc
(font-lock-user-keywords
 'objc-mode
 '(("@[a-zA-Z]*" 0 my-objc-at-face append)
   ("\\([\\*&]\\| \\)_[->a-zA-Z0-9\\.]+" 0 my-objc-private-face append)
   ("!" . font-lock-warning-face)
   ("\\\\[areEfntv]" 0 font-lock-variable-name-face t)
   ("%-?[0-9]*\\.?[0-9]*l?[csduoxfegp]" 0 font-lock-type-face t)
   ))

;; c
(font-lock-user-keywords
 'c-mode
 '(("\\\\[areEfntv]" 0 font-lock-variable-name-face t)
   ("%-?[0-9]*\\.?[0-9]*l?[csduoxfegp]" 0 font-lock-type-face t)
   ("!" . font-lock-warning-face)
   ))

;; c++
(font-lock-user-keywords
 'c++-mode
 '(("\\\\[areEfntv]" 0 font-lock-variable-name-face t)
   ("\\([\\*&]\\| \\)_[->a-zA-Z0-9\\._]+" 0 my-objc-private-face append)
   ("%-?[0-9]*\\.?[0-9]*l?[csduoxfegp]" 0 font-lock-type-face t)
   ("!" . font-lock-warning-face)
   ))

;; cperl
(font-lock-user-keywords
 'cperl-mode
 '(("!" . font-lock-warning-face)
   ("\\\\[areEfntv]" 0 font-lock-variable-name-face t)
   ("defined" 0 font-lock-type-face t)
   ("%-?[0-9]*\\.?[0-9]*l?[csduoxfegp]" 0 font-lock-type-face t)
   ))

;; hilight-keyword
(make-face 'my-highlight-face)
(set-face-foreground 'my-highlight-face "black")
(set-face-background 'my-highlight-face "yellow")
(setq my-highlight-face 'my-highlight-face)

(defun my-keep-highlight-regexp (re)
  (interactive "sRegexp: \n")
  (setq my-highlight-keyword re)
  (my-keep-highlight-set-font-lock my-highlight-keyword))

(defun my-keep-highlight-symbole-at-point ()
  (interactive)
  (setq my-highlight-keyword (or (thing-at-point 'symbol) ""))
  (my-keep-highlight-set-font-lock my-highlight-keyword))

(defun my-keep-highlight-set-font-lock (re)
  (font-lock-add-keywords 'nil (list (list re 0 my-highlight-face t)))
  (font-lock-fontify-buffer))

(defun my-cancel-highlight-regexp ()
  (interactive)
  (font-lock-remove-keywords 'nil (list (list my-highlight-keyword 0 my-highlight-face t)))
  (font-lock-fontify-buffer))

