;;;----------------------------------------
;;; cmigemo
;;;----------------------------------------

(when ns-p
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  )
(when windows-p
  (setq migemo-dictionary "C:/cmigemo/dict/utf-8/migemo-dict")
  )
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-isearch-min-length 2)
(load-library "migemo")
(migemo-init)
