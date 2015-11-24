;;;----------------------------------------
;;; lang
;;;----------------------------------------

;; (when (not windows-p)
;;   (prefer-coding-system 'utf-8-unix))
(prefer-coding-system 'utf-8-unix)
(when windows-p
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932)
  (setq default-process-coding-system '(undecided-dos . utf-8-unix))
  (set-keyboard-coding-system 'cp932)
  (set-terminal-coding-system 'cp932)
  (set-default buffer-file-coding-system 'cp932)
  (set-locale-environment "cp932")
  (setenv "LANG" "ja_JP.CP932")
  (setenv "LC_ALL" "ja_JP.CP932"))

;; サブプロセスに渡すパラメータの文字コードを cp932 にする
(cl-loop for (func args-pos) in '((call-process        4)
                                  (call-process-region 6)
                                  (start-process       3))
         do (eval `(advice-add ',func
                               :around (lambda (orig-fun &rest args)
                                         (setf (nthcdr ,args-pos args)
                                               (mapcar (lambda (arg)
                                                         (if (multibyte-string-p arg)
                                                             (encode-coding-string arg 'cp932)
                                                           arg))
                                                       (nthcdr ,args-pos args)))
                                         (apply orig-fun args))
                               '((depth . 99)))))


;; (setenv "LANG" "ja_JP.UTF-8") 

;; (prefer-coding-system 'utf-8-unix)
;; (set-file-name-coding-system 'cp932)
;; (setq locale-coding-system 'utf-8)

;; ;; プロセスが出力する文字コードを判定して、process-coding-system の DECODING の設定値を決定する
;; (setq default-process-coding-system '(undecided-dos . utf-8-unix))

;; (set-process-args-coding-system call-process 0 4)
;; (set-process-args-coding-system call-process-region 2 6)
;; (set-process-args-coding-system start-process 2 3)
