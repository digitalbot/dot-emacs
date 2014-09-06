;;;----------------------------------------
;;; perl
;;;----------------------------------------


(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist
	  (append '(("\\.\\([pP][Llhm]\\|al\\|t\\|cgi\\|psgi\\)$" . cperl-mode))
              auto-mode-alist))
(add-hook 'cperl-mode-hook
		  '(lambda()
                     (cperl-set-style "PerlStyle")
                     (setq indent-tabs-mode nil)
                     (setq cperl-indent-level 4)
                     (setq cperl-tab-always-indent t)
                     (setq cperl-indent-parens-as-block t)
                     (setq cperl-close-paren-offset -4)
                     (setq cperl-highlight-variables-indiscriminately t)
                     (setq fill-column 80)
                     (setq auto-fill-mode t)
                     (setq cperl-indent-subs-specially nil)
                     ))
;; dict
(add-to-list 'ac-modes 'cperl-mode)
