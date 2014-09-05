;;;----------------------------------------
;;; smartrep
;;;----------------------------------------


(require 'smartrep)
(smartrep-define-key
    global-map "C-z" '(("n" . (elscreen-next))
                       ("p" . (elscreen-previous))))
