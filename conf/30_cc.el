;;;----------------------------------------
;;; cc
;;;----------------------------------------


;;a align
;;(c-set-offset 'statement-count 'c-lineup-math)
(c-set-offset 'case-label '+)

;; hook
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "cc-mode")
             (setq-default indent-tabs-mode nil)
             (setq-default tab-width 4)
             (semantic-mode 1)
             (setq ac-sources (append ac-sources '(ac-source-semantic)))
             (add-to-list 'ac-sources 'ac-source-system-header-files)
             ))


;; 自動判別
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))

(when (not windows-p)
  ;; open header easier
  (ffap-bindings)
  (setq ffap-c-path
        '("/usr/include"
          "/usr/local/include"
          ))

  ;; 対応するファイルオープン
  (setq ff-other-file-alist
        '(("\\.mm?$" (".h"))
          ("\\.cc$" (".hh" ".h"))
          ("\\.hh$" (".cc" ".C"))

          ("\\.c$" (".h"))
          ("\\.h$" (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m" ".mm"))

          ("\\.C$" (".H" ".hh" ".h"))
          ("\\.H$" (".C" ".CC"))

          ("\\.CC$"  (".HH" ".H"  ".hh" ".h"))
          ("\\.HH$"  (".CC"))

          ("\\.cxx$" (".hh" ".h"))
          ("\\.cpp$" (".hpp" ".hh" ".h"))

          ("\\.hpp$" (".cpp" ".c"))))
  
  ;; auto-complete system header

  (defun list-system-header-files ()
    (directory-files "/usr/include" nil "^.*\\.h$"))
  (defvar system-header-files-cache (list-system-header-files))
  (defvar ac-source-system-header-files
    '((candidates . system-header-files-cache)
      (prefix . "#include *<\\([^>]*\\)")
      (action . (lambda ()
                  (when (eolp)
                    (insert ">\n"))))))

  (add-hook 'c-mode-common-hook
            (lambda ()
              (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)))
  )

