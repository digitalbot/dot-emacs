;;;----------------------------------------
;;; eww
;;;----------------------------------------


(with-eval-after-load "eww"
  (defvar eww-disable-colorize t)
  (defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
    (unless eww-disable-colorize
      (funcall orig start end fg)))
  (advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
  (advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
  (defun eww-disable-color ()
    "eww で文字色を反映させない"
    (interactive)
    (setq-local eww-disable-colorize t)
    (eww-reload))
  (defun eww-enable-color ()
    "eww で文字色を反映させる"
    (interactive)
    (setq-local eww-disable-colorize nil)
    (eww-reload))
  (setq eww-search-prefix "http://www.google.co.jp/search?q=")

  (require 'load-theme-buffer-local)
  (setq shr-color-visible-luminance-min 70)
  (add-hook 'eww-mode-hook
            (lambda () (load-theme-buffer-local 'wombat (current-buffer)))))
