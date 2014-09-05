;;;----------------------------------------
;;; undo
;;;----------------------------------------


(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-x C-u") 'undo-tree-visualize)
(global-set-key (kbd "C-\\") 'undo-tree-undo)
(global-set-key (kbd "C-?") 'undo-tree-redo)

(require 'undohist)
(undohist-initialize)

(require 'point-undo)
(global-set-key (kbd "C-.") 'point-undo)
(global-set-key (kbd "C->") 'point-redo)
