(require 'sql)
(require 'sql-indent)

(setq sql-postgres-program "/usr/bin/psql")

(defun pop-to-sqli-buffer ()
  "Switch to the corresponding sqli buffer."
  (interactive)
  (if sql-buffer
      (progn
        (pop-to-buffer sql-buffer)
        (goto-char (point-max)))
    (sql-set-sqli-buffer)
    (when sql-buffer
      (pop-to-sqli-buffer))))

(setq-default sql-input-ring-file-name
              (expand-file-name ".sqli_history" user-emacs-directory))


(defun font-lock-everything-in-sql-interactive-mode ()
  (unless (eq 'oracle sql-product)
    (sql-product-font-lock nil nil)))

(add-hook 'sql-interactive-mode-hook 'font-lock-everything-in-sql-interactive-mode)


(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))


;; Save history into sql directory
(defun my-sql-save-history-hook ()
    (let ((lval 'sql-input-ring-file-name)
          (rval 'sql-product))
      (if (symbol-value rval)
          (let ((filename 
                 (concat "~/.emacs.d/sql/"
                         (symbol-name (symbol-value rval))
                         "-history.sql")))
            (set (make-local-variable lval) filename))
        (error
         (format "SQL history will not be saved because %s is nil"
                 (symbol-name rval))))))
 
  (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)

(setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "postgres")
        (server :default "localhost")
        (port :default 5432)))

