;;;----------------------------------------
;;; byte-compile
;;;----------------------------------------


(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp
      "\\(.+?git\\|kill-ring-saved\\|\\.mc-lists\\)\\.el")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
