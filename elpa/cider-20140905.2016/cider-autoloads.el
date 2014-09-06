;;; cider-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (cider-connect cider-jack-in cider-version) "cider"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider.el"
;;;;;;  "7bd16963ce4dafd2bf272f1a0d0356eb")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-20140905.2016/cider.el

(autoload 'cider-version "cider" "\
Display CIDER's version.

\(fn)" t nil)

(autoload 'cider-jack-in "cider" "\
Start a nREPL server for the current project and connect to it.
If PROMPT-PROJECT is t, then prompt for the project for which to
start the server.

\(fn &optional PROMPT-PROJECT)" t nil)

(autoload 'cider-connect "cider" "\
Connect to an nREPL server identified by HOST and PORT.
Create REPL buffer and start an nREPL client connection.

\(fn HOST PORT)" t nil)

(eval-after-load 'clojure-mode '(progn (define-key clojure-mode-map (kbd "C-c M-j") 'cider-jack-in) (define-key clojure-mode-map (kbd "C-c M-c") 'cider-connect)))

;;;***

;;;### (autoloads (cider-browse-ns-all cider-browse-ns) "cider-browse-ns"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-browse-ns.el"
;;;;;;  "1eb9fa98844f57a0ed6cc29f4aa29f89")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-20140905.2016/cider-browse-ns.el

(autoload 'cider-browse-ns "cider-browse-ns" "\
List all NAMESPACE's vars in BUFFER.

\(fn NAMESPACE)" t nil)

(autoload 'cider-browse-ns-all "cider-browse-ns" "\
List all loaded namespaces in BUFFER.

\(fn)" t nil)

;;;***

;;;### (autoloads (cider-open-classpath-entry cider-classpath) "cider-classpath"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-classpath.el"
;;;;;;  "61a53de70a5e2fa5066f199770413644")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-20140905.2016/cider-classpath.el

(autoload 'cider-classpath "cider-classpath" "\
List all classpath entries.

\(fn)" t nil)

(autoload 'cider-open-classpath-entry "cider-classpath" "\
Open a classpath entry.

\(fn)" t nil)

;;;***

;;;### (autoloads (cider-inspect) "cider-inspector" "../../../../.emacs.d/elpa/cider-20140905.2016/cider-inspector.el"
;;;;;;  "a9ac31590994afffe7dd4f5581ac8311")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-20140905.2016/cider-inspector.el

(autoload 'cider-inspect "cider-inspector" "\
Eval the string EXPRESSION and inspect the result.

\(fn EXPRESSION)" t nil)

;;;***

;;;### (autoloads (cider-macroexpand-all cider-macroexpand-1) "cider-macroexpansion"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-macroexpansion.el"
;;;;;;  "f565accdf13248168ba433fe5d769467")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-20140905.2016/cider-macroexpansion.el

(autoload 'cider-macroexpand-1 "cider-macroexpansion" "\
Invoke 'macroexpand-1' on the expression preceding point.
If invoked with a PREFIX argument, use 'macroexpand' instead of
'macroexpand-1'.

\(fn &optional PREFIX)" t nil)

(autoload 'cider-macroexpand-all "cider-macroexpansion" "\
Invoke 'clojure.walk/macroexpand-all' on the expression preceding point.

\(fn)" t nil)

;;;***

;;;### (autoloads (cider-mode cider-mode-line) "cider-mode" "../../../../.emacs.d/elpa/cider-20140905.2016/cider-mode.el"
;;;;;;  "567ba3dc6c5d0938b4e3f4c36a2f5124")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-20140905.2016/cider-mode.el

(defvar cider-mode-line '(:eval (format " cider[%s]" (cider-current-ns))) "\
Mode line ligher for `cider-mode'.

The value of this variable is a mode line template as in
`mode-line-format'.  See Info Node `(elisp)Mode Line Format' for
details about mode line templates.

Customize this variable to change how `cider-mode' displays its
status in the mode line.  The default value displays the current ns.
Set this variable to nil to disable the mode line
entirely.")

(custom-autoload 'cider-mode-line "cider-mode" t)

(autoload 'cider-mode "cider-mode" "\
Minor mode for REPL interaction from a Clojure buffer.

\\{cider-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (cider-scratch) "cider-scratch" "../../../../.emacs.d/elpa/cider-20140905.2016/cider-scratch.el"
;;;;;;  "826af819f5af46b58706d9e11a222a91")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-20140905.2016/cider-scratch.el

(autoload 'cider-scratch "cider-scratch" "\
Create a scratch buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads (cider-selector) "cider-selector" "../../../../.emacs.d/elpa/cider-20140905.2016/cider-selector.el"
;;;;;;  "b81e9e0a8e612b2620bf3a80e1290ae1")
;;; Generated autoloads from ../../../../.emacs.d/elpa/cider-20140905.2016/cider-selector.el

(autoload 'cider-selector "cider-selector" "\
Select a new buffer by type, indicated by a single character.
The user is prompted for a single character indicating the method by
which to choose a new buffer.  The `?' character describes then
available methods.  OTHER-WINDOW provides an optional target.

See `def-cider-selector-method' for defining new methods.

\(fn &optional OTHER-WINDOW)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/cider-20140905.2016/cider-browse-ns.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-classpath.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-client.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-doc.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-eldoc.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-inspector.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-interaction.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-macroexpansion.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-mode.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-repl.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-scratch.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-selector.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-stacktrace.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-test.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider-util.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/cider.el"
;;;;;;  "../../../../.emacs.d/elpa/cider-20140905.2016/nrepl-client.el")
;;;;;;  (21514 60891 393114 0))

;;;***

(provide 'cider-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cider-autoloads.el ends here
