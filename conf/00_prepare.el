;;;----------------------------------------
;;; prepare
;;;----------------------------------------


;; C-q
(defvar ctrl-q-map (make-sparse-keymap)
  "My original keymap binded to C-q.")
(global-set-key (kbd "C-q") ctrl-q-map)
(global-set-key (kbd "C-q C-q") 'quoted-insert)

(require 'generic-x)

;; for c-mode
(defun my/c-add-hook (func)
  (add-hook 'c-mode-hook func)
  (add-hook 'c++-mode-hook func)
  (add-hook 'objc-mode-hook func))

(defun x->bool (elt) (not (not elt)))

;; emacs-version predicates
(setq emacs23-p (= 23 emacs-major-version)
      emacs23.0-p (string-match "^23\\.0.*" emacs-version)
      emacs23.1-p (string-match "^23\\.1.*" emacs-version)
      emacs23.2-p (string-match "^23\\.2.*" emacs-version)
      emacs24-p (= 24 emacs-major-version)
      emacs24.3-p (string-match "^24\\.3.*" emacs-version)
      emacs24.4-p (string-match "^24\\.4.*" emacs-version))

;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (if emacs24.4-p
                    (or (eq window-system 'ns) (eq window-system 'mac))
                  (eq window-system 'ns))
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

(when (not windows-p)
  (prefer-coding-system 'utf-8))
