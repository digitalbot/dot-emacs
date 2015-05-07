;;;----------------------------------------
;;; setup
;;;----------------------------------------

;; bidi issue
(if (> (string-to-number emacs-version) 24)
    (setq-default bidi-display-reordering nil
                  bidi-paragraph-direction (quote left-to-right)))

(when ns-p
  ;; inline-patch skk使ってないから意味ないかも
  (when (or (= emacs-major-version 23) (= emacs-major-version 24))
    ;;(setq default-input-method "MacOSX")
    (mac-add-key-passed-to-system 'shift))
  )

;; for error
(setq max-specpdl-size 5000)
(setq max-lisp-eval-depth 2000)

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


