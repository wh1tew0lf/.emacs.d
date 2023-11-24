(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (js . t)
   (emacs-lisp . t)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq org-log-done 'time) ;; use TODO="DONE"&CLOSED>="<-1w>"
(setq org-fontify-done-headline t)
(set-face-attribute 'org-agenda-done nil :strike-through t)
(set-face-attribute 'org-done nil :strike-through t)
(set-face-attribute 'org-headline-done nil
                    :strike-through t
                    :foreground "light gray")

(use-package
 org-roam
 :ensure t
 :init
 (setq org-roam-v2-ack t)
 :custom
 (org-roam-directory "~/Documents/zettelkasten/wissen")
 (org-roam-complete-everywhere)
 :bind (("C-c n l" . org-roam-buffer-toggle)
	("C-c n f" . org-roam-node-find)
	("C-c n i" . org-roam-node-insert)
	:map org-mode-map
	("C-M-i" . completion-at-point))
 :config
 (org-roam-setup)
 (setq org-roam-mode-section-functions
       (list #'org-roam-backlinks-section
	     #'org-roam-reflinks-section
	     #'org-roam-unlinked-references-section
	     ))
 (org-roam-db-autosync-mode))

(global-unset-key (kbd "C-x C-a"))
(global-set-key (kbd "C-x C-a") 'org-agenda)

;; отключить переносы строк
(add-hook 'org-mode-hook (lambda ()
			   (progn
			     (visual-line-mode t)
			     (setq org-image-actual-width nil)
			     (setq
			      org-enable-priority-comands t
			      org-highest-priority ?A
			      org-default-priority ?E
			      org-lowest-priority ?F)
			     (auto-fill-mode -1))))

;; TODO
(add-hook 'org-latex-ook (lambda ()
			   (custom-set-variables
			    ;; чтобы при экспорте файлов в PDF всё остальное удалялось
			    (setq org-latex-logfiles-extensions
				  (quote
				   ("lof" "lot" "tex~" "aux" "idx" "log" "out"
				    "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk"
				    "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))
			    ;; подключение доп пакетов, чтобы в pdf можно было экспортировать.
			    ;; + установи пакеты: apt-get install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra texlive-lang-cyrillic
			    (add-to-list 'org-export-latex-packages-alist '("" "cmap" t))
			    (add-to-list 'org-export-latex-packages-alist '("english,russian" "babel" t))
			    )))
