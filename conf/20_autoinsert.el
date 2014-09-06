;;;----------------------------------------
;;; autoinsert
;;;----------------------------------------


(auto-insert-mode 1)
(setq auto-insert-query nil)
(setq auto-insert-directory (concat user-emacs-directory "tmpl"))
(add-hook 'find-file-hook 'auto-insert)
(setq auto-insert-alist
 (append '(
           ("\\.c$"  . "c-tmpl.c")
           ("\\.el$" . "elisp-tmpl.el")
           ("\\.pl$" . "perlheader-tmpl.pl")
           ("\\.pm$" . "perlpackage-tmpl.pm")
           ("Makefile$" . "Makefile-tmpl")
           ("\\.html$" . "html-tmpl.html")
           ) auto-insert-alist))
