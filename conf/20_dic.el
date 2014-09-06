;;;----------------------------------------
;;; dictionary
;;;----------------------------------------

;; google-translate
(require 'google-translate)
(require 'google-translate-smooth-ui)
(setq google-translate-listen-program t)
(global-set-key (kbd "C-x t") 'google-translate-at-point)
(custom-set-variables
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja"))
