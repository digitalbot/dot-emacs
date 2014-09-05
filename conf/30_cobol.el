;;;----------------------------------------
;;; cobol
;;;----------------------------------------


(require 'cobol-mode)
(setq auto-mode-alist
      (append auto-mode-alist '(("\\.cob$" . cobol-mode))))
(autoload 'cobol-mode "cobol-mode"
  "Major mode for editing COBOL source files." t nil)
(auto-revert-mode t)
