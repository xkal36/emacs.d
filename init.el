(require 'org)
(require 'ob)
(require 'saveplace)
(require 'dired-x)

(load "~/.emacs.d/init-packages")

;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

(require 'sr-speedbar)
(require 'company-quickhelp)
(require 'jedi)

;;(load "elscreen.el")
(load "fullscreen.el")
(load "virtualenv.el")
(load "highlight-beyond-fill-column")
(load "unbound")

(require 'auto-complete)
(require 'auto-complete-config)
(require 'fill-column-indicator)
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/site-lisp/django-mode")

(require 'multi-term)
(setq multi-term-program "/bin/bash")

(require 'jinja2-mode)

(require 'django-mode)
(require 'django-html-mode)
(yas/load-directory "~/.emacs.d/site-lisp/django-mode/snippets")
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

(require 'linum-off)


;; Set your lisp system and, optionally, some contribs
 (setq inferior-lisp-program "/usr/bin/sbcl")

(require 'slime)
(setq slime-contribs '(slime-fancy))



(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/init-python-settings")
(load "~/.emacs.d/init-sql-settings")
(load "~/.emacs.d/init-functions")
(load "~/.emacs.d/init-keybindings")
(load "~/.emacs.d/init-js-settings.el")


;; setting window size upon startup
(when window-system (set-frame-size (selected-frame) 127 34))

(add-hook 'after-init-hook #'global-flycheck-mode)


(require 'window-purpose)
(purpose-mode)

(add-to-list 'purpose-user-mode-purposes '(python-mode . py))
(add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))
(purpose-compile-user-configuration)


;; Flycheck error buffer configuration
(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
               (display-buffer-reuse-window
                display-buffer-in-side-window)
               (reusable-frames . visible)
               (side            . bottom)
               (window-height   . 0.4)))
               
               
(setq-default fill-column 80)
(add-hook 'prog-mode-hook 'highlight-beyond-fill-column)


(set-frame-font "DejaVu Sans Mono-10")




