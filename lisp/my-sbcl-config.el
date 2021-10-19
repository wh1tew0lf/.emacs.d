;; Increase SBCL heap size for install some packages for data mining
(setq inferior-lisp-program "/usr/local/bin/sbcl") ;--dynamic-space-size 4096
;;(setq slime-lisp-implementations
;;      '((sbcl ("/usr/local/bin/sbcl" "--dynamic-space-size" "4096"))))

(defun slime-hook()
  (auto-complete-mode t)
  (local-set-key (kbd "C-SPC") 'auto-complete)
  (set-up-slime-ac))

(add-hook 'slime-mode-hook 'slime-hook)
(add-hook 'slime-repl-mode-hook 'slime-hook)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
