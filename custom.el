(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-quick-help-prefer-pos-tip nil)
 '(ansi-color-faces-vector
   [default bold default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red4" "green" "yellow4" "blue3" "magenta4" "cyan4" "white"])
 '(blink-cursor-mode nil)
 '(c-initialization-hook (quote (ignore)))
 '(c-label-minimum-indentation 4)
 '(column-number-mode t)
 '(company-auto-complete t)
 '(company-quickhelp-delay 0.4)
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
    ("d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "561ba4316ba42fe75bc07a907647caa55fc883749ee4f8f280a29516525fc9e8" "274e030e327161ccb5d8c73a6458ba6f5cbdfdd5f05f6ce7e710779d87083eda" "b9e72874e3180f42d4ecdee8b5ecbf67fe5e922747ca50c8b9ca5960988c6277" "a491c2db211cf4f203cc357dd6e49944734a27d512127eac942a2b0c438b0c2e" default)))
 '(display-buffer-reuse-frames t)
 '(electric-pair-mode 1)
 '(elpy-rpc-backend "jedi")
 '(global-linum-mode 1)
 '(gud-pdb-command-name "python -m pdb")
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(ido-save-directory-list-file "~/.emacs.d/.ido.last")
 '(inhibit-startup-screen t)
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; Happy hacking xkal!!
")
 '(neo-window-fixed-size nil)
 '(package-selected-packages
   (quote
    (window-purpose web-beautify vagrant tern-auto-complete sql-indent slime skewer-mode minimap magit json-mode jquery-doc jedi ipython iedit flycheck exec-path-from-shell elpy cyberpunk-theme)))
 '(powerline-text-scale-factor 1.4)
 '(ps-line-number nil)
 '(pyvenv-activate nil)
 '(realgud:ipdb-command-name "python -m ipdb")
 '(realgud:pdb-command-name "python -m pdb")
 '(recentf-mode t)
 '(setq show-paren-style t)
 '(show-paren-mode t)
 '(spaceline-all-the-icons-file-name-highlight nil)
 '(spaceline-all-the-icons-highlight-file-name nil)
 '(speedbar-use-images nil)
 '(sr-speedbar-default-width 25)
 '(sr-speedbar-max-width 25)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-width 25 t)
 '(term-default-fg-color nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "apple" :family "Menlo"))))
 '(ac-candidate-mouse-face ((t (:inherit popup-menu-mouse-face :background "cyan" :foreground "black"))))
 '(ac-selection-face ((t (:background "yellow" :foreground "#000000"))))
 '(antlr-ruledef ((t (:foreground "red"))))
 '(antlr-tokendef ((t (:foreground "red"))))
 '(buffer-menu-buffer ((t (:weight bold))))
 '(comint-highlight-input ((t (:foreground "green"))))
 '(company-echo ((t (:foreground "spring green"))) t)
 '(company-preview ((t (:background "red" :foreground "#d3d3d3"))))
 '(company-preview-common ((t (:inherit company-preview :background "light sky blue" :foreground "white"))))
 '(company-scrollbar-bg ((t (:background "green" :foreground "black"))))
 '(company-scrollbar-fg ((t (:background "dark green"))))
 '(company-tooltip ((t (:background "dim gray" :foreground "#ffff00"))))
 '(company-tooltip-annotation ((t (:background "dim gray" :foreground "orange"))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :foreground "black"))))
 '(company-tooltip-mouse ((t (:inherit highlight :background "blue"))))
 '(company-tooltip-selection ((t (:background "red" :foreground "#000000"))))
 '(completions-annotations ((t (:inherit italic))))
 '(css-selector ((t (:foreground "magenta"))))
 '(ctbl:face-continue-bar ((t (:background "blue"))))
 '(cua-global-mark ((t (:background "dark orange" :foreground "black"))))
 '(cua-rectangle ((t (:background "dark orange" :foreground "white"))))
 '(cursor ((t (:background "green" :foreground "black"))))
 '(custom-button ((t (:background "grey90" :foreground "black" :box (:line-width 2 :style released-button)))))
 '(custom-button-pressed ((t (:background "dark gray" :foreground "black" :box (:line-width 2 :style pressed-button)))))
 '(custom-state ((t (:foreground "green"))))
 '(dired-directory ((t (:foreground "royal blue"))))
 '(dired-flagged ((t (:foreground "DarkOrange2"))))
 '(dired-mark ((t (:foreground "cornflower blue"))))
 '(dired-warning ((t (:background "red"))))
 '(elscreen-tab-background-face ((t (:background "black"))))
 '(elscreen-tab-control-face ((t (:background "black" :foreground "white" :underline "Gray50"))))
 '(elscreen-tab-current-screen-face ((t (:background "#fcfc4b" :foreground "black"))))
 '(elscreen-tab-other-screen-face ((t (:background "dark olive green" :foreground "black"))))
 '(epc:face-title ((t (:foreground "magenta" :weight bold))))
 '(eshell-ls-unreadable ((t (:foreground "white"))))
 '(eshell-prompt ((t (:foreground "Green" :weight bold))))
 '(flycheck-error-list-checker-name ((t (:background "black" :foreground "red"))))
 '(flycheck-error-list-id ((t (:foreground "red"))))
 '(flycheck-error-list-info ((t (:foreground "magenta"))))
 '(font-lock-builtin-face ((t (:foreground "cyan"))))
 '(font-lock-comment-face ((t (:foreground "gray56" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "dark cyan"))))
 '(font-lock-doc-face ((t (:foreground "#ff6666"))))
 '(font-lock-doc-string-face ((t (:foreground "#ff6666"))) t)
 '(font-lock-function-name-face ((t (:foreground "magenta"))))
 '(font-lock-keyword-face ((t (:foreground "deep sky blue"))))
 '(font-lock-preprocessor-face ((t (:foreground "PaleGreen1"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "tan"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "dark olive green"))))
 '(font-lock-string-face ((t (:foreground "green"))))
 '(font-lock-type-face ((t (:background "black" :foreground "orange"))))
 '(font-lock-variable-name-face ((t (:foreground "#ffff4c"))))
 '(font-lock-warning-face ((t (:foreground "red"))))
 '(highlight-beyond-fill-column-face ((t (:foreground "red"))))
 '(highlight-indentation-current-column-face ((t (:background "gray15" :weight thin :width condensed))))
 '(highlight-indentation-face ((t (:background "gray15" :weight thin :width condensed))))
 '(ido-first-match ((t (:background "#000000" :foreground "DarkOrchid" :height 1.5))))
 '(ido-incomplete-regexp ((t (:inherit font-lock-warning-face :height 1.5))))
 '(ido-indicator ((t (:background "red" :foreground "#000000" :height 1.5))))
 '(ido-only-match ((t (:background "#000000" :foreground "DarkOrchid" :height 1.5))))
 '(ido-subdir ((t (:foreground "#999999" :height 1.5))))
 '(ido-virtual ((t (:inherit font-lock-builtin-face :height 1.5))))
 '(info-header-node ((t (:inherit info-node :height 1.0))))
 '(isearch ((t (:background "dark orange" :foreground "#000000"))))
 '(js2-error ((t (:foreground "Red"))))
 '(js2-external-variable ((t (:foreground "orange"))))
 '(js2-function-call ((t (:foreground "#ff1493"))))
 '(js2-instance-member ((t (:foreground "orange"))))
 '(js2-jsdoc-html-tag-name ((t (:foreground "cyan"))))
 '(js2-warning ((t (:underline t))))
 '(linum ((t (:background "dark cyan" :foreground "#ffff4c" :height 100))))
 '(magit-section-title ((t (:foreground "yellow"))) t)
 '(match ((t (:background "#000000" :foreground "yellow"))))
 '(mc/cursor-face ((t (:background "orange" :foreground "#000000" :inverse-video nil))) t)
 '(minibuffer-prompt ((t (:background "black" :foreground "green"))))
 '(minimap-active-region-background ((t (:background "gray29"))))
 '(minimap-font-face ((t (:height 50 :family "DejaVu Sans Mono"))))
 '(mode-line ((t (:background "dark slate gray" :foreground "#030303" :box nil :height 1.0))))
 '(mode-line-buffer-id ((t (:foreground "blue" :weight bold))))
 '(mode-line-buffer-id-inactive ((t (:foreground "blue"))))
 '(mode-line-highlight ((t (:box (:line-width 2 :color "#ffff4c" :style released-button)))))
 '(mode-line-inactive ((t (:background "gray29" :foreground "#f9f9f9" :box nil))))
 '(nxml-element-local-name ((t (:background "black" :foreground "blue"))))
 '(nxml-text ((t (:foreground "green"))) t)
 '(outline-8 ((t (:foreground "green"))))
 '(popup-menu-mouse-face ((t (:background "blue" :foreground "white"))))
 '(popup-tip-face ((t (:background "cyan" :foreground "black"))))
 '(pos-tip-temp ((t (:foreground "black" :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))) t)
 '(powerline-active1 ((t (:inherit mode-line :background "dark cyan"))))
 '(powerline-active2 ((t (:inherit mode-line :background "gray19"))))
 '(region ((t (:background "blue"))))
 '(scroll-bar ((t (:background "green" :foreground "black"))))
 '(secondary-selection ((t (:background "purple"))))
 '(show-paren-match ((t (:background "dark orange" :foreground "#000000"))))
 '(spaceline-flycheck-error ((t (:distant-foreground "#A20C41" :foreground "red"))))
 '(spaceline-highlight-face ((t (:background "#07A47C" :foreground "#3E3D31" :inherit (quote mode-line)))))
 '(speedbar-file-face ((t (:foreground "blue"))))
 '(speedbar-selected-face ((t (:foreground "blue" :underline t))))
 '(speedbar-separator-face ((t (:background "cyan" :foreground "black" :overline "gray"))))
 '(speedbar-tag-face ((t (:foreground "magenta"))))
 '(term ((t (:background "black" :foreground "green"))))
 '(term-bold ((t (:foreground "green" :weight bold))))
 '(term-color-cyan ((t (:background "#000000" :foreground "#93e0e3"))))
 '(term-color-green ((t (:background "dim gray" :foreground "#00ff00"))))
 '(term-color-red ((t (:background "#8c5353" :foreground "red"))))
 '(term-default-fg-color ((t (:foreground "green"))) t)
 '(tool-bar ((t (:background "blue" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(vertical-border ((t (:background "#000000" :foreground "#ffff4c"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#ffff4c"))))
 '(web-mode-html-attr-value-face ((t (:foreground "lime green"))))
 '(web-mode-html-tag-face ((t (:foreground "magenta"))))
 '(web-mode-keyword-face ((t (:foreground "magenta"))))
 '(widget-documentation ((t (:foreground "green"))))
 '(widget-inactive ((t (:inherit shadow :foreground "black")))))


(add-hook 'css-mode-hook 'syntax-color-hex)
(add-hook 'php-mode-hook 'syntax-color-hex)
(add-hook 'html-mode-hook 'syntax-color-hex)

;; hide menu-bar and scroll bar
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; make org mode allow eval of some langs
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (clojure . t)
   (python . t)
   (ruby . t)))

(setq magit-last-seen-setup-instructions "1.4.0")

;; make ido display choices vertically
(setq ido-separator "\n")

;; display any item that contains the chars you typed
(setq ido-enable-flex-matching t)

; set default tab char's display width to 4 spaces
(setq-default tab-width 4) ; emacs 23.1, 24.2, default to 8

(setq-default indent-tabs-mode nil)
;; set current buffer's tab char's display width to 4 spaces
(setq tab-width 4)

(global-visual-line-mode 0) ; 1 for on, 0 for off.

(setq org-src-fontify-natively t)

(setq make-backup-file-name-function 'my-backup-file-name)

;; turn on save place so that when opening a file, the cursor will be at the last position.
(setq save-place-file (concat user-emacs-directory "saveplace.el") ) ; use standard emacs dir
(setq-default save-place t)

;; don't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

;; allow dired to be able to delete or copy a whole dir.
(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes (quote top)) ; “top” means ask once

(setq dired-dwim-target t)

(defvar switch-buffer-ignore-dired t "If t, ignore dired buffer when calling next-user-buffer or xah-previous-user-buffer")
(setq switch-buffer-ignore-dired t)

(company-quickhelp-mode 1)

(setq pos-tip-background-color "blue")

;; use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings)

;; when cursor is on edge, move to the other side
(setq windmove-wrap-around t )

;; auto indent yanked (pasted) code               
(dolist (command '(yank yank-pop))
   (eval `(defadvice ,command (after indent-region activate)
            (and (not current-prefix-arg)
                 (member major-mode '(emacs-lisp-mode lisp-mode
                                                      clojure-mode    scheme-mode
                                                      haskell-mode    ruby-mode
                                                      rspec-mode      python-mode
                                                      c-mode          c++-mode
                                                      objc-mode       latex-mode
                                                      plain-tex-mode))
                 (let ((mark-even-if-inactive transient-mark-mode))
                   (indent-region (region-beginning) (region-end) nil))))))
