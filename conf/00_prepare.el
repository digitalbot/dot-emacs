;;;----------------------------------------
;;; prepare
;;;----------------------------------------


;; C-q
(defvar ctrl-q-map (make-sparse-keymap)
  "My original keymap binded to C-q.")
(global-set-key (kbd "C-q") ctrl-q-map)
(global-set-key (kbd "C-q C-q") 'quoted-insert)

;; generic-mode
(require 'generic-x)

