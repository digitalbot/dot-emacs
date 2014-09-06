;;;----------------------------------------
;;; multiple-cursors
;;;----------------------------------------


(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-c") 'mc/mark-all-in-region)

(require 'smartrep)
(smartrep-define-key
    global-map "C-q" '(("j" . 'mc/mark-next-like-this)
                       ("k" . 'mc/mark-previous-like-this)
                       ("u" . 'mc/unmark-next-like-this)
                       ("U" . 'mc/unmark-previous-like-this)
                       ("s" . 'mc/skip-to-next-like-this)
                       ("S" . 'mc/skip-to-previous-like-this)
                       ("*" . 'mc/mark-all-like-this)
                       ))
