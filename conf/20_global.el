;;;----------------------------------------
;;; global
;;;----------------------------------------


(when darwin-p
  (when (locate-library "gtags")
    (require 'gtags)
    (setq gtags-path-style 'relative)
    (defvar gtags-libpath nil
      "Library directory of language.")
    (make-variable-buffer-local 'gtags-libpath)
    (defadvice gtags-goto-tag
      (before gtags-goto-tag-gtagslibpath activate)
      (setenv "GTAGSLIBPATH" gtags-libpath))
    (setq gtags-select-buffer-single t)
    (global-set-key "\M-t" 'gtags-find-tag)
    (global-set-key "\M-r" 'gtags-find-rtag)
    (global-set-key "\M-s" 'gtags-find-symbol)
    (add-hook 'c-mode-common-hook
              '(lambda ()
                 (gtags-mode 1)
                 ;; (gtags-make-complete-list)
                 (setq gtags-libpath "/usr/include:/usr/local/include")
                 ))

    ;; update GTAGS
    (defun update-gtags (&optional prefix)
      (interactive "P")
      (let ((rootdir (gtags-get-rootpath))
            (args (if prefix "-v" "-iv")))
        (when rootdir
          (let* ((default-directory rootdir)
                 (buffer (get-buffer-create "*update GTAGS*")))
            (save-excursion
              (set-buffer buffer)
              (erase-buffer)
              (let ((result (process-file "gtags" nil buffer nil args)))
                (if (= 0 result)
                    (message "GTAGS successfully updated.")
                  (message "update GTAGS error with exit status %d" result))))))))
    (add-hook 'after-save-hook 'update-gtags)

    (defun gtags-parse-file2 ()
      (interactive)
      (if (gtags-get-rootpath)
          (let*
              ((root (gtags-get-rootpath))
               (path (buffer-file-name))
               (gtags-path-style 'root)
               (gtags-rootdir root))
            (if (string-match (regexp-quote root) path)
                (gtags-goto-tag
                 (replace-match "" t nil path)
                 "f" nil)
              ;; delegate to gtags-parse-file
              (gtags-parse-file)))
        ;; delegate to gtags-parse-file
        (gtags-parse-file)))
    ))
