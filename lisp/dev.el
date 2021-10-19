(add-hook 'c-mode-hook
	  (lambda()
	    (setq c-default-style "whitesmith")
	    (setq indent-tabs-mode nil)
	    (setq c-basic-indent 4)
	    (setq tab-width 4)
	    (setf c-basic-offset 4)
	    (auto-complete-mode t)
	    ;;(local-set-key (kbd "C-SPC") 'auto-complete)
	    ;;(local-set-key (kbd "s-SPC") 'semantic-ia-complete-symbol-menu)
	    (setq indent-tabs-mode nil)))

(add-hook 'c++-mode-hook
	  (lambda()
	    (setq c-default-style "whitesmith")
	    (setq c-basic-indent 2)
	    (setq tab-width 4)
	    (setf c-basic-offset 4)
	    (auto-complete-mode t)
	    (local-set-key "." my-semantic-complete-self-insert)
	    (local-set-key ">" my-semantic-complete-self-insert)
	    (local-set-key (kbd "C-SPC") 'auto-complete)
	    (local-set-key (kbd "s-SPC") 'semantic-ia-complete-symbol-menu)
	    (setq indent-tabs-mode nil)))

(font-lock-add-keywords
 'c-mode
 '(("\\<\\(FIXME\\|TODO\\|QUESTION\\|NOTE\\)"
    1 font-lock-warning-face prepend)))
