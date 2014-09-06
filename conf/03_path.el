;;;----------------------------------------
;;; path
;;;----------------------------------------

(when (not windows-p)
  (let ((envs '("PATH" "MANPATH" "GTAGSLABEL" "MAKEOBJDIRPREFIX" "GOROOT" "GOPATH")))
    (exec-path-from-shell-copy-envs envs))
  )
