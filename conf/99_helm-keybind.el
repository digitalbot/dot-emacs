;;;----------------------------------------
;;; helm-keybind
;;;----------------------------------------


;; helm util
(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c ;") 'helm-for-files)
(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-c i")   'helm-imenu)
(global-set-key (kbd "C-x b")   'helm-buffers-list)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-w") 'kill-region-or-backward-kill-word)
(define-key helm-map (kbd "C-:") 'helm-select-action)
(define-key helm-map (kbd "C-c :") 'helm-select-action)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-w") 'kill-region-or-backward-kill-word)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "C-:") 'helm-select-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "C-:") 'helm-select-action)


;; helm swoop
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; ac-helm
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
;;(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

;; helm yas
(global-set-key (kbd "C-q C-y") 'helm-yas-complete)

;; helm-ls-git
(global-set-key (kbd "C-x C-d") 'helm-ls-git-ls)
