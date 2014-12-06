;;;----------------------------------------
;;; python
;;;----------------------------------------

;; python-mode, python-environment, jedi
(require 'python)
(require 'ac-python)

;; hook
(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-tabs-mode 1)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)
             (flycheck-mode 1)
             ))

(add-hook 'python-mode-hook 'jedi:ac-setup)
;;(define-key python-mode-map (kbd "<C-tab>") 'jedi:complete)
(define-key python-mode-map (kbd "TAB") 'jedi:complete)

;; from emacs23 python.el
(defun python-symbol-completions (symbol)
  "Return a list of completions of the string SYMBOL from Python process.
The list is sorted.
Uses `python-imports' to load modules against which to complete.\"

  (when (stringp symbol)
    (let ((completions
   (condition-case ()
       (car (read-from-string
     (python-send-receive
      (format \"emacs.complete(%S,%s)\"
      (substring-no-properties symbol)
      python-imports))))
     (error nil))))
      (sort
       ;; We can get duplicates from the above -- don't know why.
       (delete-dups completions)
       #'string<))))
'`")

;; python.el
(defun my:ensure-python.el (&optional branch overwrite)
  "Install python.el from BRANCH.
After the first install happens the file is not overwritten again
unless the optional argument OVERWRITE is non-nil.  When called
interactively python.el will always be overwritten with the
latest version."
  (interactive
   (list
    (completing-read "Install python.el from branch: "
                     (list "master" "emacs-24")
                     nil t)
    t))
  (let* ((branch (or branch "master"))
         (url (format
               (concat "http://git.savannah.gnu.org/cgit/emacs.git/plain"
                       "/lisp/progmodes/python.el?h=%s") branch))
         (destination (expand-file-name "python.el" (concat user-emacs-directory "/site-lisp")))
         (write (or (not (file-exists-p destination)) overwrite)))
    (when write
      (with-current-buffer
          (url-retrieve-synchronously url)
        (delete-region (point-min) (1+ url-http-end-of-headers))
        (write-file destination))
      (byte-compile-file destination t)
      destination)))

;;(my:ensure-python.el)


