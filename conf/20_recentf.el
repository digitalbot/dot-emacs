;;;----------------------------------------
;;; recentf
;;;----------------------------------------

(require 'cl)
 
(defvar my-recentf-list-prev nil)
 
(defadvice recentf-save-list
  (around no-message activate)
  "If `recentf-list' and previous recentf-list are equal,
do nothing. And suppress the output from `message' and
`write-file' to minibuffer."
  (unless (equal recentf-list my-recentf-list-prev)
    (cl-flet ((message (format-string &rest args)
		       (eval `(format ,format-string ,@args)))
	      (write-file (file &optional confirm)
			  (let ((str (buffer-string)))
			    (with-temp-file file
			      (insert str)))))
      ad-do-it
      (setq my-recentf-list-prev recentf-list))))
 
(defadvice recentf-cleanup
  (around no-message activate)
  "suppress the output from `message' to minibuffer"
  (cl-flet ((message (format-string &rest args)
		     (eval `(format ,format-string ,@args))))
    ad-do-it))
 
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 'never)
;; (setq recentf-auto-cleanup 10)
(run-with-idle-timer 30 t 'recentf-save-list)
(recentf-mode 1)


;; recentf-ext
(require 'recentf-ext)
(setq recentf-max-menu-items 8000)
(setq recentf-max-saved-items 10000)

