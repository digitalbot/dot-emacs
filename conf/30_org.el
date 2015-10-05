;;;----------------------------------------
;;; org
;;;----------------------------------------


(setq auto-mode-alist
      (append '(("\\.\\(txt\\)$" . org-mode))
              auto-mode-alist))
(setq org-startup-truncated nil)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WIP(i)" "WAIT(w)" "DONE(d)")))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))

(setq org-confirm-babel-evaluate nil)
(setq org-src-fontify-natively t)
(org-ac/config-default)

;;(require 'ox-gfm)
;;(require 'ox-confluence)


