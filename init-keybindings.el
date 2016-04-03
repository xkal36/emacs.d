;; set C-6 to list recently opened file
(global-set-key (kbd "C-6") 'recentf-open-files)

;; make tab key always call a indent command.
(setq-default tab-always-indent t)
    
;; make return key also do indent, globally
(electric-indent-mode 1)


;; on linux, make right button show char info on clicked point
(when (string-equal system-type "gnu/linux") ; linux
  (global-set-key (kbd "<mouse-3>") 'describe-char-on-click)
  )

(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough

;; automatically show completions for execute-extended-command
(icomplete-mode 1)

(global-set-key (kbd "<f8> <f8>") 'repeat-complex-command)

(global-set-key (kbd "C-1") 'cut-line-or-region) ; cut
(global-set-key (kbd "C-2") 'copy-line-or-region) ; copy
(global-set-key (kbd "C-3") 'yank) ; paste

(global-set-key (kbd "C-9") 'kill-whole-line)

(global-set-key (kbd "C-7") 'lookup-wikipedia) 

(global-set-key (kbd "C-8") 'lookup-word-definition)
(global-set-key (kbd "C-9") 'lookup-google)

;; set mouse
(cond
 ((string-equal system-type "windows-nt") ; Windows
  nil
  )
 ((string-equal system-type "gnu/linux")
  (global-set-key (kbd "<mouse-3>") 'click-to-search) ; right button
  )
 ((string-equal system-type "darwin") ; Mac
  nil
  ) )


(global-set-key (kbd "C-l") 'fullscreen-toggle)

(global-set-key (kbd "C-q") 'sr-speedbar-open)
(global-set-key (kbd "C-r") 'sr-speedbar-close)

(global-set-key (kbd "C->") 'previous-user-buffer)
(global-set-key (kbd "C-<") 'next-user-buffer)

;; on Linux, make Control+wheel do increase/decrease font size
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

(global-set-key (kbd "C-c q") 'quit-bottom-side-windows)

; Fix iedit bug in Unix
(define-key global-map (kbd "C-c ;") 'iedit-mode)

(define-key sql-mode-map (kbd "C-c C-z") 'pop-to-sqli-buffer)


(global-set-key (kbd "C-c C-p") 'run-python)
(global-set-key (kbd "C-c C->") 'python-shell-send-region)

;;(global-set-key (kbd "C-m g") 'magit-status)
;;(global-set-key (kbd "C-m M-g") 'magit-dispatch-popup)


(global-set-key (kbd "C-x w") 'skewer-html-eval-tag)
(global-set-key (kbd "C-x y") 'skewer-css-eval-current-rule)
