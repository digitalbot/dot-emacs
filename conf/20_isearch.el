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
(require 'helm-swoop)
(global-ace-isearch-mode +1)
(custom-set-variables
 '(ace-isearch-use-ace-jump 'printing-char)
 '(ace-isearch-input-idle-delay 1.0)
 '(ace-isearch-input-length 12))
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
