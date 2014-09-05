;;;----------------------------------------
;;; init
;;;----------------------------------------


;; language
(set-language-environment 'japanese)

;; avoid warn
(require 'cl)
(setq byte-compile-warnings
      '(free-vars
        unresolved
        callargs
        redefine
        obsolete
        noruntime
        cl-functions
        interactive-only
        make-local))

;; load-path
(setq load-path (cons "~/.emacs.d/" load-path))
(let ((default-directory "~/.emacs.d/site-lisp"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))

;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; init-loader
(if (require 'init-loader nil t)
     (init-loader-load "~/.emacs.d/conf")
   (load-file "~/.emacs.d/init-minimal.el")
   )

(cd "~/")
