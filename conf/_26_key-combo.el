;;;----------------------------------------
;;; key-combo ;with flex-autopair
;;;----------------------------------------

(require 'flex-autopair)
(flex-autopair-mode 1)

;; tramp越しだと重い
;; C-@ mark-word*がC-SPCに変えられる
(require 'key-combo)
;;(setq default-input-method "MacOSX")

(global-key-combo-mode 1)
;;(key-combo-load-default)

;; smartchar
(key-combo-define-global (kbd "=") '(" = " " == " "="))
(key-combo-define-global (kbd "~") '("~" " =~ " "~/"))
(key-combo-define-global (kbd ">") '(">" " => " " >> "))
(key-combo-define-global (kbd "<") '("<" " << "))
(key-combo-define-global (kbd "!") '("!" " != "))
(key-combo-define-global (kbd "&") '("&" " && "))
(key-combo-define-global (kbd "|") '("|" " || " " ||= "))
(key-combo-define-global (kbd "N") '("N" "\\n" "\"`!!'\\n\"" "NN"))
(key-combo-define-global (kbd "{") '("{`!!'}" "{\n`!!'\n}"))

;; 2 stroke
(key-combo-define-global (kbd "<!") "<!-- `!!' -->")
(key-combo-define-global (kbd "[%") "[% `!!' %]") ;;sgml-mode?

;; escape
(key-combo-define-global (kbd "{}") "{}")
(key-combo-define-global (kbd "+=") " += ")
(key-combo-define-global (kbd "-=") " -= ")
(key-combo-define-global (kbd "*=") " *= ")
(key-combo-define-global (kbd "/=") " /= ")
(key-combo-define-global (kbd "!=") " != ")
(key-combo-define-global (kbd "%=") " %= ")
(key-combo-define-global (kbd "^=") " ^= ")
(key-combo-define-global (kbd ">=") " >= ")
(key-combo-define-global (kbd "<=") " <= ")
(key-combo-define-global (kbd "&=") " &= ")
(key-combo-define-global (kbd "||=") " ||= ")

;; move bol or eol
(key-combo-define-global (kbd "C-a")
                         '(move-beginning-of-line
                                beginning-of-buffer key-combo-return))
(key-combo-define-global (kbd "C-e")
                         '(move-end-of-line
                                end-of-buffer key-combo-return))


(add-hook 'c-mode-common-hook
          (lambda ()
            (key-combo-define-local (kbd "/") '(" / " "// " "/* `!!' */" "/*\n* `!!'\n*/" "/"))
          ))

(add-hook 'cperl-mode-hook
          (lambda ()
            (key-combo-define-local (kbd "W") '("W" "warn Dumper `!!';" "WW"))
            (key-combo-define-local (kbd ".=") " .= ")
          ))

