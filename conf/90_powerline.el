;;;----------------------------------------
;;; powerline
;;;----------------------------------------

;; diminish
(diminish 'abbrev-mode)
(diminish 'yas-minor-mode "Ys")
(diminish 'undo-tree-mode "UT")
(eval-after-load "paredit"
  '(diminish 'paredit-mode "Pr"))
(eval-after-load "volatile-highlights"
 '(diminish 'volatile-highlights-mode))
(eval-after-load "page-break-lines"
  '(diminish 'page-break-lines-mode))
(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))
(eval-after-load "smooth-scroll"
  '(diminish 'smooth-scroll-mode))
(eval-after-load "highlight-parentheses"
  '(diminish 'highlight-parentheses-mode))

(set-face-attribute 'mode-line nil
                    :foreground "#639"
                    :background "#a6e"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#fef"
                    :background "#669"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "#538"
                    :background "#678"
                    :inherit 'mode-line)

(powerline-default-theme)
