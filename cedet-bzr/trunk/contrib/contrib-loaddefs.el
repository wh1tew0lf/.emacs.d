;;; contrib-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (eassist-list-methods eassist-switch-h-cpp) "eassist"
;;;;;;  "eassist.el" (20790 39373))
;;; Generated autoloads from eassist.el

(defvar eassist-header-switches '(("h" "cpp" "cc" "c") ("hpp" "cpp" "cc") ("cpp" "h" "hpp") ("c" "h") ("C" "H") ("H" "C" "CPP" "CC") ("cc" "h" "hpp")) "\
This variable defines possible switches for `eassist-switch-h-cpp' function.
Its format is list of (from . (to1 to2 to3...)) elements.  From and toN are
strings which are extentions of the files.")

(autoload 'eassist-switch-h-cpp "eassist" "\
Switch header and body file according to `eassist-header-switches' var.
The current buffer's file name extention is searched in
`eassist-header-switches' variable to find out extention for file's counterpart,
for example *.hpp <--> *.cpp.

\(fn)" t nil)

(autoload 'eassist-list-methods "eassist" "\
Show method/function list of current buffer in a newly created buffer.
This function is recommended to be bound to some convinient hotkey.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "ede-gnustep" "ede-gnustep.el" (20624 54762))
;;; Generated autoloads from ede-gnustep.el

(ede-add-project-autoload (ede-project-autoload "edegnustep" :name "GNUstep-Make" :file 'ede-gnustep :proj-file "ProjStep.ede" :load-type 'ede-step-load :class-sym 'ede-step-project))

(ede-add-project-autoload (ede-project-autoload "gnustep-root" :name "GNUstep-make Top Most" :file 'ede-gnustep :proj-file "RootProjStep.ede" :initializers '(:project-mode scanner) :load-type 'ede-gnustep-load :class-sym 'ede-step-project))

(ede-add-project-autoload (ede-project-autoload "gnustep" :name "GNUstep-Make in scanner mode" :file 'ede-gnustep :proj-file "ProjStep.ede" :initializers '(:project-mode scanner) :load-type 'ede-gnustep-load :class-sym 'ede-step-project))

(add-to-list 'auto-mode-alist '("\\(Root\\)?ProjStep\\.ede" . emacs-lisp-mode))

;;;***

;;;### (autoloads (semantic-tag-folding-mode global-semantic-tag-folding-mode
;;;;;;  global-semantic-tag-folding-mode) "semantic-tag-folding"
;;;;;;  "semantic-tag-folding.el" (20981 1996))
;;; Generated autoloads from semantic-tag-folding.el

(defvar global-semantic-tag-folding-mode nil "\
*If non-nil enable global use of variable `semantic-tag-folding-mode'.
With this mode enabled, a new folding decoration mode is added.
Clicking on a + or - in the fringe will fold that tag.")

(custom-autoload 'global-semantic-tag-folding-mode "semantic-tag-folding" nil)

(defvar global-semantic-tag-folding-mode nil "\
Non-nil if Global-Semantic-Tag-Folding mode is enabled.
See the command `global-semantic-tag-folding-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-semantic-tag-folding-mode'.")

(custom-autoload 'global-semantic-tag-folding-mode "semantic-tag-folding" nil)

(autoload 'global-semantic-tag-folding-mode "semantic-tag-folding" "\
Toggle global use of option `semantic-tag-folding-mode'.
If ARG is positive or nil, enable, if it is negative, disable.

\(fn &optional ARG)" t nil)

(autoload 'semantic-tag-folding-mode "semantic-tag-folding" "\
Minor mode mark semantic tags for folding.
This mode will display +/- icons in the fringe.  Clicking on them
will fold the current tag.
With prefix argument ARG, turn on if positive, otherwise off.  The
minor mode can be turned on only if semantic feature is available and
the current buffer was set up for parsing.  Return non-nil if the
minor mode is enabled.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (wisent-csharp-default-setup) "wisent-csharp" "wisent-csharp.el"
;;;;;;  (20580 44388))
;;; Generated autoloads from wisent-csharp.el

(autoload 'wisent-csharp-default-setup "wisent-csharp" "\


\(fn)" nil nil)

(add-hook 'csharp-mode-hook #'wisent-csharp-default-setup)

;;;***

;;;### (autoloads (wisent-php-default-setup) "wisent-php" "wisent-php.el"
;;;;;;  (21331 59395))
;;; Generated autoloads from wisent-php.el

(autoload 'wisent-php-default-setup "wisent-php" "\
Hook run to setup Semantic in `php-mode'.
Use the alternate LALR(1) parser.

\(fn)" nil nil)

(add-hook 'php-mode-hook #'wisent-php-default-setup)

;;;***

;;;### (autoloads nil nil ("cedet-contrib-load.el" "cedet-contrib.el"
;;;;;;  "semantic-ectag-scala.el" "wisent-ruby.el") (21414 27730
;;;;;;  941652))

;;;***

(provide 'contrib-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; contrib-loaddefs.el ends here
