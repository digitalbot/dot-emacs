;;;----------------------------------------
;;; keybind
;;;----------------------------------------


;; c-k
(setq kill-whole-line t)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "C-x C-h") 'help-command)
(global-set-key (kbd "M-b") 'backward-word)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "C-c C-r") 'revert-buffer)
;;(global-set-key (kbd "C-c r") 'replace-regexp)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-x C-b") 'buffer-menu)

(global-set-key (kbd "C-q C-o") 'delete-other-windows)
(global-set-key (kbd "C-q g") 'goto-line)
(global-set-key (kbd "C-q C-.") '(lambda () (interactive) (insert "->")))
(global-set-key (kbd "C-q .") '(lambda () (interactive) (insert "->")))
(global-set-key (kbd "C-q C-d") 'describe-bindings)
(global-set-key (kbd "C-q C-a") 'mark-whole-buffer)

(global-set-key (kbd "M-SPC") 'cycle-spacing)

;; tab key
(setq c-tab-always-indent t)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq indent-line-function 'indent-relative-maybe)

;; dmacro
(progn
  (defconst *dmacro-key* "\C-t" "repeat key")
  (global-set-key *dmacro-key* 'dmacro-exec)
  (autoload 'dmacro-exec "dmacro" nil t))



(defun kill-word-or-delete-horizontal-space (arg)
  (interactive "p")
  (let ((pos (point)))
    (if (and (not (eobp))
             (= (char-syntax (char-after pos)) 32)
             (= (char-syntax (char-after (1+ pos))) 32))
        (prog1 (delete-horizontal-space)
          (unless (memq (char-after pos) '(?( ?) ?{ ?} ?[ ?]))
            (insert " ")))
      (kill-word arg))))
(global-set-key (kbd "M-d") 'kill-word-or-delete-horizontal-space)
