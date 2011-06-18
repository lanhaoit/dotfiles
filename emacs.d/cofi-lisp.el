(add-to-loadpath "~/.elisp/vendor/slime/")
(dolist (hook '(clojure-mode-hook lisp-mode-hook))
  (add-hook hook
            ;; viper overshadows slime-repl binding
            (lambda () (local-set-key (kbd "C-c M-p") 'slime-repl-set-package))))

(add-hook 'slime-repl-mode-hook
          (gen-fill-keymap-hook slime-repl-mode-map "C-c C-z" 'other-buffer))

(require 'paredit)
(defvar paredit-mode-hooks '(lisp-mode-hook
                             clojure-mode-hook
                             slime-repl-mode-hook))

(add-to-hooks #'enable-paredit-mode paredit-mode-hooks)

(add-to-list 'auto-mode-alist '("\\.cl$" . lisp-mode))

(add-to-list 'load-path "~/dev/lisp/slime/")
(setq slime-lisp-implementations
      '((sbcl ("sbcl") :coding-system utf-8-unix)))

(setq slime-net-coding-system 'utf-8-unix)

(add-hook 'sldb-mode-hook #'(lambda () (setq autopair-dont-activate t)))

(require-and-exec 'slime
                  (slime-setup '(slime-fancy
                                 slime-banner)))
(setq slime-protocol-version 'ignore)

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)

(provide 'cofi-lisp)
