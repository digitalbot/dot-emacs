;;;----------------------------------------
;;; appearance
;;;----------------------------------------


;; fill column
(setq fill-column 80)

(when window-system
  (setq frame-title-format "%f")
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (auto-image-file-mode t)
  (set-frame-parameter (selected-frame) 'alpha '(93 80))
  (when nt-p
    (set-face-attribute 'default nil :family "Ricty Diminished Discord" :height 135)
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0208 (font-spec :famiry "Ricty Diminished Discord"))
    )
  (when darwin-p
    (require 'save-frame-posize)
    (set-face-attribute 'default nil
                        :family "Ricty"
                        :height 160)
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0208
     '("Ricty" . "iso10646-*"))))

;; hilight yanked
(require 'volatile-highlights)
(volatile-highlights-mode t)
  

;; show line and column
(column-number-mode t)
(line-number-mode t)

;; hilight ()
(show-paren-mode 1)

(file-name-shadow-mode t)

;; theme
(if window-system
    (load-theme 'manoj-dark t)
  (load-theme 'wombat t))

;; auto highlight
(global-auto-highlight-symbol-mode t)
(ahs-set-idle-interval 2.0)

;; rainbow parens
(require 'highlight-parentheses)
(setq hl-paren-colors '("SpringGreen" "LawnGreen" "GreenYellow" "DarkKhaki" "PaleGreen" "CadetBlue" "DarkSeaGreen"))
(set-face-attribute 'hl-paren-face nil :weight 'bold)
(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)

;; fill-column-indicator
(setq fci-rule-color "gray")
(setq fci-rule-column 80)
(define-globalized-minor-mode global-fci-mode fci-mode turn-on-fci-mode)

;; highlight-indentation
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#28222A")
(set-face-background 'highlight-indentation-current-column-face "#28222A")
(add-hook 'c-mode-common-hook 'highlight-indentation-current-column-mode)
(add-hook 'cperl-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'go-mode-hook 'highlight-indentation-current-column-mode)

;; hilight line
(require 'hl-line+)
(defface hi-underline
  '((((class color)
      (background dark))
     (:background"#0f122a" :underline t))
     ;; (:background"#0f122a" :Underline "#437"))
     ;; (:background"#0f122a"))
    (((class color)
      (background light))
     (:underline "#483d8b"))
    (t ()))
  "*Face used by hi-line.")
(global-hl-line-mode)
(if window-system
    (setq hl-line-face 'hi-underline)
  (setq hl-line-face 'underline)
  )

;; turn on fci-mode by (fci-mode) if you want
(setq-default fci-rule-column 80)
(setq fci-rule-color "darkred")
