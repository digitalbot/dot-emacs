;;;----------------------------------------
;;; shell
;;;----------------------------------------


(when (not windows-p)
  (defun skt:shell ()
    (or
     (executable-find "bash")
     (executable-find "zsh")
     (error "can't find 'shell' command in PATH!!")))

  ;; Shell 名の設定
  (setq shell-file-name (skt:shell))
  (setenv "SHELL" shell-file-name)
  (setq explicit-shell-file-name shell-file-name)

  ;; char code
  (cond
   (darwin-p
    (require 'ucs-normalize)
    (setq file-name-coding-system 'utf-8-hfs)
    (setq locale-coding-system 'utf-8-hfs))
   (t
    (setq file-name-coding-system 'utf-8)
    (setq locale-coding-system 'utf-8)))

  ;;terminfo
  (setq system-uses-terminfo nil)

  ;; escape
  (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  ;; multi-term
  (require 'multi-term)
  (setq multi-term-program shell-file-name)

  ;; tab issue
  (add-hook 'term-mode-hook (lambda()
                              (yas-minor-mode -1)))

  ;; term key bind
  (add-to-list 'term-unbind-key-list '"M-x")
  (add-to-list 'term-unbind-key-list '"C-o")
  (add-hook 'term-mode-hook
            '(lambda ()
               ;; C-h を term 内文字削除にする
               (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
               ;; C-y を term 内ペーストにする
               (define-key term-raw-map (kbd "C-y") 'term-paste)
               ))
  (global-set-key (kbd "C-c t") '(lambda ()
                                   (interactive)
                                   (if (get-buffer "*terminal<1>*")
                                       (switch-to-buffer "*terminal<1>*"))
                                   (multi-term)))

  ;; shell pop
  (require 'shell-pop)
  (custom-set-variables
   '(shell-pop-shell-type
     (quote ("multi-term" "*terminal<1>" '(lambda () (multi-term)))))
   ;; '(shell-pop-term-shell "/usr/loca/bin/bash")
   '(shell-pop-term-shell shell-file-name)
   '(shell-pop-universal-key "C-q p")
   '(shell-pop-window-height 45))
  )
