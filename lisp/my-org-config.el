(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (js . t)
   (emacs-lisp . t)))

(use-package
 org-roam
 :ensure t
 :init
 (setq org-roam-v2-ack t)
 (setq org-roam-mode-section-functions
       (list #'org-roam-backlinks-section
	     #'org-roam-reflinks-section
	     #'org-roam-unlinked-references-section
	     ))
 :custom
 (org-roam-directory "~/Documents/zettelkasten")
 (org-roam-complete-everywhere)
 :bind (("C-c n l" . org-roam-buffer-toggle)
	("C-c n f" . org-roam-node-find)
	("C-c n i" . org-roam-node-insert)
	:map org-mode-map
	("C-M-i" . completion-at-point))
 :config
 (org-roam-setup)
 (org-roam-db-autosync-mode))

;; отключить переносы строк
(add-hook 'org-mode-hook (lambda () (auto-fill-mode -1)))
