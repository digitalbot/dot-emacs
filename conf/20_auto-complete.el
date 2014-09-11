;;;----------------------------------------
;;; auto-complete
;;;----------------------------------------


(global-auto-complete-mode t)

(setq ac-ignore-case 'smart)
(setq ac-disable-faces nil)
(setq ac-auto-start 2)
(setq ac-use-quick-help t)
(defun ac-common-setup ()
  (add-to-list 'ac-sources 'ac-source-filename))

(add-to-list 'ac-dictionary-directories (concat user-emacs-directory "ac-dict"))
(ac-config-default)

(add-to-list 'ac-modes 'cobol-mode)

(define-key ac-completing-map (kbd "M-n") 'ac-next)
(define-key ac-completing-map (kbd "M-p") 'ac-previous)
(define-key ac-completing-map (kbd "<backtab>") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
(define-key global-map (kbd "C-q C-i") 'auto-complete)
(ac-set-trigger-key "TAB")

(when (executable-find "look")
  (defun my-ac-look ()
    "look コマンドの出力をリストで返す"
    (interactive)
    (unless (executable-find "look")
      (error "look コマンドがありません"))
    (let ((search-word (thing-at-point 'word)))
      (with-temp-buffer
        (call-process-shell-command "look" nil t 0 search-word)
        (split-string-and-unquote (buffer-string) "\n"))))

  (defun ac-complete-look ()
    (interactive)
    (let ((ac-menu-height 50)
          (ac-candidate-limit t))
      (auto-complete '(ac-source-look))))

  (defvar ac-source-look
    '((candidates . my-ac-look)
      (requires . 3)))  ;; over 2 char

  (global-set-key (kbd "C-]") 'ac-complete-look))
