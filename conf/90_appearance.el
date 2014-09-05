;;;----------------------------------------
;;; appearance
;;;----------------------------------------


(setq truncate-partial-width-windows nil)


(setq fill-column 80)

;; no menu tool bar
;;(menu-bar-mode -1)
;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)
(require 'yascroll)
(global-yascroll-bar-mode t)

;; show line and column
(column-number-mode t)
(line-number-mode t)

;; hilight ()
(show-paren-mode 1)

(file-name-shadow-mode t)

;; alpha
;;(set-frame-parameter (selected-frame) 'alpha '(93 80))

;; theme
(load-theme 'manoj-dark t)

;; font
;;(set-face-attribute 'default nil :family "Migu 1M" :height 120)
;;(set-fontset-font
;; (frame-parameter nil 'font)
;; 'japanese-jisx0208 (font-spec :famiry "Migu 1M"))

;; auto highlight
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(ahs-set-idle-interval 2.0)

;; rainbow parens
(require 'highlight-parentheses)
(setq hl-paren-colors '("SpringGreen" "LawnGreen" "GreenYellow" "DarkKhaki" "PaleGreen" "CadetBlue" "DarkSeaGreen"))
(set-face-attribute 'hl-paren-face nil :weight 'bold)
(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)

(require 'fill-column-indicator)
(setq fci-rule-color "gray")
(setq fci-rule-column 80)
(define-globalized-minor-mode global-fci-mode fci-mode turn-on-fci-mode)

(when (or window-system (eq emacs-major-version '21))
  (defadvice yank (after ys:highlight-string activate)
    (let ((ol (make-overlay (mark t) (point))))
      (overlay-put ol 'face 'highlight)
      (sit-for 0.5)
      (delete-overlay ol)))
  (defadvice yank-pop (after ys:highlight-string activate)
    (when (eq last-command 'yank)
      (let ((ol (make-overlay (mark t) (point))))
        (overlay-put ol 'face 'highlight)
        (sit-for 0.5)
        (delete-overlay ol)))))

(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#28222A")
(set-face-background 'highlight-indentation-current-column-face "#28222A")
(add-hook 'c-mode-common-hook 'highlight-indentation-current-column-mode)
(add-hook 'cperl-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'go-mode-hook 'highlight-indentation-current-column-mode)

;; hilight line
(require 'hl-line+)
(global-hl-line-mode)
(setq hl-line-face 'underline)

