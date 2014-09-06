;;;----------------------------------------
;;; pos-tip
;;;----------------------------------------

(require 'pos-tip)
(require 'popup-pos-tip)
(defadvice popup-tip
  (around popup-pos-tip-wrapper (string &rest args) activate)
  (apply 'popup-pos-tip string args)
  ad-do-it)
