;; ---------------------Content of .emacs---------------------
;; (package-initialize)

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
;; (load-file "~/.emacs.d/lisp/bootstrap.el")
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-my-test)
;; (put 'narrow-to-region 'disabled nil)

;; -------------------END Content of .emacs--------------------

;; Increase SBCL heap size for install some packages for data mining
(setq inferior-lisp-program "sbcl --dynamic-space-size 4096")
(setq slime-lisp-implementations
      '((sbcl ("/usr/local/bin/sbcl" "--dynamic-space-size" "4096"))))

(set-language-environment 'utf-8)
(setq slime-net-coding-system 'utf-8-unix)
(setq lisp-lambda-list-keyword-parameter-alignment t)
(setq lisp-lambda-list-keyword-alignment t)
(setq common-lisp-style-default 'modern)
(cua-mode t)
(setq x-select-enable-clipboard t) ;;Общий с ОС буфер обмена:
(tooltip-mode      -1)
(menu-bar-mode     -1)				;; отключаем графическое меню
(tool-bar-mode     -1)				;; отключаем tool-bar
(scroll-bar-mode   -1)				;; отключаем полосу прокрутки
(blink-cursor-mode -1)				;; курсор не мигает
(setq use-dialog-box     nil)		;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)		;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore)	;; отключить звуковой сигнал
(delete-selection-mode t)			;; возможность удалить выделенный текст при вводе поверх
(electric-pair-mode    1)			;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode -1)			;; отключить индентацию  electric-indent-mod'ом
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 4)
(setq make-backup-files nil)

(fringe-mode 4)						;; make the fringe thinner (default is 8 in pixels)
(show-paren-mode 1)
(setq show-paren-style 'expression)
(global-hl-line-mode t)
(setq search-highlight        t)
(setq query-replace-highlight t)

(custom-set-variables
 '(column-number-mode t)
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(ac-comphist-file (expand-file-name
					 (concat (if (boundp 'user-emacs-directory)
								 user-emacs-directory
							   "~/.emacs.d/")
							 "/my-ac-comphist.dat")))
 '(ede-project-directories (quote ()))
 '(tabbar-separator (quote (0.2)))
 '(tool-bar-mode nil))

;; Require my factions file
(if (not (file-exists-p (expand-file-name "~/.emacs.d/lisp/my-functions.elc")))
	(byte-compile-file (expand-file-name "~/.emacs.d/lisp/my-functions.el")))
(load-file (expand-file-name "~/.emacs.d/lisp/my-functions.elc"))

;; IDO plugin
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b
(global-set-key (kbd "<f2>") 'bs-show) ;; запуск buffer selection кнопкой F2

(add-to-list 'write-file-functions 'untabify-current-buffer)
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

;;Движение по окнам
;;(global-set-key (kbd "s-<up>") 'windmove-up)
;;(global-set-key (kbd "s-<right>") 'windmove-right)
;;(global-set-key (kbd "s-<down>") 'windmove-down)
;;(global-set-key (kbd "s-<left>") 'windmove-left)

(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)
(global-unset-key (kbd "M-A"))
(global-set-key (kbd "M-A") 'shrink-window)
(global-unset-key (kbd "C-<next>"))
(global-unset-key (kbd "M-V"))
(global-set-key (kbd "M-V") 'enlarge-window)
(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'save-buffer)

(define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

;;(set-face-attribute 'default nil :font "Ubuntu Mono")

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

(global-unset-key (kbd "<escape>"))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-unset-key (kbd "C-t"))
(global-set-key (kbd "C-t") 'hlt-highlight-regexp-region)
(global-unset-key (kbd "M-t"))
(global-set-key (kbd "M-t") 'hlt-unhighlight-regexp-region)

(global-unset-key (kbd "C-x t"))
(global-set-key (kbd "C-x t") 'hlt-highlight-regexp-to-end)
(global-unset-key (kbd "C-x T"))
(global-set-key (kbd "C-x T") 'hlt-unhighlight-regexp-to-end)
(global-unset-key (kbd "C-x C-t"))
(global-set-key (kbd "C-x C-t") 'hlt-highlight-symbol)
(global-unset-key (kbd "C-x C-S-t"))
(global-set-key (kbd "C-x C-S-t") 'hlt-unhighlight-symbol)

(setq tab-stop-list (number-sequence 4 120 4))

;;Поиск и замена
(global-unset-key (kbd "M-f"))
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


(defun find-current-tag()
  "Search for current tag at cursor position"
  (interactive)
  (let
	  ((start 0)
	   (end 0))
	(save-excursion
	  (left-word 1)
	  (setf start (point))
	  (right-word 1)
	  (setf end (point))
	  (message (buffer-substring start end)))
	(find-tag (buffer-substring start end))))


(global-unset-key (kbd "M-."))
(global-set-key (kbd "M-.") 'find-current-tag)

(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

;(require 'dedicated)
(global-unset-key (kbd "C-$"))
(global-set-key (kbd "C-$") 'dedicated-mode)

(global-unset-key (kbd "C-b"))
(global-set-key (kbd "C-b") 'list-bookmarks)
(global-unset-key (kbd "C-,"))
(global-set-key (kbd "C-,") 'bookmark-set)
(global-unset-key (kbd "C-."))
(global-set-key (kbd "C-.") 'bookmark-jump)

;;‘a’ – show annotation for the current bookmark
;;‘A’ – show all annotations for your bookmarks
;;‘d’ – mark various entries for deletion (‘x’ – to delete them)
;;‘e’ – edit the annotation for the current bookmark
;;‘m’ – mark various entries for display and other operations, (‘v’ – to visit)
;;‘o’ – visit the current bookmark in another window, keeping the bookmark list open
;;‘C-o’ – switch to the current bookmark in another window
;;‘r’ – rename the current bookmark

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

;; отключить переносы строк
(add-hook 'org-mode-hook (lambda ()
                           (auto-fill-mode -1)))
(set-default 'truncate-lines t)

(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w") (lambda()
							  (interactive)
							  (kill-buffer)))

;;el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
	  (url-retrieve-synchronously
	   "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
	(goto-char (point-max))
	(eval-print-last-sexp)))

(setq my:el-get-packages
	  '(ac-php
		auto-complete
        autopair
        cl-lib
		dedicated
        dired+
        dirtree
        git-modes
        highlight
        magit
		minimap
        multiple-cursors
        markdown-mode
		helm
        nlinum
        nhexl-mode
        php-eldoc
		php-extras
        php-mode
        php-mode-improved
        popup
        rainbow-delimiters
        rainbow-mode
		slime
        sr-speedbar
        switch-window
        tabbar
        yascroll
		vlf
        web-mode))

(el-get 'sync my:el-get-packages)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(require 'el-get-elpa)
;; (el-get-elpa-build-local-recipes)
;;el-get end

;;elpa
;; (setq package-archives
;; 	  '(("elpa" . "http://tromey.com/elpa/")
;; 		("melpa" . "http://melpa.milkbox.net/packages/")
;; 		("gnu" . "http://elpa.gnu.org/packages/")
;; 		("marmalade" . "http://marmalade-repo.org/packages/")))
;;end-elpa

(require 'yascroll)
(global-yascroll-bar-mode 1)

(require 'php-mode)
(setq php-mode-warn-if-mumamo-off nil)
(setq php-warned-bad-indent nil)

(autoload 'php-imenu-create-index "php-imenu" nil t)
;; Add the index creation function to the php-mode-hook
(add-hook 'php-mode-user-hook 'php-imenu-setup)
(defun php-imenu-setup ()
  (setq imenu-create-index-function (function php-imenu-create-index))
  ;; uncomment if you prefer speedbar:
  ;;(setq php-imenu-alist-postprocessor (function reverse))
  (imenu-add-menubar-index))

(require 'nlinum)
(setq nlinum--width 4)				;;Lines numeration
(setq nlinum--format "%%%dd\u2502") ;;Lines numeration
(setq nlinum-format  "%4d\u2502")
(global-nlinum-mode 1)
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
			;;(require 'php-electric)
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
			;;(c-toggle-auto-newline 1)
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
			(setq c-default-style "whitesmith")
			(setq indent-tabs-mode nil)
			(setq c-basic-indent 4)
			(setq tab-width 4)
			(setf c-basic-offset 4)
			(auto-complete-mode 1)
			;;(local-set-key (kbd "C-SPC") 'auto-complete)
			;;(local-set-key (kbd "s-SPC") 'semantic-ia-complete-symbol-menu)
			(setq indent-tabs-mode nil)))

(add-hook 'c++-mode-hook
		  (lambda()
			(setq c-default-style "whitesmith")
			(setq c-basic-indent 2)
			(setq tab-width 4)
			(setf c-basic-offset 4)
			(auto-complete-mode 1)
			(local-set-key "." my-semantic-complete-self-insert)
			(local-set-key ">" my-semantic-complete-self-insert)
			(local-set-key (kbd "C-SPC") 'auto-complete)
			(local-set-key (kbd "s-SPC") 'semantic-ia-complete-symbol-menu)
			(setq indent-tabs-mode nil)))

(global-set-key (kbd "<f9>") 'compile)
(global-set-key [f11] 'toggle-fullscreen)

(global-set-key (kbd "C-S-<down>") 'my-duplicate-block-after)
(global-set-key (kbd "C-S-<up>") 'my-duplicate-block-before)
(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-d") 'my-duplicate-block-before)
(global-set-key (kbd "M-<down>") 'my-move-block-down)
(global-set-key (kbd "M-<up>") 'my-move-block-up)
(global-set-key (kbd "M-d") 'my-kill-region)
(global-set-key (kbd "C-S-d") 'my-kill-region)

(add-hook 'ediff-load-hook
		  (lambda ()
			(set-face-foreground ediff-current-diff-face-B "blue")
			(set-face-background ediff-current-diff-face-B "red")
			(make-face-italic ediff-current-diff-face-B)))

;; Tabbar
(require 'tabbar)

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


;; Add a buffer modification state indicator in the tab label, and place a
;; space around the label to make it looks less crowd.
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
		(if (and (buffer-modified-p (tabbar-tab-value tab))
				 (buffer-file-name (tabbar-tab-value tab)))
			(concat " + " (concat ad-return-value " "))
		  (concat " " (concat ad-return-value " ")))))

(global-set-key [C-S-iso-lefttab] 'tabbar-backward-tab)
(global-set-key [C-tab] 'tabbar-forward-tab)
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
(add-hook 'after-save-hook 'ztl-modification-state-change)
(add-hook 'after-revert-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)
(tabbar-mode 1)
;; tabbar end

;; speedbar settings
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")

;; Some file extensions for speedbar showing
(dolist (extension '(".c" ".cc" ".c++" ".h" ".sh"
					 ".py" ".pl" ".ruby" ".xml"
					 ".htm" ".html" ".css" ".php"
					 ".txt" ".md" ".js"))
  (speedbar-add-supported-extension extension))

(require 'helm)
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

(require 'tramp)
(setq tramp-default-method "ssh")
(setq password-cache-expiry nil)
;;/remotehost:filename  RET (or /method:user@remotehost:filename)

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
(require 'fuzzy)
(setf ac-use-fuzzy t)

(require 'rainbow-delimiters)
;;(global-rainbow-delimiters-mode)

(require 'rainbow-mode)
;;(rainbow-turn-on)

;;(global-unset-key (kbd "<S-down-mouse-1>"))
;;(global-set-key (kbd "<S-down-mouse-1>") 'mouse-set-region)

(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'comment-region)

(global-unset-key (kbd "C-e"))
(global-set-key (kbd "C-e") 'uncomment-region)

(require 'highlight)
(global-unset-key (kbd "C-y"))
(global-set-key (kbd "C-y") 'hlt-highlight)
(global-unset-key (kbd "M-y"))
(global-set-key (kbd "M-y") 'hlt-unhighlight-region)

(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)

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


(require 'markdown-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))

;; (setq web-mode-engines-alist '(("php" . "\\.html\\'")))

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)

(setq web-mode-style-padding 1)
(setq web-mode-script-padding 1)
(setq web-mode-block-padding 0)

(setq web-mode-enable-auto-pairing t)

(setq web-mode-comment-style 2)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-heredoc-fontification t)

(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-words-in-buffer ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))
        ("php" . (ac-source-words-in-buffer
                  ac-source-words-in-same-mode-buffers
                  ac-source-dictionary))))

(add-hook 'web-mode-hook
		  '(lambda()
			 (local-set-key (kbd "RET") 'newline-and-indent)
			 (auto-complete-mode 1)
			 (local-set-key (kbd "C-SPC") 'auto-complete)))

(add-hook 'local-write-file-hooks
		  (lambda ()
			(delete-trailing-whitespace)
			nil))

(setq web-mode-extra-auto-pairs
      '(("erb"  . (("open" "close")))
        ("php"  . (("open" "close")
                   ("open" "close")))
		))


(put 'smart-beginning-of-line 'CUA 'move)

(global-set-key [home] 'smart-beginning-of-line)

;; (require 'nhexl-mode)

(font-lock-add-keywords
 'c-mode
 '(("\\<\\(FIXME\\|TODO\\|QUESTION\\|NOTE\\)"
	1 font-lock-warning-face prepend)))

(font-lock-add-keywords
 'php-mode
 '(("\\<\\(FIXME\\|TODO\\|QUESTION\\|NOTE\\)"
	1 font-lock-warning-face prepend)))

(setq jit-lock-defer-time 0.05)
