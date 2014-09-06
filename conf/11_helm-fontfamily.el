;;;----------------------------------------
;;; helm-fontfamily
;;;----------------------------------------

;; helm font family
(require 'cl-lib)  ; loop, delete-duplicates
(defun helm-font-families ()
  "Preconfigured `helm' for font family."
  (interactive)
  (cl-flet ((helm-mp-highlight-match () nil))
    (helm-other-buffer
     '(helm-c-source-font-families)
     "*helm font families*")))
(defun helm-font-families-create-buffer ()
  (with-current-buffer
      (get-buffer-create "*Fonts*")
    (loop for family in (sort (delete-duplicates (font-family-list)) 'string<)
          do (insert
              (propertize (concat family "\n")
                          'font-lock-face
                          (list :family family :height 2.0 :weight 'bold))))
    (font-lock-mode 1)))
(defvar helm-c-source-font-families
      '((name . "Fonts")
        (init lambda ()
              (unless (helm-candidate-buffer)
                (save-window-excursion
                  (helm-font-families-create-buffer))
                (helm-candidate-buffer
                 (get-buffer "*Fonts*"))))
        (candidates-in-buffer)
        (get-line . buffer-substring)
        (action
         ("Copy Name" lambda
          (candidate)
          (kill-new candidate))
         ("Insert Name" lambda
          (candidate)
          (with-current-buffer helm-current-buffer
            (insert candidate))))))
