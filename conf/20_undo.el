;;;----------------------------------------
;;; undo
;;;----------------------------------------


;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-x C-u") 'undo-tree-visualize)
(global-set-key (kbd "C-\\") 'undo-tree-undo)
(global-set-key (kbd "C-?") 'undo-tree-redo)
(global-set-key (kbd "C-M-\\") 'undo-tree-redo)

;; undohist
(require 'undohist)
(undohist-initialize)

;;; NTEmacsだと動かないらしいので再定義
;;; http://d.hatena.ne.jp/Lian/20120420/1334856445
(when 'windows-p
  (defun make-undohist-file-name (file)
    (setq file (convert-standard-filename (expand-file-name file)))
    (if (eq (aref file 1) ?:)
        (setq file (concat "/"
                           "drive_"
                           (char-to-string (downcase (aref file 0)))
                           (if (eq (aref file 2) ?/)
                               ""
                             (if (eq (aref file 2) ?\\)
                                 ""
                               "/"))
                           (substring file 2))))
    (setq file (expand-file-name
                (subst-char-in-string
                 ?/ ?!
                 (subst-char-in-string
                  ?\\ ?!
                  (replace-regexp-in-string "!" "!!"  file)))
                undohist-directory))))

;; pointundo
(require 'point-undo)
(global-set-key (kbd "C-.") 'point-undo)
(global-set-key (kbd "C->") 'point-redo)
(when (not window-system)
  (require 'smartrep)
  (smartrep-define-key
      global-map "C-z" '(("." . (point-undo))
                         (">" . (point-redo)))))
