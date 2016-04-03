(defun syntax-color-hex ()
"Syntax color hex color spec in current buffer."
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer)
  )


(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of fill-paragraph."
  (interactive)
  (let ((fill-column 90002000)) ; 90002000 is just random.
    (fill-paragraph nil)))


(defun unfill-region (start end)
  "Replace newline chars in region by single spaces.
This command does the inverse of fill-region."
  (interactive "r")
  (let ((fill-column 90002000))
    (fill-region start end)))


(defun replace-html-chars-region (start end)
  "Replace “<” to “&lt;” and other chars in HTML.
This works on the current region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "&" nil t) (replace-match "&amp;" nil t))
    (goto-char (point-min))
    (while (search-forward "<" nil t) (replace-match "&lt;" nil t))
    (goto-char (point-min))
    (while (search-forward ">" nil t) (replace-match "&gt;" nil t))
    )
  )


(defun wrap-html-tag (tagName)
  "Add a tag to beginning and ending of current word or text selection."
  (interactive "Enter tag name: ")
  (let (p1 p2 inputText)
    (if (use-region-p)
        (progn
          (setq p1 (region-beginning) )
          (setq p2 (region-end) )
          )
      (let ((bds (bounds-of-thing-at-point 'symbol)))
        (setq p1 (car bds) )
        (setq p2 (cdr bds) ) ) )

    (goto-char p2)
    (insert "</" tagName ">")
    (goto-char p1)
    (insert "<" tagName ">")
    ))


(defun wrap-url ()
  "Make the URL at cursor point into a HTML link.\n
Example: http://wikipedia.org/
becomes
<a href=\"http://en.wikipedia.org/\">http://wikipedia.org/</a>"
  (interactive)
  (re-search-backward "[\n\t ()]" nil t)
  (looking-at "[\n\t ()]?\\([^\n\t ()]+\\)")
  (let (
        (p1 (match-beginning 1))
        (p2 (match-end 1))
        (url (match-string 1))
        )
    (delete-region p1 p2)
    (goto-char p1)
    (insert "<a href=\"" url "\">" url "</a>" )
    )
  )


(defun open-in-external-app ()
  "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference."
  (interactive)
  (let* (
         (ξfile-list
          (if (string-equal major-mode "dired-mode")
              (dired-get-marked-files)
            (list (buffer-file-name))))
         (ξdo-it-p (if (<= (length ξfile-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))

    (when ξdo-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda (fPath)
           (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t))) ξfile-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda (fPath) (shell-command (format "open \"%s\"" fPath)))  ξfile-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath))) ξfile-list))))))


(defun describe-char-on-click (φclick)
  "Mouse click to describe-char at clicked point."
  (interactive "e")
  (let ((p1 (posn-point (event-start φclick))))
    (goto-char p1)
    (describe-char p1)
    ))


;; make backup to a designated dir, mirroring the full path
(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir "~/.emacs.d/emacs-backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, ⁖ “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)


(defun copy-line-or-region ()
  "Copy current line, or text selection.
When universal-argument is called first, copy whole buffer (but respect narrow-to-region)."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-end-position)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-ring-save p1 p2)))


(defun cut-line-or-region ()
  "Cut current line, or text selection.
When universal-argument is called first, cut whole buffer (but respect narrow-to-region)."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-beginning-position 2)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-region p1 p2)))



(defun lookup-wikipedia ()
  "Look up the word under cursor in Wikipedia.
If there is a text selection (a phrase), use that.

This command switches you to your browser."
 (interactive)
 (let (myWord myUrl)
   (setq myWord
         (if (use-region-p)
             (buffer-substring-no-properties (region-beginning) (region-end))
           (thing-at-point 'symbol)))

  (setq myWord (replace-regexp-in-string " " "_" myWord))
  (setq myUrl (concat "http://en.wikipedia.org/wiki/" myWord))
  (browse-url myUrl)
   ))


(defun lookup-word-definition ()
  "Look up the current word's definition in a browser.
If a region is active (a phrase), lookup that phrase."
 (interactive)
 (let (myWord myUrl)
   (setq myWord
         (if (use-region-p)
             (buffer-substring-no-properties (region-beginning) (region-end))
           (thing-at-point 'symbol)))

  (setq myWord (replace-regexp-in-string " " "%20" myWord))
  (setq myUrl (concat "http://www.answers.com/main/ntquery?s=" myWord))

  (browse-url myUrl)
  ;; (w3m-browse-url myUrl) ;; if you want to browse using w3m
   ))


(defun lookup-google ()
  "Look up the word under cursor in Wikipedia.
If there is a text selection (a phrase), use that.

This command switches you to your browser."
 (interactive)
 (let (myWord myUrl)
   (setq myWord
         (if (use-region-p)
             (buffer-substring-no-properties (region-beginning) (region-end))
           (thing-at-point 'symbol)))

  (setq myWord (replace-regexp-in-string " " "_" myWord))
  (setq myUrl (concat "http://www.google.com/search?q=�" myWord))
  (browse-url myUrl)
   ))


(defun unfontify-region-or-buffer ()
  "Unfontify text selection or buffer."
  (interactive)
  (if (region-active-p)
      (font-lock-unfontify-region (region-beginning) (region-end))
    (font-lock-unfontify-buffer)))


(defun click-to-search (φclick)
  "Mouse click to start isearch-forward-symbol-at-point (emacs 24.4) at clicked point."
  (interactive "e")
  (let ((p1 (posn-point (event-start φclick))))
    (goto-char p1)
    (isearch-forward-symbol-at-point)
    ))


(defun next-user-buffer ()
  "Switch to the next user buffer.
 “user buffer” is a buffer whose name does not start with “*”.
If switch-buffer-ignore-dired is true, also skip directory buffer.
2015-01-05 URL http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (or
           (string-equal "*" (substring (buffer-name) 0 1))
           (if (string-equal major-mode "dired-mode")
               switch-buffer-ignore-dired
             nil
             ))
          (progn (next-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))


(defun previous-user-buffer ()
  "Switch to the previous user buffer.
 user buffer is a buffer whose name does not start with *.
If switch-buffer-ignore-dired is true, also skip directory buffer.
2015-01-05 URL http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (or
           (string-equal "*" (substring (buffer-name) 0 1))
           (if (string-equal major-mode "dired-mode")
               xah-switch-buffer-ignore-dired
             nil
             ))
          (progn (previous-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))


(defun quit-bottom-side-windows ()
  "Quit side windows of the current frame."
  (interactive)
  (dolist (window (window-at-side-list))
    (quit-window nil window)))



