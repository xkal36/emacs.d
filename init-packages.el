(require 'package)

(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))



(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)


(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

; list the packages you want
(setq package-list
      '(auto-complete python-environment deferred sr-speedbar epc multi-term helm jinja2-mode linum-off
        nodejs-repl smooth-scrolling ac-js2 company-tern neotree  all-the-icons flycheck-tip
        flycheck ctable jedi concurrent js2-mode sml-mode jquery-doc simple-httpd web-mode undo-tree
        slime skewer-mode window-purpose fill-column-indicator company-quickhelp company cyberpunk-theme elpy git-gutter
        yasnippet pyvenv highlight-indentation find-file-in-project realgud rjsx-mode use-package highlight-symbol
        sql-indent sql exec-path-from-shell ipython iedit vagrant spaceline all-the-icons-dired spaceline-all-the-icons
        popup json-mode exec-path-from-shell let-alist magit popup tern tern-auto-complete web-beautify))


; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


