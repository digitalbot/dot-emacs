;;;----------------------------------------
;;; region
;;;----------------------------------------


;; thingopt
(require 'thingopt)
(define-thing-commands)
(if window-system
    (progn
      (global-set-key (kbd "C-(") 'mark-up-list)
      (global-set-key (kbd "C-@") 'er/expand-region)    ;; expand-region
      )
  (progn
    (global-set-key (kbd "C-c @") 'er/expand-region)
    ))

(require 'hydra)
(defhydra hydra-rectangle (:body-pre (rectangle-mark-mode 1)
                           :color pink
                           :post (deactivate-mark))
"

            _d_elete      _y_ank 
            _k_ill        _s_tring    |\\     _..--..
            _c_opy        _r_eset    /,`,.'`'   ._ \\-;;,_
            _e_xchange    _u_ndo    |,4-  ) )_   .;.(  `'-'
^^                        _q_uit   '---''(_/..)-'(_\_)
                
"
  ("e" exchange-point-and-mark nil)
  ("c" copy-rectangle-as-kill nil)
  ("k" kill-rectangle nil)
  ("d" delete-rectangle nil)
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)) nil)
  ("y" yank-rectangle nil)
  ("u" undo nil)
  ("s" string-rectangle nil)
  ("q" nil nil))
(global-set-key [(control return)] 'hydra-rectangle/body)
