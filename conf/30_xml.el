;;;----------------------------------------
;;; XML
;;;----------------------------------------

(add-hook 'nxml-mode-hook
        (lambda ()
        (setq nxml-slash-auto-complete-flag t)
        (setq nxml-child-indent 2)
        ;; (setq indent-tabs-mode nil)
        (setq tab-width 2)
        (auto-complete-mode)))

(require 'auto-complete-nxml)
;; Keystroke for toggle on/off automatic completion.
(setq auto-complete-nxml-toggle-automatic-key "C-c C-t")
;; Keystroke for popup help about something at point.
(setq auto-complete-nxml-popup-help-key "C-;")
