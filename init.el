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

(add-to-list 'load-path "/home/xkal/.emacs.d/elpa/js2-mode-20150911.116/")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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


(require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))


;; Uncomment this to change JS indentation settings:
;;(load "~/.emacs.d/init-js-settings.el")
