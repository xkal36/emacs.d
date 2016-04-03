;;(add-to-list 'load-path "/home/xkal/.emacs.d/elpa/js2-mode-20150911.116/")
;;(autoload 'js2-mode "js2-mode" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'simple-httpd)
(require 'skewer-mode)
(skewer-setup)
(add-hook 'js-mode-hook 'skewer-mode)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)



(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(require 'jquery-doc)
(add-hook 'js2-mode-hook 'jquery-doc-setup)

(binary-overwrite-mode 0)

(require 'nodejs-repl)

(require 'smooth-scrolling)

(require 'nodejs-repl-eval)
(define-key js2-mode-map (kbd "C-x C-n") 'nodejs-repl-eval-dwim)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))



;; Use js-mode indentation in js2-mode, I don't like js2-mode's indentation
;;
;; thanks http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
;; with my own modifications
;;
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status))
           node)

      (save-excursion

        (back-to-indentation)
        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation ( 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-indent-sexp ()
  (interactive)
  (save-restriction
    (save-excursion
      (widen)
      (let* ((inhibit-point-motion-hooks t)
             (parse-status (syntax-ppss (point)))
             (beg (nth 1 parse-status))
             (end-marker (make-marker))
             (end (progn (goto-char beg) (forward-list) (point)))
             (ovl (make-overlay beg end)))
        (set-marker end-marker end)
        (overlay-put ovl 'face 'highlight)
        (goto-char beg)
        (while (< (point) (marker-position end-marker))
          ;; don't reindent blank lines so we don't set the "buffer
          ;; modified" property for nothing
          (beginning-of-line)
          (unless (looking-at "\\s-*$")
            (indent-according-to-mode))
          (forward-line))
        (run-with-timer 0.5 nil '(lambda(ovl)
                                   (delete-overlay ovl)) ovl)))))

(defun my-js2-mode-hook ()
  (require 'js)
  (setq js-indent-level 4
        indent-tabs-mode nil
        c-basic-offset 4)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(meta control |)] 'cperl-lineup)
  (define-key js2-mode-map [(meta control \;)] 
    '(lambda()
       (interactive)
       (insert "/* -----[ ")
       (save-excursion
         (insert " ]----- */"))
       ))
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map [(control meta q)] 'my-indent-sexp)
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
  (message "My JS2 hook"))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)


;; Proper indentation for Node.js:

(add-hook 'js-mode-hook (lambda ()  
                          (defun js--proper-indentation (parse-status)
                            "Return the proper indentation for the current line."
                            (save-excursion
                              (back-to-indentation)
                              (cond
                               ((looking-at ",")
                                (let ((spos
                                       (save-excursion
                                         (while (looking-back "}[\t\n ]*")
                                           (backward-sexp)
                                           (if (looking-back ",[\t\n ]*")
                                               (re-search-backward ",[\t\n ]*")))

                                         (cond
                                          ((looking-back "\\(,\\|(\\)[ \t]*\\<\\([^:=\n\t ]+\\)[ \t\n]*")
                                           (re-search-backward "\\(,\\|(\\)[ \t]*\\<\\([^:=\n\t ]+\\)[ \t\n]*" (point-min) t)
                                           (+ (current-column) 2))

                                          ((re-search-backward "\\<\\([^:=\n\t ]+\\)[ \t]*\\(:\\|=\\)" (point-min) t)
                                           (current-column))
                                          (t 
                                           nil)))))
                                  (if spos
                                      (- spos 2)
                                    (+ js-indent-level js-expr-indent-offset))))
                               ((nth 4 parse-status)
                                (js--get-c-offset 'c (nth 8 parse-status)))
                               ((nth 8 parse-status) 0) ; inside string
                               ((js--ctrl-statement-indentation))
                               ((eq (char-after) ?#) 0)
                               ((save-excursion (js--beginning-of-macro)) 4)
                               ((nth 1 parse-status)
                                ;; A single closing paren/bracket should be indented at the
                                ;; same level as the opening statement. Same goes for
                                ;; "case" and "default".
                                (let ((same-indent-p (looking-at
                                                      "[]})]\\|\\_<case\\_>\\|\\_<default\\_>"))
                                      (continued-expr-p (js--continued-expression-p)))
                                  (goto-char (nth 1 parse-status)) ; go to the opening char
                                  (if (looking-at "[({[]\\s-*\\(/[/*]\\|$\\)")
                                      (progn ; nothing following the opening paren/bracket
                                        (skip-syntax-backward " ")
                                        (when (eq (char-before) ?\)) (backward-list))
                                        (back-to-indentation)
                                        (cond (same-indent-p
                                               (current-column))
                                              (continued-expr-p
                                               (+ (current-column) (* 2 js-indent-level)
                                                  js-expr-indent-offset))
                                              (t
                                               (+ (current-column) js-indent-level
                                                  (case (char-after (nth 1 parse-status))
                                                    (?\( js-paren-indent-offset)
                                                    (?\[ js-square-indent-offset)
                                                    (?\{ js-curly-indent-offset))))))
                                    ;; If there is something following the opening
                                    ;; paren/bracket, everything else should be indented at
                                    ;; the same level.
                                    (unless same-indent-p
                                      (forward-char)
                                      (skip-chars-forward " \t"))
                                    (current-column))))

                               ((js--continued-expression-p)
                                (+ js-indent-level js-expr-indent-offset))
                               (t 0))))))
