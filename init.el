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

(require 'powerline)

;;(load "elscreen.el")
(load "fullscreen.el")
(load "virtualenv.el")
;;(load "highlight-beyond-fill-column")
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

(set-face-attribute 'mode-line nil  :height 80)

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

;; allow emacs to find node modules:
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/usr/local/bin")

;;(require 'flymake-jshint)


(add-hook
 'eshell-mode-hook
 (lambda ()
   (setenv "TERM" "emacs") ; enable colors
   ))


;; Keep line numbers same size when changing font size in editor:
(eval-after-load "linum"
  '(set-face-attribute 'linum nil :height 100))


;; setting window size upon startup
(when window-system (set-frame-size (selected-frame) 230 60))

(defun window-system-name()
  (cond ((eq system-type 'gnu/linux) (if (display-graphic-p) "x"   "nox"))
        ((eq system-type 'darwin)    (if (display-graphic-p) "mac" "nox"))
        (t (error "Unsupported window-system") nil)))


(add-hook
 'eshell-mode-hook
 (lambda ()
   (setenv "TERM" "emacs") ; enable colors
   ))

;; eslint settings:

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)


;; flycheck is already turned on globally

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))


;; Change terrible flycheck default keybindings:
(define-key flycheck-mode-map (kbd "C-c f l") #'flycheck-list-errors)
(define-key flycheck-mode-map (kbd "C-c f n") #'flycheck-next-error)
(define-key flycheck-mode-map (kbd "C-c f p") #'flycheck-previous-error)

(require 'web-mode)


;; Fix indentation of switch statements:
(c-set-offset 'case-label '+)

;;(set-fringe-mode 0)

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))


;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(setq inferior-lisp-program "/usr/local/bin/clisp")


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'init)
;;; init.el ends here


