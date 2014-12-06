;;;----------------------------------------
;;; web
;;;----------------------------------------


;; web-mode
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tt$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . web-mode))

(add-hook 'web-mode-hook
          '(lambda()
             (auto-complete-mode t)
             
             (local-unset-key (kbd "C-;"))
             (setq web-mode-script-padding 0)
             (setq web-mode-block-padding 0)
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-code-indent-offset 2)))

;; face
(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#00FFFF"))))
 '(web-mode-html-tag-face
   ((t (:foreground "#8899CC"))))
 '(web-mode-html-attr-name-face
   ((t (:foreground "#CDBE70"))))
 '(web-mode-comment-face
   ((t (:foreground "#D9333F"))))
 '(web-mode-server-comment-face
   ((t (:foreground "#D9333F"))))
 )

;; auto-complete
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property))
        ("javascript" . (ac-source-abbrev ac-source-words-in-buffer))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

;; emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook '(lambda () (setq emmet-indentation 2)))
(define-key emmet-mode-keymap (kbd "C-q m") 'emmet-expand-yas)
(define-key emmet-mode-keymap (kbd "C-q C-m") 'emmet-expand-line)
(define-key emmet-preview-keymap (kbd "C-q C-m") 'emmet-preview-accept)

