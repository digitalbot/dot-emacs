;;;----------------------------------------
;;; java
;;;----------------------------------------

(require 'cl)
(require 'cedet)
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))

(semantic-mode 1)
(require 'malabar-mode)
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(when windows-p
  (setq malabar-util-path-separator ";")
  (setq malabar-util-groovy-file-filter 'malabar-util-reverse-slash))

(require 'ajc-java-complete-config)
(add-hook 'malabar-mode-hook 'ajc-java-complete-mode)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)


;; keybind
(defun my-java-mode-hooks()
  (setq c-basic-offset 4)
  (hs-minor-mode 1))
(add-hook 'java-mode-hook 'my-java-mode-hooks)
(add-hook 'malabar-mode-hook 'my-java-mode-hooks)
