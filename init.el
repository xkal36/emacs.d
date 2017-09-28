
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(require 'auto-complete)

(require 'flycheck)


(require 'org)
(require 'ob)
(require 'saveplace)
(require 'dired-x)

(load "~/.emacs.d/init-packages")

(elpy-enable)

;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

(require 'helm)
(require 'sr-speedbar)
(require 'company-quickhelp)
(require 'jedi)

;;(require 'powerline)

;;(load "elscreen.el")
(load "fullscreen.el")
(load "virtualenv.el")
;;(load "highlight-beyond-fill-column")
(load "unbound")

(require 'fill-column-indicator)

(require 'auto-complete)
(require 'auto-complete-config)
(require 'fill-column-indicator)
(ac-config-default)

(require 'multi-term)
(setq multi-term-program "/bin/bash")

(require 'jinja2-mode)

(require 'linum-off)

(require 'buffer-move)

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

(require 'popup)


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
;;(add-hook 'prog-mode-hook 'highlight-beyond-fill-column)


(set-frame-font "DejaVu Sans Mono-10")

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; use eslint with js2-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'js2-mode)

(require 'rjsx-mode)

;; use eslint with rjsx-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)


(require 'simple-httpd)
(require 'skewer-mode)
(skewer-setup)
(add-hook 'js-mode-hook 'skewer-mode)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-to-list 'company-backends 'company-tern)

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-hook 'after-init-hook 'global-company-mode)

(require 'jquery-doc)
(add-hook 'js2-mode-hook 'jquery-doc-setup)

(binary-overwrite-mode 0)

(require 'nodejs-repl)

(require 'smooth-scrolling)

;;(require 'nodejs-repl-eval)
;;(define-key js2-mode-map (kbd "C-x C-n") 'nodejs-repl-eval-dwim)

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

(require 'web-mode)

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

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
;;(defadvice web-mode-highlight-part (around tweak-jsx activate)
  ;;(if (equal web-mode-content-type "jsx")
  ;;    (let ((web-mode-enable-part-face nil))
       ;; ad-do-it)
    ;;ad-do-it))


;; Change terrible flycheck default keybindings:
(define-key flycheck-mode-map (kbd "C-c f l") #'flycheck-list-errors)
(define-key flycheck-mode-map (kbd "C-c f n") #'flycheck-next-error)
(define-key flycheck-mode-map (kbd "C-c f p") #'flycheck-previous-error)


;; Fix indentation of switch statements:
(c-set-offset 'case-label '+)

;;(set-fringe-mode 0)


;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))


;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(setq inferior-lisp-program "/usr/local/bin/clisp")


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq byte-compile-warnings '(not free-vars ))

;; where to look for sml executable (will vary depending on system)
(setenv "PATH" (concat "/usr/lib/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/lib/smlnj/bin"  exec-path))

;;(setq-default left-fringe-width 1)

(setq-default right-fringe-width  0)


(set-face-attribute 'fringe nil :background "dark cyan")

(add-hook 'term-mode-hook (lambda()
                            (yas-minor-mode -1)))

(define-key dired-mode-map "c" 'find-file)

(fringe-mode 0)

(global-set-key (kbd "C-c w") 'buf-move-up)
(global-set-key (kbd "C-c s") 'buf-move-down)
(global-set-key (kbd "C-c a") 'buf-move-left)
(global-set-key (kbd "C-c d") 'buf-move-right)


(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(require 'spaceline-config)
(spaceline-spacemacs-theme)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


(use-package spaceline-all-the-icons 
             :after spaceline
             :config (spaceline-all-the-icons-theme))

(spaceline-all-the-icons--setup-neotree) ;; Enable Neotree mode line
(spaceline-all-the-icons--setup-git-ahead)

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(setq flycheck-xml-parser 'flycheck-parse-xml-region)

(with-current-buffer (get-buffer " *Echo Area 0*")                             ; the leading space character is correct
  (setq-local face-remapping-alist '((default (:height 1.4
                                                       ) variable-pitch)))) ; etc.

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
(defun my-minibuffer-setup ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :height 1.4))))

(windmove-default-keybindings)
(setq org-replace-disputed-keys t)

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)


(require 'undo-tree)
(defun undo-tree-visualizer-update-linum (&rest args)
  (linum-update undo-tree-visualizer-parent-buffer))
(advice-add 'undo-tree-visualize-undo :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualize-redo :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualize-undo-to-x :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualize-redo-to-x :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualizer-mouse-set :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualizer-set :after #'undo-tree-visualizer-update-linum)


(provide 'init)

;;; init.el ends here
