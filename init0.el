(custom-set-variables
 '(auto-save-default nil)
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(desktop-base-file-name ".emacs.desktop")
 '(desktop-base-lock-name ".emacs.desktop.lock")
 '(ecb-options-version "2.32")
 '(initial-buffer-choice t)
 '(mumamo-background-chunk-major (quote mumamo-background-chunk-major))
 '(mumamo-chunk-coloring (quote no-chunks-colored))
 '(nxhtml-skip-welcome t)
 '(rails-ws:default-server-type "mongrel")
 '(speedbar-show-unknown-files t)
 '(tramp-default-host "localhost")
 '(tramp-default-method "ssh")
 '(w3m-home-page "http://news.ycombinator.com"))
(custom-set-faces
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(twitter-header-face ((t nil)))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil))))

;; CARGAR EL PATH DEL SITE LISP
(add-to-list 'load-path "~/wallemacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")

;; Adding support for CEDET
;; (add-to-list 'load-path "~/wallemacs/cedet-1.0beta3b/common")
;; (add-to-list 'load-path "~/wallemacs/cedet-1.0beta3b/eieio")
;; (load-file "~/wallemacs/cedet-1.0beta3b/common/cedet.el")
(add-to-list 'load-path "~/wallemacs/cedet/common")
(add-to-list 'load-path "~/wallemacs/cedet/eieio")
(load-file "~/wallemacs/cedet/common/cedet.el")
;; (semantic-load-enable-code-helpers)
;; (setq semantic-load-turn-useful-things-on t)
;; (setq semanticdb-project-roots (list "/home/waldemarpc/proyectos/dev/" ))

;; Lo del js2, quiero poner el auto-complete tambien...
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(autoload 'espresso-mode "espresso" nil t)
;; (require 'javascript-mode)

;; IMPORTANTISIMO PONER AL RUBY PRIMERO
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(require 'ruby-electric)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             (ruby-electric-mode t)
             ))
;;;;;;;;;;;;;;;;;;;ALGUNOS BINDINGS LOCOS;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hacer que no se atore con esto cuando no estoy en window mode
(show-paren-mode t)
(ido-mode t)
(menu-bar-mode nil)

(put 'upcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;DE NUEVO ALGO PARA LAS FONTS;;;;;;;;;;;;;;;;;;;;;;;
(set-default-font "-unknown-inconsolata-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")

;;;;COLOR THEMES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/wallemacs/emacs-rails-kit/vendor/color-theme")
(require 'color-theme)
(color-theme-initialize)
(load-file "~/wallemacs/site-lisp/color-theme-merbivore.el")
(load-file "~/wallemacs/site-lisp/color-theme-tango-2.el")
(load-file "~/wallemacs/site-lisp/color-theme-vibrant-ink.el")
(load-file "~/wallemacs/site-lisp/color-theme-wunki.el")
(load-file "~/wallemacs/site-lisp/color-theme-nightingale.el")
(load-file "~/wallemacs/site-lisp/color-theme-blue.el")
(load-file "~/wallemacs/site-lisp/color-theme-github.el")
(load-file "~/wallemacs/site-lisp/color-theme-hober2.el")
(load-file "~/wallemacs/site-lisp/color-theme-subdued.el")
(load-file "~/wallemacs/site-lisp/color-theme-less.el")
;; (load-file "~/wallemacs/site-lisp/color-theme-zenburn.el")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Soporte para el GIT y SVN;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'git)
(require 'psvn)

(add-to-list 'load-path "~/wallemacs/git-emacs1")
(add-to-list 'load-path "~/wallemacs/magit")
;; (require 'git-emacs)                    ;no funciona en todos los emacs
(require 'magit)

;; COSAS PARA EL TWIT MODE
;; (load-file "~/wallemacs/site-lisp/twit.el")
;; (twit-minor-mode)

;; aqui le voy a poner lo del twitter.el
(autoload 'twitter-get-friends-timeline "twitter" nil t)
(autoload 'twitter-status-edit "twitter" nil t)
(add-hook 'twitter-status-edit-mode-hook 'longlines-mode)

;; ;; el winner mode es para lo de C-c y left etc..
(winner-mode t)

(add-to-list 'load-path "~/wallemacs/emacs-rails-reloaded1/")
(require 'rails-autoload)
(require 'rhtml-mode)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(require 'weblogger)

(add-to-list 'load-path "~/wallemacs/yasnippets-rails")
;; HACER EL SETUP DEL NUEVO YASNIPPET --------------------------------------------------
;; CON AUTOCOMPLETE
(add-to-list 'load-path "~/wallemacs/yasnippet/")
;; ;; super anything
(add-to-list 'load-path "~/wallemacs/auto-complete/")
(require 'yasnippet)
(add-to-list 'yas/extra-mode-hooks
             'ruby-mode-hook)
(yas/initialize)
(setq yas/window-system-popup-function 'yas/x-popup-menu-for-template)
(yas/load-directory "~/wallemacs/yasnippet/snippets")
(yas/load-directory "~/wallemacs/yasnippets-flex/flex-snippets")
(yas/load-directory "~/wallemacs/yasnippets-rails/rails-snippets/")
(make-variable-buffer-local 'yas/trigger-key)

(require 'auto-complete)
;; (global-auto-complete-mode t)
(when (require 'auto-complete nil t)
  (require 'auto-complete-yasnippet)
  (require 'auto-complete-emacs-lisp)
  (require 'auto-complete-flex)
  (require 'auto-complete-sql)
  (require 'auto-complete-semantic)
  (require 'auto-complete-css)
;;;   (defvar ac-flex-sources '(ac-source-flex-keywords))

  ;; (ac-define-dictionary-source ac-source-testing
  ;;                                '("wallywwwwwwwwwww" "wallace" "walalcepalace" "parararar" "aaaaaaa" ))
  ;; ;;
                                        ;   (setq ac-sources  (append ac-flex-sources ac-sources))
;;;   (setq ac-sources  (append ac-source-flex-keywords ac-sources))
  ;; (defun ac-flex-init ()
  ;;     (add-hook 'nxml-mode-hook 'ac-flex-setup))
  (global-auto-complete-mode t)
  (set-face-background 'ac-menu-face "lightgray")
  (set-face-underline 'ac-menu-face "darkgray")
  (set-face-background 'ac-selection-face "steelblue")
  (define-key ac-complete-mode-map "\t" 'ac-expand)
  (define-key ac-complete-mode-map "\r" 'ac-complete)
  (define-key ac-complete-mode-map "\M-n" 'ac-next)
  (define-key ac-complete-mode-map "\M-p" 'ac-previous)
  ;; esto es para definir con cuantas letras se puede empezar a escribir
  (setq ac-auto-start 1)
  (setq ac-dwim t)
  (set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer))
  (setq ac-modes
        (append ac-modes
                '(eshell-mode
                  sql-mode
                                        ;org-mode
                  )))
                                        ;(add-to-list 'ac-trigger-commands 'org-self-insert-command)
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-symbols))
              (eldoc-mode)              ;para que se parezca a slime
              ))
  ;; DEFINIR LOS NUEVOS SOURCES PARA EL AUTOCOMPLETE AQUI!!!
  (add-hook 'nxml-mode-hook
            (lambda ()
              (setq ac-sources '(ac-source-flex ac-source-yasnippet ac-source-words-in-buffer ))
              (setq ac-omni-completion-sources '(("\\mx:\\=" ac-source-flex)))
              ))
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-files-in-current-dir ac-source-words-in-buffer))))
  ;; hacer yasnippets para sql
  (add-hook 'sql-mode-hook
            (lambda ()
              (setq ac-sources '(ac-source-sql ac-source-words-in-buffer))))
  (add-hook 'c++-mode-hook
            (lambda ()
              ;; (setq ac-sources '(ac-source-semantic ac-source-words-in-buffer))
	      (setq ac-omni-completion-sources '(("\\.\\=" ac-source-semantic)))
	      ))
  (add-hook 'css-mode-hook
            (lambda ()
              (setq ac-sources '(ac-source-css-keywords ac-source-yasnippet ac-source-words-in-buffer ))
              ))

;;;   (add-hook 'ruby-mode-hook
;;;                (lambda ()
;;;                  (setq ac-omni-completion-sources '(("\\.\\=" ac-source-rcodetools)))))
  )                                     ;fin del autocomplete



;; HASTA AQUI LA CONFIGURACION DEL AUTO-COMPLETE-MODE Y YASNIPPETS ------------------------

(defun hashRocket()  (interactive)  (insert " => "))
(defun heart()  (interactive)  (insert "♥"))

(defun indent-whole-buffer()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; (load-file "~/wallemacs/site-lisp/typing.el")

;; para comentar una linea como en el Aptana
;; (fset 'wally-comment-macro
;;;       [?\C-a ?\C-  ?\C-e ?\M-\; ?\C-a ?\C-n])

(fset 'wally-comment-macro2
      [?\C-a ?\C-  ?\C-e ?\M-\; ?\C-a tab ?\C-n])

;; sometimes the one above does not work on emacs 23
(fset 'wally-comment-indent-line
      [home ?\C-  ?\S-\C-e ?\M-\; ?\S-\C-a tab home])


(fset 'wally-select-line-macro
      [?\C-a ?\C-  ?\C-e])

;; poniendo cosas para flex
;; (load-file "~/wallemacs/flex-dev-mode/fcsh-compile.el")
;; (load-file "~/wallemacs/flex-dev-mode/fcsh-mode.el")

;; creo que no hace el provide del actionscript, luego lo checo...
(load-file "~/wallemacs/site-lisp/actionscript-mode.el")

;; para los mumamos
(add-to-list 'load-path "~/wallemacs/mumamos/")
(require 'ourcomments-util)
(require 'mlinks)
(require 'mumamo-fun)

;; MUMAMOS ----------------------------------------
;; para soporte para mumamos en mxmls...
(load-file "~/wallemacs/flex-dev-mode/mxml-as3-mode.el")
;; use mejor ecmascript para el javascript porque estaba medio pirata el js
(load-file "~/wallemacs/flex-dev-mode/html-ecmascript-mode.el")

(fset 'wally-select-line
      [?\C-a ?\C-  ?\C-e])

(defun filetemignon()
  (interactive)
  (message "Filete mignon listo!!!"))


(fset 'choche-magical-quotes
      "\C-w\"\C-y")


(fset 'choche-start-mysql
      [?\M-x ?s ?q ?l ?- ?m ?s ?q backspace backspace ?y ?s ?q ?l return ?r ?o ?o ?t return ?i ?n ?o ?v ?a ?z ?0 ?8 return return ?l ?o ?c ?a ?l ?h ?o ?s ?t return])


(defun swap-windows ()
 "If you have 2 windows, it swaps them."
 (interactive)
 (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
       (t
        (let* ((w1 (first (window-list)))
               (w2 (second (window-list)))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2))
               (s1 (window-start w1))
               (s2 (window-start w2)))
          (set-window-buffer w1 b2)
          (set-window-buffer w2 b1)
          (set-window-start w1 s2)
          (set-window-start w2 s1)))))

;; (fset 'wally-start-mysql
;;    [?\M-x ?s ?q ?l ?- ?m ?y ?s ?q ?l return ?r ?o ?o ?t return ?i ?n ?o ?v ?a ?z ?0 ?8 return return ?l ?o ?c ?a ?l ?h ?o ?s ?t return ?\M-x ?s ?q ?l ?- ?m ?o ?d ?e return])
;; (defun wally-start-mysql()
;;   (interactive)
;;   (choche-start-mysql)
;;   (sql-mode))


;; blank-mode
(require 'blank-mode)
(load-file "~/wallemacs/site-lisp/light-symbol.el")
(require 'textmate)
(display-time)
(require 'pastie)
;; (zone-when-idle 600)
;; (require 'dpaste)

(set-frame-parameter (selected-frame) 'alpha 93)

;; para el nombre de los buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(require 'dame-shell)
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile$" . textile-mode))

;; UGLY CONFS -------------------------------------------------------------

;; (if (not (equal (terminal-name) "/dev/tty"))
;;     ((scroll-bar-mode nil)
;;      (tool-bar-mode nil)
;;      ;; no funciona el twit.el en la terminal
;;      (load-file "~/wallemacs/site-lisp/twit.el")
;;      (twit-minor-mode))
;;   ;; else estas en terminal
;;   (color-theme-zenburn))

(scroll-bar-mode nil)

;; HACER REFACTOR DE ESTO... una lista de todo
;; (if (not (equal (terminal-name) "/dev/tta"))
;;     (scroll-bar-mode nil)
;;   )
;; (if (not (equal (terminal-name) "/dev/tty"))
(tool-bar-mode nil)
;;     )
;; (if (not (equal (terminal-name) "/dev/tty"))
;;     ;; (load-file "~/wallemacs/site-lisp/twit.el")
;;     )
;; (if (not (equal (terminal-name) "/dev/tty"))
;;     ;; (twit-minor-mode)
;;     )


;; Adding anthy package...
(set-language-environment "Japanese")
                                        ; anthy.el をロードできるようにする (必要に応じて)。
;; (push "/usr/local/share/emacs/site-lisp/anthy/" load-path)
(add-to-list 'load-path "~/wallemacs/site-lisp/anthy/")
                                        ; anthy.el をロードする。
(load-library "anthy")
                                        ; japanese-anthy をデフォルトの input-method にする。
;; (setq default-input-method "japanese-anthy")

(defun wally-alpha()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha
                       (string-to-int (read-from-minibuffer "Cuanto: " ))))

(require 'sr-speedbar)


;; por el momento si voy a estar haciendo pushes a waricho de lo que
;; pienso. bye bye twitter
;; (load-file "~/wallemacs/borges-el/essayWARICHO.el")

;; RUDEL ------------------------------------------------------------------------
(add-to-list 'load-path "~/wallemacs/rudel/")
(add-to-list 'load-path "~/wallemacs/rudel/jupiter/")
(add-to-list 'load-path "~/wallemacs/rudel/obby/")
(add-to-list 'load-path "~/wallemacs/rudel/telepathy/")
(add-to-list 'load-path "~/wallemacs/rudel/wave/")
(add-to-list 'load-path "~/wallemacs/rudel/zeroconf/")

(load-file "~/wallemacs/rudel/rudel-loaddefs.el")

;; no se por que tengo que hacer esto 2 veces...
(global-rudel-minor-mode)
(global-rudel-minor-mode)

;; AMPL MODE --------------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.mod$" . ampl-mode))
(add-to-list 'auto-mode-alist '("\\.dat$" . ampl-mode))
(add-to-list 'auto-mode-alist '("\\.ampl$" . ampl-mode))

(setq interpreter-mode-alist
      (cons '("ampl" . ampl-mode)
            interpreter-mode-alist))

(require 'ampl-mode)
;; (load "ampl-mode")

;; Enable syntax coloring
;; (add-hook 'ampl-mode-hook 'turn-on-font-lock)

;; If you find parenthesis matching a nuisance, turn it off by
;; removing the leading semi-colons on the following lines:

;(setq ampl-auto-close-parenthesis nil)
;(setq ampl-auto-close-brackets nil)
;(setq ampl-auto-close-curlies nil)
;(setq ampl-auto-close-double-quote nil)
;(setq ampl-auto-close-single-quote nil)
;; end AMPL MODE ------------------------------------------------------------------------


;; CSS MODE COLORS ----------------------------------------------------------------------
(defvar hexcolour-keywords
    '(("#[abcdef[:digit:]]\\{6\\}"
       (0 (put-text-property
           (match-beginning 0)
           (match-end 0)
           'face (list :background 
                       (match-string-no-properties 0)))))))
  
  (defun hexcolour-add-to-font-lock ()
    (font-lock-add-keywords nil hexcolour-keywords))
  
  (add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)


;; DEDICATED KEYS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [?\C--] 'hippie-expand)
(global-set-key (kbd "<f1>") 'copy-region-as-kill)
(global-set-key (kbd "<f2>") 'ido-switch-buffer)
;; (global-set-key (kbd "<f3>") 'find-file-other-window)
(global-set-key (kbd "<S-f3>") 'find-file-other-frame)
(global-set-key (kbd "<f4>") 'speedbar)
(global-set-key (kbd "<C-f4>")  'sr-speedbar-open)
(global-set-key (kbd "<f5>") 'replace-regexp)
(global-set-key (kbd "<f6>") 'replace-string)
(global-set-key (kbd "<f7>") 'regexp-builder)
(global-set-key (kbd "<C-f7>") 'twit-post-region)
(global-set-key (kbd "<f8>") 'toggle-truncate-lines)
(global-set-key (kbd "<C-f9>") 'menu-bar-mode)
(global-set-key (kbd "<f10>") 'linum-mode)
(global-set-key (kbd "<f11>") 'make-frame-command)
(global-set-key (kbd "<C-tab>") 'dabbrev-expand)
(global-set-key "\C-c\C-p" 'sgml-tag)
(global-set-key "\C-c\C-o" 'shrink-window)
(global-set-key "\C-c\C-k" 'copy-region-as-kill)
(global-set-key "\C-c\C-v" 'x-clipboard-yank)
(global-set-key "\C-ce" 'ido-switch-buffer)
(global-set-key (kbd "<C-f10>")  'dame-shell)
(global-set-key (kbd "<f12>")  'anthy-mode)
(global-set-key (kbd "<M-prior>") 'previous-error)
(global-set-key (kbd "<M-next>")  'next-error)
(global-set-key (kbd "<C-f3>")  'rgrep)
(global-set-key (kbd "<C-f2>")  'choche-start-mysql)
;; (global-set-key (kbd "<C-f2>")  'wally-start-mysql)
(global-set-key (kbd "<C-f1>")  'rails/goto-associated)
(global-set-key (kbd "<S-f1>")  'twitter-get-friends-timeline)
(global-set-key (kbd "<S-f2>")  'ido-switch-buffer-other-window)
(global-set-key (kbd "<S-f4>")  'speedbar-update-contents)
(global-set-key (kbd "<S-f8>")  'rails/console)
(global-set-key (kbd "<C-f11>")  'undo)
(global-set-key (kbd "<C-S-f2>")  'ido-switch-buffer-other-frame)
(global-set-key (kbd "<S-f11>")  'text-scale-decrease)
(global-set-key (kbd "<S-f12>")  'text-scale-increase)
(global-set-key (kbd "<M-f12>")  'other-frame)
(windmove-default-keybindings 'meta)
;; (global-set-key "\C-c\C-a" 'wally-comment-macro2)
(global-set-key "\C-c\C-a" 'wally-comment-indent-line)
(global-set-key "\C-c=" 'hashRocket)
(global-set-key "\C-c\C-e" 'wally-select-line-macro)
(global-set-key (kbd "<M-f11>")  'indent-whole-buffer)
(global-set-key "\C-cw" 'kill-this-buffer)
(global-set-key "\C-z" 'undo)
(global-set-key "\C-cm" 'filetemignon)
(global-set-key "\C-cs" 'wally-select-line)
(global-set-key "\C-t" 'other-frame)
(global-set-key "\C-cl" 'choche-magical-quotes)
(global-set-key "\M-2" 'swap-windows)