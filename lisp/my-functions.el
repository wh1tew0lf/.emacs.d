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
	(forward-line 1)
	;; (next-line 1)
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
	(forward-line 1)
	;; (next-line 1)
	(yank)
	(when kill-ring
	  (setq kill-ring (cdr kill-ring)))
	(when kill-ring-yank-pointer
	  (setq kill-ring-yank-pointer kill-ring))
	(goto-char start)
	(set-mark-command nil)
	(goto-char end)
	(setq deactivate-mark nil)))

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
	(forward-line 1)
	;;	(next-line 1)
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

;; Delete trailing whitespaces, format buffer and untabify when save buffer
(defun format-current-buffer()
  (indent-region (point-min) (point-max)))

(defun untabify-current-buffer()
  (if (not indent-tabs-mode)
	  (untabify (point-min) (point-max)))
  nil)

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun my-save-modified-buffers()
  (interactive)
  (save-some-buffers t))
(global-set-key (kbd "C-S-s") 'my-save-modified-buffers)

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

;; Called each time the modification state of the buffer changed.
(defun ztl-modification-state-change ()
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

;; First-change-hook is called BEFORE the change is made.
(defun ztl-on-buffer-modification ()
  (set-buffer-modified-p t)
  (ztl-modification-state-change))

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
  (interactive "^") ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
