;;;----------------------------------------
;;; migemo
;;;----------------------------------------

(require 'migemo)
;; for cmigemo
(setq migemo-command "C:/cmigemo/cmigemo.exe"
      migemo-options '("-q" "--emacs")
      migemo-dictionary "C:/cmigemo/dict/utf-8/migemo-dict"
      migemo-user-dictionary nil
      migemo-regex-dictionary nil
      migemo-isearch-min-length 2
      migemo-coding-system 'utf-8
      )
(load-library "migemo")
(migemo-init)

;; for helm-migemo
(require 'helm-migemo)
(setq helm-use-migemo t)
;; åÛï‚Ç™ï\é¶Ç≥ÇÍÇ»Ç¢Ç∆Ç´Ç™Ç†ÇÈÇÃÇ≈
;; migemoÇÁÇ»Ç¢ÇÊÇ§Ç…ê›íË
(defadvice helm-c-apropos
  (around ad-helm-apropos activate)
  (let ((helm-use-migemo nil))
    ad-do-it))
(defadvice helm-M-x
  (around ad-helm-M-x activate)
  (let ((helm-use-migemo nil))
    ad-do-it))
(defadvice helm-swoop
  (around ad-helm-swoop activate)
  (let ((helm-use-migemo nil))
    ad-do-it))
