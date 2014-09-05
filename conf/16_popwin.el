;;;----------------------------------------
;;; popwin
;;;----------------------------------------

;; popwin
(require 'popwin)
(popwin-mode 1)
(define-key global-map (kbd "C-x p") 'popwin:display-last-buffer)
(setq popwin:special-display-config
      (append '(("*Apropos*")
                ("*sdic*")
                ("*Faces*")
                ("*Colors*")
                ("*Backtrace*")
                ("*Warnings*")
                ("*Packages*")
                ("*Compile-Log*")
                ("*Moccur*")
                ("*Process List*")
                ("*Mew message*0")
                ("*ack*")
                ("*ag*")
                ("*Perl *")
                ("*Google Translate*")
                ("*Codic Result*")
                )
              popwin:special-display-config))
(push '(" *auto-async-byte-compile*"
        :height 14
        :position bottom
        :noselect t)
      popwin:special-display-config)
(push '(" *undo-tree*"
        :width 0.3
        :position right
        )
      popwin:special-display-config)
(push '(".*helm.*" :height 20 :regexp t) popwin:special-display-config)
