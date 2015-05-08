;;;----------------------------------------
;;; dired_ext
;;;----------------------------------------

;; OS でファイル、ディレクトリ、URL を直接開くためのコマンドを決定する
(defun os-open-command-name ()
  (cond (cygwin-p "cygstart")
        (nt-p "")
        (linux-p "gnome-open")
        (darwin-p "open")))

;; OS で直接、ファイル、ディレクトリ、URL を開く
(defun os-open-command (filename)
  (interactive)
  (let* ((default-directory (if (file-regular-p filename)
                                (file-name-directory filename)
                              default-directory))
         (localname (if (file-remote-p filename)
                        (tramp-file-name-localname
                         (tramp-dissect-file-name filename))
                      filename))
         (os-open-command-name (os-open-command-name)))
    (when os-open-command-name
      (shell-command-to-string
       (concat os-open-command-name " "
               (shell-quote-argument localname) " &"))
      (message "%s" (concat os-open-command-name " " localname)))))

;; dired で W 押下時に、カーソル位置のファイルを OS で直接起動
(define-key dired-mode-map (kbd "W")
  (lambda ()
    (interactive)
    (let ((file (dired-get-filename nil t)))
      (recentf-push file) ; recentf に追加する
      (os-open-command file))))

;; dired で E 押下時に、開いているディレクトリを OS で直接開く
(defun os-open-dir ()
  (interactive)
  (if windows-p
      (shell-command "explorer .")
    (os-open-command (dired-current-directory))))
(define-key dired-mode-map (kbd "E") 'os-open-dir)
(global-set-key (kbd "C-q e") 'os-open-dir)

;; OS で起動したいファイルの拡張子一覧
(setq os-open-file-suffixes '("doc" "docx"
                              "xls" "xlsx"
                              "ppt" "pptx"
                              "mdb" "mdbx"
                              "vsd" "vdx" "vsdx"
                              "mpp"
                              "pdf"
                              "bmp" "jpg"
                              "odt" "ott"
                              "odg" "otg"
                              "odp" "otp"
                              "ods" "ots"
                              "odf"
                              ))

;; OS で直接開きたいファイルかどうかを判定する
(defun os-open-file-p (file)
  (if (file-regular-p file)
      (let ((ext (file-name-extension file)))
        (if (and ext
                 (member (downcase ext) os-open-file-suffixes)
                 (os-open-command-name))
            t))))

;; os-open-file-suffixesのファイルをOSで直接起動する
(defadvice find-file (around ad-find-file-os-open-command-setup activate)
  (let ((file (ad-get-arg 0)))
    (cond ((os-open-file-p file)
           (recentf-push file) ; recentf に追加する
           (os-open-command file))
          (t
           ad-do-it))))
