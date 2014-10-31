;;;----------------------------------------
;;; helm
;;;----------------------------------------


(helm-mode 1)
(setq helm-candidate-number-limit 150)
(setq helm-quick-update t)
(setq helm-su-or-sudo "sudo")

;; Disable helm in some functions
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))

(defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
  "Transform the pattern to reflect my intention"
  (let* ((pattern (ad-get-arg 0))
         (input-pattern (file-name-nondirectory pattern))
         (dirname (file-name-directory pattern)))
    (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
    (setq ad-return-value
          (concat dirname
                  (if (string-match "^\\^" input-pattern)
                      ;; '^' is a pattern for basename
                      ;; and not required because the directory name is prepended
                      (substring input-pattern 1)
                    (concat ".*" input-pattern))))))

(custom-set-variables '(helm-for-files-preferred-list
                        '(helm-source-buffers-list
                          helm-source-recentf
                          helm-source-bookmarks
                          helm-source-file-cache
                          ;;helm-source-files-in-current-dir
                          )))

;; helm descbinds
(helm-descbinds-mode)


;; helm swoop
(require 'helm-swoop)
(setq helm-multi-swoop-edit-save t)
(setq helm-swoop-split-with-multiple-windows nil)


;; helm yas
(require 'helm-c-yasnippet)
(setq helm-c-yas-display-key-on-candidate t)
(setq helm-c-yas-space-match-any-greedy t)


;; cmigemo
(eval-after-load "migemo"
  '(progn
     (setq helm-use-migemo t)
     ;; 候補が表示されないときがあるので
     ;; migemoらないように設定
     (defadvice helm-c-apropos
       (around ad-helm-apropos activate)
       (let ((helm-use-migemo nil))
         ad-do-it))
     (defadvice helm-M-x
       (around ad-helm-M-x activate)
       (let ((helm-use-migemo nil))
         ad-do-it))
     (defadvice helm-swoop
       (around ad-helm-swoop activate)
       (let ((helm-use-migemo nil))
         ad-do-it))))


;; helm ag
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-command-option "--all-text")
(setq helm-ag-thing-at-point 'symbol)
