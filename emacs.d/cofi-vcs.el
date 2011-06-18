(dolist (path '(
                "~/.elisp/vendor/magit"
                "~/.elisp/ahg"
                ))
  (add-to-list 'load-path path))

(setq vc-handled-backends '(SVN)
      vc-follow-symlinks t)

;;; (ma)git
(global-set-key (kbd "C-c g") 'magit-status)
(vim-mapleader-add "g" 'magit-status)
(setq magit-commit-signoff t
      magit-completing-read-function 'magit-ido-completing-read
      magit-commit-all-when-nothing-staged nil)

;;; (a)hg
(require 'ahg)
(setq ahg-global-key-prefix (kbd "C-c h"))
(vim-mapleader-add "h" 'ahg-status)
(vim-mapleader-add "H" ahg-global-map)

(provide 'cofi-vcs)
