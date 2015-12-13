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
;; (require 'helm-swoop)
(setq helm-multi-swoop-edit-save t)
(setq helm-swoop-split-with-multiple-windows nil)


;; helm yas
;; (require 'helm-c-yasnippet)
(setq helm-yas-display-key-on-candidate t)
(setq helm-yas-space-match-any-greedy t)



;; helm ag
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-command-option "--all-text")
(setq helm-ag-thing-at-point 'symbol)

;; cmigemo
(with-eval-after-load "migemo"
  ;; (require 'helm)
  (helm-migemo-mode +1)
  (defalias 'helm-mp-match 'helm-mm-match)
  (defalias 'helm-mp-exact-match 'helm-mm-exact-match)
  (defalias 'helm-mp-3-get-patterns 'helm-mm-3-get-patterns)
  (defalias 'helm-mp-3-search-base 'helm-mm-3-search-base)
  )

;; for NT Emacs
(when windows-p
  ;; w32-ime-buffer-switch-p を t にして helm を利用する場合に、ミニバッファで漢字を正常に
  ;; 使えるようにする対策（この設定がないと、ime が勝手に切り替わったりする）
  (setq w32-ime-buffer-switch-p t)
  (advice-add 'helm
              :around (lambda (orig-fun &rest args)
                        (let ((select-window-functions nil))
                          (apply orig-fun args))))
  ;; UNC や Tramp のパスに対して、helm-reduce-file-name が正しく機能しないことの対策
  ;; (helm-mode 1) として dired を動かした際にhelm-find-files-up-one-level
  ;; が正しく機能するようにする対策
  (advice-add 'helm-reduce-file-name
              :override (lambda (&rest args)
                          (let ((fname (nth 0 args))
                                (level (nth 1 args)))
                            (while (> level 0)
                              (setq fname (expand-file-name (concat fname "/../")))
                              (setq level (1- level)))
                            fname)))
  ;; ffap を使っていて find-file-at-point を起動した場合に、カーソル位置の UNC が正しく
  ;; 取り込まれないことの対策
  (advice-add 'helm-completing-read-default-1
              :around (lambda (orig-fun &rest args)
                        (when (listp (nth 4 args))
                          (setf (nth 4 args) (car (nth 4 args))))
                        (cl-letf (((symbol-function 'regexp-quote)
                                   (symbol-function 'identity)))
                          (apply orig-fun args))))
  ;; w32-symlinks を使っている場合に C-u 付きで helm-do-grep を起動すると、選択したファイルを
  ;; no conversion で開いてしまうことの対策
  (advice-add 'find-file
              :around (lambda (orig-fun &rest args)
                        (let ((current-prefix-arg nil))
                          (apply orig-fun args)))))
