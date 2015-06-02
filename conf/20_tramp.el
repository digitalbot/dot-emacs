;;;----------------------------------------
;;; tramp
;;;----------------------------------------


(if windows-p
    (setq tramp-default-method "plink")
  (setq tramp-default-method "ssh"))


;; sudo
(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '("localhost" nil nil))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))
