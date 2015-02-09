;; Content of .emacs
;;(add-to-list 'load-path "~/.emacs.d/")
;;(load-file "~/.emacs.d/my-bootstrap.el")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-deep-blue)


(set-language-environment 'utf-8)
(setq slime-net-coding-system 'utf-8-unix)
(cua-mode t)
(setq x-select-enable-clipboard t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(require 'yascroll)
(global-yascroll-bar-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(ede-project-directories (quote ()))
 '(tabbar-separator (quote (0.2)))
 '(tool-bar-mode nil))
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 4)
(setq make-backup-files nil)
(setq nlinum-format "%4d\u2502") ;;Lines numeration
;; make the fringe thinner (default is 8 in pixels)
(fringe-mode 4)

(show-paren-mode 1)
(setq show-paren-style 'expression)
(global-hl-line-mode t)

;;Движение по окнам
;(global-set-key (kbd "s-<up>") 'windmove-up)
;(global-set-key (kbd "s-<right>") 'windmove-right)
;(global-set-key (kbd "s-<down>") 'windmove-down)
;(global-set-key (kbd "s-<left>") 'windmove-left)

(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)
(global-unset-key (kbd "M-A"))
(global-set-key (kbd "M-A") 'shrink-window)
(global-unset-key (kbd "C-<next>"))
(global-unset-key (kbd "M-V"))
(global-set-key (kbd "M-V") 'enlarge-window)

;;Цветовые схемы
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-deep-blue)

;(set-face-attribute 'default nil :font "Ubuntu Mono")

;; TlwgTypewriter
;; Ubuntu Mono
;; Liberation Mono
;; helv

;; color-theme-deep-blue +
;; color-theme-gray30 +
;; color-theme-goldenrod ?
;; color-theme-jonadabian-slate +
;; color-theme-montz 0
;; color-theme-pok-wog +
;; color-theme-whateveryouwant шрифты

;;Горячие клавиши
(global-set-key (kbd "M-s") 'shell)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c b") 'show-buffer-file-name)
(global-set-key (kbd "M-k") 'calculator)

(global-set-key (kbd "C-<mouse-4>") 'text-scale-increase)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-<mouse-5>") 'text-scale-decrease)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") (lambda() 
							  (interactive)
							  (text-scale-increase 0)))

(global-set-key (kbd "C-x r") 'revert-buffer-with-coding-system)

(global-set-key (kbd "s-x") 'kill-rectangle)
(global-set-key (kbd "s-c") (lambda(start end) 
	(interactive "r")
	(kill-rectangle start end)
	(goto-char start)
	(yank-rectangle)))
(global-set-key (kbd "s-v") 'yank-rectangle)

;;Поиск и замена
(global-unset-key (kbd "M-f"))
(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-r"))

(global-unset-key (kbd "M-d"))
(global-unset-key (kbd "C-S-d"))

(global-set-key (kbd "<f3>") 'isearch-forward)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "<S-f3>") 'isearch-backward)

(define-key isearch-mode-map (kbd "<f3>") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "<S-f3>") 'isearch-repeat-backward)

(global-set-key (kbd "M-f") 'isearch-forward-regexp)

(global-unset-key (kbd "C-h"))
(global-unset-key (kbd "M-h"))

(global-set-key (kbd "C-h") 'replace-string)
(global-set-key (kbd "M-h") 'replace-regexp)

(global-set-key (kbd "C-a") 'mark-whole-buffer)

(global-unset-key (kbd "C-w"))

(global-set-key (kbd "C-s") 'save-buffer)

(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

(require 'dedicated)
(global-unset-key (kbd "C-$"))
(global-set-key (kbd "C-$") 'dedicated-mode)

(global-unset-key (kbd "C-b"))
(global-set-key (kbd "C-b") 'list-bookmarks)
(global-unset-key (kbd "C-,"))
(global-set-key (kbd "C-,") 'bookmark-set)
(global-unset-key (kbd "C-."))
(global-set-key (kbd "C-.") 'bookmark-jump)

;‘a’ – show annotation for the current bookmark
;‘A’ – show all annotations for your bookmarks
;‘d’ – mark various entries for deletion (‘x’ – to delete them)
;‘e’ – edit the annotation for the current bookmark
;‘m’ – mark various entries for display and other operations, (‘v’ – to visit)
;‘o’ – visit the current bookmark in another window, keeping the bookmark list open 
;‘C-o’ – switch to the current bookmark in another window
;‘r’ – rename the current bookmark

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(global-set-key (kbd "C-r") 'revert-buffer-no-confirm)

;; little help ;;
;; C-x <RET> r CHARSET - коировку буфера изменить

;;русские буквы автоматически транслируются в соответствующие английские.
(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (super) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))

(reverse-input-method 'russian-computer)

;отключить переносы строк
(add-hook 'org-mode-hook (lambda () 
                           (auto-fill-mode -1))) 
(set-default 'truncate-lines t)

(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w") (lambda() 
							  (interactive)
							  (kill-buffer)))


(add-to-list 'load-path "/home/wh1/.emacs.d/el-get/package/elpa/php-mode-1.5.0/")
(require 'php-mode)

(autoload 'php-imenu-create-index "php-imenu" nil t)
;; Add the index creation function to the php-mode-hook
(add-hook 'php-mode-user-hook 'php-imenu-setup)
(defun php-imenu-setup ()
  (setq imenu-create-index-function (function php-imenu-create-index))
  ;; uncomment if you prefer speedbar:
  ;;(setq php-imenu-alist-postprocessor (function reverse))
  (imenu-add-menubar-index))

(add-to-list 'load-path "/home/wh1/.emacs.d/el-get/package/elpa/nlinum-1.5/")
(require 'nlinum)
(global-nlinum-mode 1)
(setq nlinum--width 4) ;;Lines numeration
(setq nlinum--format "%%%dd\u2502") ;;Lines numeration
;;Для php

(defun uniindent-closure ()
  "Fix php-mode indent for closures"
  (let ((syntax (mapcar 'car c-syntactic-context)))
	(if (and (member 'arglist-cont-nonempty syntax)
			 (or
			  (member 'statement-block-info syntax)
			  (member 'brace-list-intro syntax)
			  (member 'brace-list-close syntax)
			  (member 'block-close syntax)))
		(save-excursion
		  (beginning-of-line)
		  (delete-char (* (count 'arglist-cont-nonempty syntax)
						  c-basic-offset))) )))

(add-hook 'php-mode-hook 
		  (lambda()
			
			(setq c-default-style "whitesmith")
			(defun ywb-php-lineup-arglist-intro (langelem)
			  (save-excursion
				(goto-char (cdr langelem))
				(vector (+ (current-column) c-basic-offset))))
			(defun ywb-php-lineup-arglist-close (langelem)
			  (save-excursion
				(goto-char (cdr langelem))
				(vector (current-column))))

			(require 'php-electric)
			(electric-pair-mode t)
			(setq case-fold-search t)
			(subword-mode 1)
			(setq fill-column 78)
			(c-set-offset 'arglist-cont 0)
			(c-set-offset 'substatement-open 0)
			(c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
			(c-set-offset 'case-label 2)
			(c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
			(c-set-offset 'block-close 0)
			(c-set-offset 'defun-close 0)
			(auto-complete-mode 1)
			(c-toggle-auto-newline 1)
			(setq c-basic-indent 2)
			(setq tab-width 4)
			(setf c-basic-offset 4)
			(local-set-key (kbd "C-SPC") 'auto-complete)
			(php-imenu-setup)
			;(flymake-mode-on)
			(add-hook 'c-special-indent-hook 'uniindent-closure)
			(setq indent-tabs-mode nil)))
			
(add-hook 'c-mode-hook
		  (lambda()
			(electric-pair-mode t)
			(c-toggle-auto-newline 1)
			(setq c-basic-indent 2)
			(setq tab-width 4)
			(setf c-basic-offset 4)
			;(local-set-key "." 'my-semantic-complete-self-insert)
			;(local-set-key ">" 'my-semantic-complete-self-insert)
			(local-set-key (kbd "C-SPC") 'auto-complete)
			(local-set-key (kbd "s-SPC") 'semantic-ia-complete-symbol-menu)
			(setq indent-tabs-mode nil)))

(add-hook 'c++-mode-hook 
		  (lambda() 
			(electric-pair-mode t)
			(c-toggle-auto-newline 1)
			(setq c-basic-indent 2)
			(setq tab-width 4)
			(setf c-basic-offset 4)
			(local-set-key "." my-semantic-complete-self-insert)
			(local-set-key ">" my-semantic-complete-self-insert)
			(local-set-key (kbd "C-SPC") 'auto-complete)
			(local-set-key (kbd "s-SPC") 'semantic-ia-complete-symbol-menu)
			(setq indent-tabs-mode nil)))

;;Настройки для CEDET

(defun my-semantic-complete-self-insert(arg) 
  (interactive "p")
  (self-insert-command arg)
  (ac-complete-semantic))

(defun enable-cedet() 
  (interactive)
  (setq cedet-root-path (file-name-as-directory "~/.emacs.d/cedet-bzr/trunk/"))
  (load-file (concat cedet-root-path "cedet-devel-load.el"))
  (add-to-list 'load-path (concat cedet-root-path "contrib"))
  (load-file (concat cedet-root-path "contrib/cedet-contrib-load.el"))
  (require 'semantic/ia)
  (require 'semantic/bovine/gcc)
  (require 'wisent-php)

  (defun my-cedet-hook ()
	(add-to-list 'ac-sources 'ac-source-semantic-raw 'ac-source-semantic))
  (add-hook 'c-mode-common-hook 'my-cedet-hook)
  (add-hook 'c++-mode-common-hook 'my-cedet-hook)

  (add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/ecb-snapshot-20120830")
  (require 'ecb)
  (setq stack-trace-on-error t)

  (global-ede-mode 1)                      ; Enable the Project management system
  (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
  ;(global-srecode-minor-mode 1)            ; Enable template insertion menu

  (global-semanticdb-minor-mode 1) ;включает глобальную поддержку Semanticdb;
  (global-semantic-mru-bookmark-mode 1) ;включает режим автоматического запоминания информации о редактируемых тагах, так что вы можете перейти к ним позднее с помощью команды semantic-mrub-switch-tags;
  (global-cedet-m3-minor-mode 1) ;активирует контекстное меню привязанное к правой клавише мыши;
  (global-semantic-highlight-func-mode 1) ;активирует подстветку первой строки текущего тага (функции, класса и т.п.);
  ;(global-semantic-stickyfunc-mode 1) ;активирует показ названия текущего тага в верхней строке буфера;
  (global-semantic-decoration-mode 1) ;активирует использование стилей при показе тагов разных типов. Набор стилей определяется списком semantic-decoration-styles;

  (global-semantic-idle-local-symbol-highlight-mode 1) ;включает подсветку вхождений локальных переменных чье имя совпадает с именем текущего тага;
  (global-semantic-idle-scheduler-mode 0) ;деактивирует автоматический анализ кода в буферах когда Emacs "свободен" и ожидает ввода данных от пользователя (idle time);
  ;(global-semantic-idle-completions-mode 1) ;активирует показ возможных дополнений имен во время ожидания ввода. Требует чтобы был включен global-semantic-idle-scheduler-mode;
  (global-semantic-idle-summary-mode 1) ;активирует показ информации о текущем таге во время ожидания ввода. Требует чтобы был включен global-semantic-idle-scheduler-mode.

  (global-set-key (kbd "s-d") 'semantic-ia-show-doc)
  (global-set-key (kbd "s-/") 'semantic-ia-show-summary)

  (global-semantic-tag-folding-mode 1))

;; END - Настройки CEDET
	
(global-set-key (kbd "<f9>") 'compile)

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)

(defun my-duplicate-block-after()
  (interactive)
  (let ((start (if mark-active (region-beginning) (point))) 
		(end (if mark-active (region-end) (point))))
	(goto-char start)
	(move-beginning-of-line 1)
	(setf start (point))
	(goto-char end)
	(move-end-of-line 1)
	(setf end (point))
	(kill-region start end)
	(yank)
	(open-line 1)
	(next-line 1)
	(setf start (point))
	(yank)
	(when kill-ring
	  (setq kill-ring (cdr kill-ring)))
	(when kill-ring-yank-pointer
	  (setq kill-ring-yank-pointer kill-ring))
	(setf end (point))
	(goto-char start)
	(set-mark-command nil)
	(goto-char end)
	(setq deactivate-mark nil)))

(global-set-key (kbd "C-S-<down>") 'my-duplicate-block-after)

(defun my-duplicate-block-before()
  (interactive)
  (let ((start (if mark-active (region-beginning) (point))) 
		(end (if mark-active (region-end) (point))))
	(goto-char start)
	(move-beginning-of-line 1)
	(setf start (point))
	(goto-char end)
	(move-end-of-line 1)
	(setf end (point))
	(kill-region start end)
	(yank)
	(open-line 1)
	(next-line 1)
	(yank)
	(when kill-ring
	  (setq kill-ring (cdr kill-ring)))
	(when kill-ring-yank-pointer
	  (setq kill-ring-yank-pointer kill-ring))
	(goto-char start)
	(set-mark-command nil)
	(goto-char end)
	(setq deactivate-mark nil)))

(global-set-key (kbd "C-S-<up>") 'my-duplicate-block-before)

(defun my-move-block-down()
  (interactive)
  (let ((start (if mark-active (region-beginning) (point))) 
		(end (if mark-active (region-end) (point)))
		(is-block mark-active)
		(length (buffer-size)))
	(goto-char start)
	(move-beginning-of-line 1)
	(setf start (point))
	(goto-char end)
	(move-end-of-line 1)
	(setf end (point))
	(kill-region start end)
	(when (> length end) 
	  (delete-region start (1+ start))
	  (move-end-of-line 1))
	(open-line 1)
	(next-line 1)
	(setf start (point))
	(yank)
	(setf end (1- (point)))
	(goto-char start)
	(move-beginning-of-line 1)
	(when kill-ring
	  (setq kill-ring (cdr kill-ring)))
	(when kill-ring-yank-pointer
	  (setq kill-ring-yank-pointer kill-ring))
	(when is-block
	  (set-mark-command nil)
	  (goto-char end)
	  (move-end-of-line 1)
	  (setq deactivate-mark nil))))

(global-set-key (kbd "M-<down>") 'my-move-block-down)

(defun my-move-block-up()
  (interactive)
  (let ((start (if mark-active (region-beginning) (point))) 
		(end (if mark-active (region-end) (point)))
		(is-block mark-active))
	(goto-char start)
	(move-beginning-of-line 1)
	(setf start (point))
	(goto-char end)
	(move-end-of-line 1)
	(setf end (point))
	(kill-region start end)
	(when (> start 1) 
	  (delete-region (1- start) start)
	  (move-beginning-of-line 1))
	(open-line 1)
	(setf start (point))
	(yank)
	(setf end (1- (point)))
	(goto-char start)
	(move-beginning-of-line 1)
	(when kill-ring
	  (setq kill-ring (cdr kill-ring)))
	(when kill-ring-yank-pointer
	  (setq kill-ring-yank-pointer kill-ring))
	(when is-block
	  (set-mark-command nil)
	  (goto-char end)
	  (move-end-of-line 1)
	  (setq deactivate-mark nil))))

(global-set-key (kbd "M-<up>") 'my-move-block-up)

(defun my-kill-region()
  (interactive)
  (let ((start (if mark-active (region-beginning) (point))) 
		(end (if mark-active (region-end) (point))))
	(goto-char start)
	(move-beginning-of-line 1)
	(setf start (point))
	(goto-char end)
	(move-end-of-line 1)
	(setf end (1+ (point))) 
	(when (> end (1+ (buffer-size)))
	  (setf end (1+ (buffer-size)))
	  (when (> start 1) 
		(setf start (1- start))))
	(delete-region start end)))

(global-set-key (kbd "M-d") 'my-kill-region)
(global-set-key (kbd "C-S-d") 'my-kill-region)

(defun my-save-modified-buffers()
  (interactive)
  (save-some-buffers t))
(global-set-key (kbd "C-S-s") 'my-save-modified-buffers)

(add-hook 'ediff-load-hook
	(lambda ()
    (set-face-foreground ediff-current-diff-face-B "blue")
	(set-face-background ediff-current-diff-face-B "red")
	(make-face-italic ediff-current-diff-face-B)))

;(set-default 'cursor-type 'bar)
;(set-default 'cursor-in-non-selected-windows 'bar)
;box
;hollow
;nil
;bar
;(bar . width)
;bar
;(hbar . height)

;;elpa
(setq package-archives 
	  '(("elpa" . "http://tromey.com/elpa/") 
		("melpa" . "http://melpa.milkbox.net/packages/")
		("gnu" . "http://elpa.gnu.org/packages/") 
		("marmalade" . "http://marmalade-repo.org/packages/")))

;;el-get
;(url-retrieve
; "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
; (lambda (s)
;   (goto-char (point-max))
;   (eval-print-last-sexp)))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;;(unless (require 'el-get nil 'noerror)
;;  (with-current-buffer
;;      (url-retrieve-synchronously
;;       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;    (goto-char (point-max))
;;    (eval-print-last-sexp)))

;;(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;;(el-get 'sync)
;;el-get end

;; Tabbar
(add-to-list 'load-path "~/.emacs.d/el-get/tabbar")
(require 'tabbar)

(global-set-key [C-S-iso-lefttab] 'tabbar-backward-tab)
(global-set-key [C-tab] 'tabbar-forward-tab)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs

;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))
 
 (defun my-tabbar-buffer-groups () ;; customize to show all normal files in one group
   "Returns the name of the tab group names the current buffer belongs to.
 There are two groups: Emacs buffers (those whose name starts with '*', plus
 dired buffers), and the rest.  This works at least with Emacs v24.2 using
 tabbar.el v1.7."
   (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
               ((eq major-mode 'dired-mode) "emacs")
               (t "user"))))
 (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
 
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;; Add a buffer modification state indicator in the tab label, and place a
;; space around the label to make it looks less crowd.
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
		(if (and (buffer-modified-p (tabbar-tab-value tab))
				 (buffer-file-name (tabbar-tab-value tab)))
			(concat " + " (concat ad-return-value " "))
		  (concat " " (concat ad-return-value " ")))))

;; Called each time the modification state of the buffer changed.
(defun ztl-modification-state-change ()
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

;; First-change-hook is called BEFORE the change is made.
(defun ztl-on-buffer-modification ()
  (set-buffer-modified-p t)
  (ztl-modification-state-change))

(add-hook 'after-save-hook 'ztl-modification-state-change)
(add-hook 'after-revert-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)

(tabbar-mode 1)
;; tabbar end

;; speedbar settings
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")

(add-to-list 'load-path "~/.emacs.d/el-get/sr-speedbar/")

;; Some file extensions for speedbar showing
;;(dolist (extension '(".c" ".cc" ".c++" ".h" ".sh" 
;;					 ".py" ".pl" ".ruby" ".xml"
;;					 ".htm" ".html" ".css" ".php"
;;					 ".txt" ".md" ".js"))
;;  (speedbar-add-supported-extension extension))

(require 'sr-speedbar)
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-x C-l") '(lambda () 
								   (interactive)
								   (set 'speedbar-update-flag nil)
								   (sr-speedbar-refresh-turn-off)))

(custom-set-variables 
 '(sr-speedbar-right-side nil))

(custom-set-variables '(speedbar-show-unknown-files t))

(setq speedbar-mode-hook '(lambda ()
							(interactive)
							(nlinum-mode 0)
							(sr-speedbar-refresh-turn-off)
							(setq speedbar-update-flag nil)))

(require 'tramp)
(setq tramp-default-method "ssh")
(setq password-cache-expiry nil)

(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el/")
(require 'multiple-cursors)

(global-unset-key (kbd "M-m"))
(global-set-key (kbd "M-m") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-menu-height 20)
(add-to-list 'ac-modes 'web-mode)

(add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/rainbow-delimiters-1.3.21/")
(require 'rainbow-delimiters)
;(global-rainbow-delimiters-mode)

(add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/rainbow-mode-0.9/")
(require 'rainbow-mode)
;(rainbow-turn-on)

;; (add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/diff-hl-1.5.3/")
;; (require 'diff-hl)
;; (global-diff-hl-mode)

(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'comment-region)

(global-unset-key (kbd "C-e"))
(global-set-key (kbd "C-e") 'uncomment-region)

(add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/highlight-21.0/")
(require 'highlight)
(global-unset-key (kbd "C-y"))
(global-set-key (kbd "C-y") 'hlt-highlight)
(global-unset-key (kbd "M-y"))
(global-set-key (kbd "M-y") 'hlt-unhighlight-region)

;; (add-to-list 'load-path "~/.emacs.d/mmm-mode/")
;; (require 'mmm-auto)

;; (add-hook 'mmm-mode-hook
;; 		  (lambda()
;; 			(auto-complete-mode 1)))

;; ;;************************************************************
;; ;; configure HTML editing
;; ;;************************************************************

;; (add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/css-mode-1.0/")
;; (require 'css-mode)
;; (require 'php-mode)
;; ;; configure css-mode
;; (autoload 'css-mode "css-mode")
;; (add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
;; (setq cssm-indent-function #'cssm-c-style-indenter)
;; (setq cssm-indent-level '2)
;; ;;
;; (add-hook 'php-mode-user-hook 'turn-on-font-lock)
;; ;;
;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)

;; ;; set up an mmm group for fancy html editing
;; (mmm-add-group
;;  'fancy-html
;;  '((html-php-tagged
;; 	:submode php-mode
;; 	:face mmm-code-submode-face
;; 	:front "<[?]php"
;; 	:back "[?]>")
;;    (html-css-attribute
;; 	:submode css-mode
;; 	:face mmm-declaration-submode-face
;; 	:front "style=\""
;; 	:back "\"")))

;; ;; What files to invoke the new html-mode for?
;; (add-to-list 'auto-mode-alist '("\\.inc\\'" . html-mode))
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . html-mode))
;; (add-to-list 'auto-mode-alist '("\\.php[34]?\\'" . html-mode))
;; (add-to-list 'auto-mode-alist '("\\.[sj]?html?\\'" . html-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp\\'" . html-mode))


;; ;; What features should be turned on in this html-mode?
;; (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))
;; (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil embedded-css))
;; (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil fancy-html))

;; ;; Not exactly related to editing HTML: enable editing help with mouse-3 in all sgml files
;; (defun go-bind-markup-menu-to-mouse3 ()
;;   (define-key sgml-mode-map [(down-mouse-3)] 'sgml-tags-menu))
;; ;;
;; (add-hook 'sgml-mode-hook 'go-bind-markup-menu-to-mouse3)

;;Free key-bindings
;; C-n
;; C-p
;; C-delete
;; C-c b
;; C-x C-o
;; -- C-x C-l
;; C-x C-n
;; C-x C-t
;; C-x ;
;; C-x <
;; C-x h
;; M->
;; M-<
;; M-@
;; M-b
;; M-r

;(add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/flymake-0.4.16/")
;(require 'flymake)

(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))

;; (defun speedbar-expand-all-lines ()
;;   "Expand all items in the speedbar buffer.
;;  But be careful: this opens all the files to parse them."
;;   (interactive)
;;   (goto-char (point-min))
;;   (while (not (eobp))
;; 	(forward-line)
;; 	(speedbar-expand-line)))

(eval-after-load "php-mode"
  '(progn
     (c-add-style
      "pear"
      '((c-basic-offset . 4)
        (c-offsets-alist . ((block-open . -)
                            (block-close . 0)
                            (topmost-intro-cont . (first c-lineup-cascaded-calls
                                                         php-lineup-arglist-intro))
                            (brace-list-intro . +)
                            (brace-list-entry . c-lineup-cascaded-calls)
                            (arglist-close . php-lineup-arglist-close)
                            (arglist-intro . php-lineup-arglist-intro)
                            (knr-argdecl . [0])
                            (statement-cont . (first c-lineup-cascaded-calls +))))))))


(add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/markdown-mode-2.0/")
(require 'markdown-mode)

(add-to-list 'load-path "~/.emacs.d/web-mode/")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))

(setq web-mode-engines-alist
	  '(("php" . "\\.html\\'")))

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)

(setq web-mode-style-padding 1)
(setq web-mode-script-padding 1)
(setq web-mode-block-padding 0)

(setq web-mode-enable-auto-pairing t)

(setq web-mode-comment-style 2)
(setq web-mode-enable-current-element-highlight t)

(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-words-in-buffer ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))
        ("php" . (ac-source-words-in-buffer
                  ac-source-words-in-same-mode-buffers
                  ac-source-dictionary))))

;; (add-hook 'web-mode-before-auto-complete-hooks
;;           '(lambda ()
;;              (let ((web-mode-cur-language
;;                     (web-mode-language-at-pos)))
;;                (if (string= web-mode-cur-language "php")
;;                    (yas-activate-extra-mode 'php-mode)
;;                  (yas-deactivate-extra-mode 'php-mode))
;;                (if (string= web-mode-cur-language "css")
;;                    (setq emmet-use-css-transform t)
;;                  (setq emmet-use-css-transform nil)))))

(add-hook 'web-mode-hook 
		  '(lambda()
			 (local-set-key (kbd "RET") 'newline-and-indent)
			 (auto-complete-mode 1)
			 (local-set-key (kbd "C-SPC") 'auto-complete)))

(add-hook 'local-write-file-hooks
		  (lambda ()
			(delete-trailing-whitespace)
			nil))

;; (defun my-web-mode-hook ()
;;   (setq web-mode-enable-auto-pairing nil))

;; (add-hook 'web-mode-hook  'my-web-mode-hook)

;; (defun sp-web-mode-is-code-context (id action context)
;;   (when (and (eq action 'insert)
;;              (not (or (get-text-property (point) 'part-side)
;;                       (get-text-property (point) 'block-side))))
	
;;     t))

;; (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))

(setq web-mode-extra-snippets
      '(("erb" . (("name" . ("beg" . "end"))))
        ("php" . (("name" . ("beg" . "end"))
                  ("name" . ("beg" . "end"))))
		))

(setq web-mode-extra-auto-pairs
      '(("erb"  . (("open" "close")))
        ("php"  . (("open" "close")
                   ("open" "close")))
       ))

;; (add-to-list 'load-path "~/.emacs.d/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/el-get/package/elpa/nhexl-mode-0.1/")
(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
	(let ((end (copy-marker end)))
	  (while
		  (progn
			(goto-char start)
			(re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
		(replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

(defun smart-beginning-of-line ()
  "Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [home] 'smart-beginning-of-line)

(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")

