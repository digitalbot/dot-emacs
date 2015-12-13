;;;----------------------------------------
;;; elscreen
;;;----------------------------------------


(elscreen-start)

(setq elscreen-prefix-key (kbd "C-z"))
(setq elscreen-tab-display-kill-screen nil)
(setq elscreen-display-tab 9)
(setq elscreen-display-screen-number nil)
(setq elscreen-tab-display-control nil)

(require 'smartrep)
(smartrep-define-key
    global-map "C-z" '(("n" . (elscreen-next))
                       ("p" . (elscreen-previous))))
(global-set-key (kbd "C-z C-b") 'helm-elscreen)










