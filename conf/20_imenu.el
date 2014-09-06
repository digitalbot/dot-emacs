;;;----------------------------------------
;;; imenu
;;;----------------------------------------


;; (require 'cl)

;; imenu
;; (require 'imenu)

;; cedet
;; (require 'cedet)

;; which func but powerline erase this
;; (require 'which-func)
;; (which-function-mode t)

;; semantic
;; (require 'semantic)
(setq semantic-imenu-summary-function
      (lambda (tag)
        (semantic-format-tag-summarize tag nil t)))
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

