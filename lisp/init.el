(require 'color-theme)
(color-theme-initialize)
(color-theme-my-test)
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-comphist-file
   (expand-file-name
    (concat
     (if
	 (boundp
	  (quote user-emacs-directory))
	 user-emacs-directory "~/.emacs.d/")
     "/my-ac-comphist.dat")))
 '(column-number-mode t)
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(ede-project-directories (quote nil))
 '(package-selected-packages (quote (use-package vlf rainbow-mode nlinum minimap)))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(tabbar-separator (quote (0.2)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


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

;; Чтобы отлаживать если что-то не так работает
(setq debug-on-quit t)
(setq debug-on-error t)

(set-default 'truncate-lines t)

(setq ns-pop-up-frames nil)

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

;; Require my functions file
(if (not (file-exists-p (expand-file-name "~/.emacs.d/lisp/my-functions.elc")))
    (byte-compile-file (expand-file-name "~/.emacs.d/lisp/my-functions.el")))
(load-file (expand-file-name "~/.emacs.d/lisp/my-functions.elc"))

(global-set-key (kbd "C-S-<down>") 'my-duplicate-block-after)
(global-set-key (kbd "C-S-<up>") 'my-duplicate-block-before)
(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-d") 'my-duplicate-block-before)
(global-set-key (kbd "M-<down>") 'my-move-block-down)
(global-set-key (kbd "M-<up>") 'my-move-block-up)
(global-set-key (kbd "M-d") 'my-kill-region)
(global-set-key (kbd "C-S-d") 'my-kill-region)

;; Compile themes file
(if (not (file-exists-p (expand-file-name "~/.emacs.d/lisp/color-theme.elc")))
    (byte-compile-file (expand-file-name "~/.emacs.d/lisp/color-theme.el")))

;; Compile themes file
(if (not (file-exists-p (expand-file-name "~/.emacs.d/lisp/themes/color-theme-library.elc")))
    (byte-compile-file (expand-file-name "~/.emacs.d/lisp/themes/color-theme-library.el")))

(add-to-list 'write-file-functions 'untabify-current-buffer)
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

;;Движение по окнам
(global-set-key (kbd "M-s-<up>") 'windmove-up)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "M-s-<down>") 'windmove-down)
(global-set-key (kbd "M-s-<left>") 'windmove-left)

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

;;Горячие клавиши
(global-set-key (kbd "M-s") 'term)
(global-set-key (kbd "M-g") 'goto-line)
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

(add-hook 'dired-mode-hook
	  (lambda()
	    (set (make-local-variable 'mouse-1-click-follows-link) nil)
	    (define-key dired-mode-map [mouse-1] 'dired-find-file)))

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
;; C-x <RET> r CHARSET - кодировку буфера изменить

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
(setq with-editor-file-name-history-exclude 1) ;;something for magit

(add-to-list 'el-get-sources '(:name dash :type elpa))
(add-to-list 'el-get-sources '(:name s :type elpa))
(add-to-list 'el-get-sources '(:name f :type elpa))
(add-to-list 'el-get-sources '(:name yasnippet :type elpa))
(add-to-list 'el-get-sources '(:name exec-path-from-shell :type elpa))

(setq my:el-get-packages
      '(ac-html
	ac-js2
	ac-php
	ac-slime
	auto-complete
        autopair
        cl-lib
	dedicated
        dired+
	exec-path-from-shell
        git-modes
	helm
        highlight
	js2-mode
	json-mode
        magit
        multiple-cursors
        markdown-mode
        nlinum
        php-mode
        php-mode-improved
        popup
	slime
        sr-speedbar
        switch-window
        tabbar
        yascroll
	visual-fill-column
	vlf
        web-mode))

(require 'el-get-elpa)
;; elpa
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; end-elpa
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync my:el-get-packages)

;; (el-get-elpa-build-local-recipes)
;;el-get end

(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

(require 'vlf-setup)

(require 'yascroll)
(global-yascroll-bar-mode 1)

(require 'nlinum)
(setq nlinum--width 4)				;;Lines numeration
(setq nlinum--format "%%%dd\u2502") ;;Lines numeration
(setq nlinum-format  "%4d\u2502")
(global-nlinum-mode 1)

(setq default-major-mode 'text-mode)

(global-set-key (kbd "<f9>") 'compile)
(global-set-key [f11] 'toggle-fullscreen)

(add-hook 'ediff-load-hook
	  (lambda ()
	    (set-face-foreground ediff-current-diff-face-B "blue")
	    (set-face-background ediff-current-diff-face-B "red")
	    (make-face-italic ediff-current-diff-face-B)))

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

(require 'fuzzy)
(setf ac-use-fuzzy t)
(setq ac-auto-start nil)

(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'comment-line)

(global-unset-key (kbd "C-e"))
(global-set-key (kbd "C-e") 'uncomment-region)

(require 'highlight)
(global-unset-key (kbd "C-y"))
(global-set-key (kbd "C-y") 'hlt-highlight)
(global-unset-key (kbd "M-y"))
(global-set-key (kbd "M-y") 'hlt-unhighlight-region)

(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)

(require 'markdown-mode)

(add-hook 'shell-mode-hook 'my-shell-mode-hook)
(defun my-shell-mode-hook ()
  (setq comint-input-ring-file-name "~/.zsh_history")  ;; or bash_history
  (comint-read-input-ring t))

(put 'smart-beginning-of-line 'CUA 'move)

(global-set-key [home] 'smart-beginning-of-line)

(setq jit-lock-defer-time 0.05)
(setq redisplay-dont-pause t)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-conservatively 10000)
(setq scroll-margin 1)

(load-file (expand-file-name "~/.emacs.d/lisp/my-sbcl-config.el"))
(load-file (expand-file-name "~/.emacs.d/lisp/my-dev-config.el"))
(load-file (expand-file-name "~/.emacs.d/lisp/my-web-config.el"))
(load-file (expand-file-name "~/.emacs.d/lisp/my-org-config.el"))
(load-file (expand-file-name "~/.emacs.d/lisp/my-tabbar-config.el"))
(load-file (expand-file-name "~/.emacs.d/lisp/my-speedbar-config.el"))
(load-file (expand-file-name "~/.emacs.d/lisp/my-helm-config.el"))
