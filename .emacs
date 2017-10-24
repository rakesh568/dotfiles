(keyboard-translate ?\C-h ?\C-?)

(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

 
(add-to-list 'default-frame-alist '(alpha 85 85))

(show-paren-mode 1)

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

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

;;buffer menu...better than buffer list, gives more otions to do with buffers
(global-set-key "\C-x\C-b" 'buffer-menu)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
  (global-set-key (kbd "M-SPC") 'toggle-comment-on-line)

(setq uniquify-buffer-name-style 'forward)

;;highlight symbol
(require 'highlight-symbol)

(global-set-key (kbd "<f1>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f2>") 'highlight-symbol-next)
(global-set-key (kbd "<f3>") 'highlight-symbol-prev)

;;change tab
(global-set-key "\C-t" 'other-window)

;;rgrep
(global-set-key "\M-r" 'rgrep)


(global-set-key "\M-b" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))



;;(require 'setup-ggtags)
(require 'xcscope)
(setq cscope-allow-arrow-overlays nil)
(global-set-key "\M-a" 'cscope-find-global-definition)
(global-set-key "\M-d" 'cscope-find-functions-calling-this-function)
(global-set-key "\M-s" 'cscope-find-this-symbol)


;;back from etags
(global-set-key "\C-q" 'pop-tag-mark)

;;back from cscope
(global-set-key "\M-q" 'cscope-pop-mark)

;(split-window-right)

;;(setq split-height-threshold nil)
;;(setq split-width-threshold 60)
(setq split-height-threshold nil
      split-width-threshold nil)

;;(load-file "~/.emacs.d/helm-gtags.el")
(require 'helm-gtags)
(setq
  helm-gtags-ignore-case t
  helm-gtags-auto-update t
  helm-gtags-use-input-at-cursor t
  helm-gtags-pulse-at-cursor t
  helm-gtags-prefix-key "\C-cg"
  helm-gtags-suggested-key-mapping t
  )
  
 (add-hook 'python-mode-hook 'helm-gtags-mode)
 
 (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
 (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
 (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
 (define-key helm-gtags-mode-map (kbd "C-q") 'helm-gtags-pop-stack)
 (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
 (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;;(require 'indent-guide)
;;(indent-guide-global-mode t)
;;(setq indent-guide-recursive t)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\|)

