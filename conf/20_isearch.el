;;;----------------------------------------
;;; isearch
;;;----------------------------------------

;; anzu
(global-anzu-mode +1)
(set-face-attribute 'anzu-mode-line nil
                    :foreground "blue" :weight 'bold)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-use-migemo t))
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)


;; ace-isearch
(global-ace-isearch-mode +1)
(setq ace-isearch-input-idle-delay 0.8)
(setq ace-isearch-input-length 8)
