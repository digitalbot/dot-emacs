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

;; pointundo
(require 'point-undo)
(global-set-key (kbd "C-.") 'point-undo)
(global-set-key (kbd "C->") 'point-redo)
(when window-system
(global-set-key (kbd "C-c .") 'point-undo)
(global-set-key (kbd "C-c >") 'point-redo)
)

