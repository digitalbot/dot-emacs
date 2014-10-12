;;;----------------------------------------
;;; mykie
;;;----------------------------------------

(require 'mykie)
(mykie:set-keys nil
  "C-a"
  :default (beginning-of-line)
  :C-u (back-to-indentation)
  :bolp (beginning-of-buffer)
  "C-e"
  :default (end-of-line)
  :eolp (end-of-buffer)
  "C-w"
  :default (backward-kill-word 1)
  :region (kill-region (point) (mark))
  :region&C-u (kill-ring-save (point) (mark)))
