;;;----------------------------------------
;;; web
;;;----------------------------------------


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tt$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . web-mode))

(add-hook 'web-mode-hook
          '(lambda()
             (auto-complete-mode t)
             (setq web-mode-ac-sources-alist
                   '(("css" . (ac-source-css-property))
                     ("html" . (ac-source-words-in-buffer ac-source-abbrev))
                     ("javascript" . (ac-source-words-in-buffer ac-source-abbrev))))
             
             (local-unset-key (kbd "C-;"))
             (setq web-mode-script-padding 0)
             (setq web-mode-block-padding 0)
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-code-indent-offset 2)))
