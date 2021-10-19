;;Для php
(require 'php-mode)
(setq php-mode-warn-if-mumamo-off nil)
(setq php-warned-bad-indent nil)

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
	    (require 'ac-php)
	    (setq ac-sources '(ac-source-php))
	    (yas-global-mode 1)
	    (define-key php-mode-map (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
	    (define-key php-mode-map (kbd "C-t") 'ac-php-location-stack-back)
	    (local-set-key ">" my-semantic-complete-self-insert)

	    (setq fill-column 78)
	    (c-set-offset 'arglist-cont 0)
	    (c-set-offset 'substatement-open 0)
	    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
	    (c-set-offset 'case-label 2)
	    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
	    (c-set-offset 'block-close 0)
	    (c-set-offset 'defun-close 0)
	    (auto-complete-mode t)
	    ;;(c-toggle-auto-newline 1)
	    (setq c-basic-indent 2)
	    (setq tab-width 4)
	    (setf c-basic-offset 4)
	    (local-set-key (kbd "C-SPC") 'auto-complete)
	    (php-imenu-setup)
					;(flymake-mode-on)
	    (add-hook 'c-special-indent-hook 'uniindent-closure)
	    (setq indent-tabs-mode nil)))

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

(defun setup-ac-for-haml ()
  (setq ac-sources '(ac-source-haml-tag
                     ac-source-haml-attr
                     ac-source-haml-attrv))
  ;; Enable auto complete mode
  (auto-complete-mode))

(add-hook 'haml-mode-hook 'setup-ac-for-haml)

(autoload 'php-imenu-create-index "php-imenu" nil t)
;; Add the index creation function to the php-mode-hook
(add-hook 'php-mode-user-hook 'php-imenu-setup)
(defun php-imenu-setup ()
  (setq imenu-create-index-function (function php-imenu-create-index))
  ;; uncomment if you prefer speedbar:
  (setq php-imenu-alist-postprocessor (function reverse))
  (imenu-add-menubar-index))

(add-hook 'css-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-SPC") 'auto-complete)
	    (setq c-basic-indent 4)
	    (setq tab-width 4)
	    (setf c-basic-offset 4)
	    (auto-complete-mode t)
	    (setq indent-tabs-mode nil)))

(defun my-ac-js2-setup-auto-complete-mode ()
  "Setup ac-js2 to be used with auto-complete-mode."
  (ac-define-source "js2"
    '((candidates . ac-js2-ac-candidates)
      (document . ac-js2-ac-document)
      (prefix .  ac-js2-ac-prefix)
      (requires . -1)))
  (add-to-list 'ac-sources 'ac-source-js2)
  (auto-complete-mode))

(add-hook 'js2-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-SPC") 'auto-complete)
	    (setq c-basic-indent 4)
	    (setq tab-width 4)
	    (setf c-basic-offset 4)
	    (require 'ac-js2)
	    (my-ac-js2-setup-auto-complete-mode)
	    (auto-complete-mode t)
	    (setq indent-tabs-mode nil)))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'web-mode-ac-sources-alist
             '("html" . (ac-source-html-tag
                         ac-source-html-attr
                         ac-source-html-attrv)))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))

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

(font-lock-add-keywords
 'php-mode
 '(("\\<\\(FIXME\\|TODO\\|QUESTION\\|NOTE\\)"
    1 font-lock-warning-face prepend)))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(defun re-format-html ()
  "Reformat html source"
  (interactive)
  (sgml-mode)
  (sgml-pretty-print (point-min) (point-max))
  (web-mode)
  (web-mode-buffer-indent))
(add-to-list 'ac-modes 'web-mode)
