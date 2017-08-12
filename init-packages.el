(require 'package)

(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

; list the packages you want
(setq package-list
      '(python-environment deferred sr-speedbar epc multi-term helm jinja2-mode django-mode linum-off nodejs-repl smooth-scrolling
        flycheck ctable jedi concurrent js2-mode sml-mode jquery-doc simple-httpd web-mode
		slime skewer-mode window-purpose fill-column-indicator company-quickhelp company cyberpunk-theme elpy 
		yasnippet pyvenv highlight-indentation find-file-in-project 
		sql-indent sql exec-path-from-shell ipython iedit vagrant
        auto-complete popup json-mode exec-path-from-shell let-alist magit popup tern tern-auto-complete web-beautify))


; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


