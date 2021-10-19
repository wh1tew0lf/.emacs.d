(require 'sr-speedbar)
(global-unset-key (kbd "C-c s"))
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-x C-l") '(lambda ()
				   (interactive)
				   (set 'speedbar-update-flag nil)
				   (sr-speedbar-refresh-turn-off)))

(custom-set-variables
 '(sr-speedbar-right-side nil)
 '(speedbar-show-unknown-files t))

(setq speedbar-mode-hook '(lambda ()
			    (interactive)
			    (nlinum-mode 0)
			    (sr-speedbar-refresh-turn-off)
			    (setq speedbar-update-flag nil)))
;; speedbar settings
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")

;; Some file extensions for speedbar showing
(dolist (extension '(".c" ".cc" ".c++" ".h" ".sh"
		     ".py" ".pl" ".ruby" ".xml"
		     ".htm" ".html" ".css" ".php"
		     ".txt" ".md" ".js"))
  (speedbar-add-supported-extension extension))
