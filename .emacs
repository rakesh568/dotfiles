;; rranjan568 .emacs file.

;;(setq font-lock-support-mode 'jit-lock-mode)
;;(require 'font-lock)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(add-to-list 'load-path "/home/rranjan/.emacs.d/custom")

;;dark emacs
(load-file "~/.emacs.d/custom/zenburn-theme.el")

(add-to-list 'default-frame-alist '(alpha 85 85))

;;(set-face-attribute 'default nil :background "black"
;;  :foreground "white" :font "Courier" :height 180)

;;xscope
(load-file "/usr/share/emacs/site-lisp/xcscope.el")
(require 'xcscope)
;;(setq cscope-do-not-update-database t)

;;etags
(defun create-tags (dir-name)
     "Create tags file."
     (interactive "DDirectory: ")
     (eshell-command 
     (format "find %s -name "*.[ch]" -print | xargs etags -a" dir-name)))


;;uniquify for file names with path on bottom
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; show full path on top
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;;match parantheses
(show-paren-mode 1)



;;file associations
(push '("\\.cli\\'" .  tcl-mode) auto-mode-alist)
(push '("\\.obj\\'" .  c-mode) auto-mode-alist)

;;smooth scrolling
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;;copying from emacs to clipboard
;;(setq x-select-enable-clipboard t)

;;auto sync files
(global-auto-revert-mode t)

;;Change yes-or-no to y-or-n
(fset `yes-or-no-p 'y-or-n-p)

;;removing startup page
(setq inhibit-startup-message t)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;;Line numbers
;; Set Linum-Mode on
(global-linum-mode t)
(setq linum-format "%d ")

;;dont exit emacs mistakely
;;(global-set-key "\C-x\C-c" nil)
(global-set-key "\C-z" nil)
;;tab width related....copied from shankara
  (setq-default default-tab-width 4)
  (setq-default tab-width 4)
  (setq indent-tabs-mode nil)

;;buffer menu...better than buffer list, gives more otions to do with buffers
(global-set-key "\C-x\C-b" 'buffer-menu)

;;maximized emacs window on startup
;;(set-frame-position (selected-frame) 0 0)
;;(et-frame-size (selected-framse) 237 5)5
;;auto-completion on pressing tabs
;;(require 'bash-completion)
;;  (bash-completion-setup)

;;emacs bash completion

;;  (require 'bash-completion)
;;  (bash-completion-setup)

;; custom debug command
(defun insert-printf ()
  (interactive)
  (insert "fprintf(stderr, \"rakesh: %s %d\\n\",__FUNCTION__,__LINE__);"))
  (global-set-key "\M-p" 'insert-printf)


;;load the etags-select.el source code
(load-file "/home/rranjan/.emacs.d/custom/etags-select.el")
(global-set-key "\M-." 'etags-select-find-tag-at-point)
(global-set-key "\M-?" 'etags-select-find-tag)
;;for setting tags table location
(global-set-key "\M-t" 'visit-tags-table)

;; commenting n uncommenting
;;(global-set-key "\C-cc" 'comment-region)
;;(global-set-key "\C-cu" 'uncomment-region)
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
  (global-set-key (kbd "M-SPC") 'toggle-comment-on-line)

;;back from etags
(global-set-key "\C-q" 'pop-tag-mark)

;;back from cscope
(global-set-key "\M-q" 'cscope-pop-mark)

;;custom rgdb command
(setq gdb-command-name "/sbox/rranjan/<branch>/tools/debug/rgdb <switchip> <process>")

;;highlight symbol
(require 'highlight-symbol)

(global-set-key (kbd "<f1>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f2>") 'highlight-symbol-next)
(global-set-key (kbd "<f3>") 'highlight-symbol-prev)

;;change tab
(global-set-key "\C-t" 'other-window)

;;(require 'etags-table)
;;(setq tag-table-alist
;;      '(("./" . "./")
;;        ("./" . "./../")
;;))
;;(setq etags-table-alist tag-table-alist)
;;(setq etags-table-search-up-depth 10)
;;(setq tags-table-list '("./TAGS" "../TAGS" "../../TAGS" "../../../TAGS" "../../../../TAGS" "../../../../../TAGS" "../../../../../../TAGS" "../../../../../../../TAGS"))



;;(defadvice find-tag (before c-tag-file activate)
;;   "Automatically create tags file."
;;   (let ((tag-file (concat default-directory "TAGS")))
;;     (unless (file-exists-p tag-file)
;;       (shell-command "etags *.[ch] -o TAGS 2>/dev/null"))
;;     (visit-tags-table tag-file)))

;;rgrep
(global-set-key "\M-r" 'rgrep)

;;manpage
(global-set-key "\M-m" 'man)

;;cscope make writeable
(setq cscope-allow-arrow-overlays nil)
(global-set-key "\M-a" 'cscope-find-global-definition)
(global-set-key "\M-d" 'cscope-find-functions-calling-this-function)
(global-set-key "\M-s" 'cscope-find-this-symbol)



(global-set-key "\M-b" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))


