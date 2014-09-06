;;;----------------------------------------
;;; git
;;;----------------------------------------
;;do not byte-compile

(setq git-gutter:diff-option "-w")
(global-set-key (kbd "C-x g") 'git-gutter:toggle)
