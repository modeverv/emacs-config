(require 'auto-complete)

(defvar ac-flex-sources
  '(ac-source-flex-keywords))

(ac-define-dictionary-source
 ac-source-flex-keywords
 '("wallywwwwwwwwwww" "wallace" "walalcepalace" "parararar" "aaaaaaa" 
   ))

(defun ac-flex-setup ()
  (setq ac-sources (append ac-flex-sources ac-sources)))

(defun ac-flex-init ()
  (add-hook 'nxml-mode-hook 'ac-flex-setup))

(provide 'auto-complete-flex)
