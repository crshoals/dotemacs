(defun memacs/load-core ()
  (add-to-list 'load-path "~/.emacs.d/core")
  (dolist (file (directory-files "~/.emacs.d/core"))
    (unless (or (string= "." file)
	        (string= ".." file))
      (load (file-name-sans-extension file))))  )

(defun memacs/pre-init ()
  (memacs/load-core)

  ;; Bootstrap use-package
  (require 'package)
  (setq package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

  (package-initialize)

  ;; Bootstrap 'use-package'
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (eval-when-compile
    (require 'use-package))

  (setq use-package-compute-statistics t)

  )

(defun memacs/ui-config ()
  ;; remap mod keys
  (setq mac-command-modifier 'meta)  ; move meta to command
  (setq mac-option-modifier 'super)  ; move super to alt/option
  (setq ns-function-modifier 'hyper) ; add hyper

  ;; Turn off freaking backups
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  
  ;; store all backup and autosave files in the tmp dir
  ;;  (setq backup-directory-alist
  ;;        '((".*" . 'temporary-file-directory)))
  ;;  (setq auto-save-file-name-transforms
  ;;        '((".*" 'temporary-file-directory t)))

  ;; allo el-doc in mini-buffer
  (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)

  ;; turn off that fucking beep
  (setq visible-bell t)
  (setq ring-bell-function 'ignore)

  ;; give us [TAB] for indent and[TAB][TAB] for complete
  ;;(setq tab-always-indent ‘complete)


  (global-set-key [remap goto-line] 'goto-line-with-feedback)

  (defun goto-line-with-feedback ()
    "Show line numbers temporarily, while prompting for the line number input"
    (interactive)
    (unwind-protect
        (progn
          (linum-mode 1)
          (goto-line (read-number "Goto line: ")))
      (linum-mode -1)))

  ;; Save point position between sessions
  (require 'saveplace)
  (setq-default save-place t)
  (setq save-place-file (expand-file-name ".places" user-emacs-directory))

  ;; Turn off mouse interface early in startup to avoid momentary display
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

  ;; No splash screen please ... jeez
  (setq inhibit-startup-message t)
  
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  
  ;; nice scrolling
  (setq scroll-margin 0
        scroll-conservatively 100000
        scroll-preserve-screen-position 1)

  ;; mode line settings
  (line-number-mode t)
  (column-number-mode t)
  (size-indication-mode t)

  ;; enable y/n answers
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; more useful frame title, that show either a file or a
  ;; buffer name (if the buffer isn't visiting a file)
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b"))))

  (setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
  (setq-default tab-width 8)            ;; but maintain correct appearance


  ;; revert buffers automatically when underlying files are changed externally
  (global-auto-revert-mode t)

  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)

  ;; hippie expand is dabbrev expand on steroids
  (setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                           try-expand-dabbrev-all-buffers
                                           try-expand-dabbrev-from-kill
                                           try-complete-file-name-partially
                                           try-complete-file-name
                                           try-expand-all-abbrevs
                                           try-expand-list
                                           try-expand-line
                                           try-complete-lisp-symbol-partially
                                           try-complete-lisp-symbol))

  ;; use hippie-expand instead of dabbrev
  (global-set-key (kbd "M-/") #'hippie-expand)
  (global-set-key (kbd "s-/") #'hippie-expand)

  ;; replace buffer-menu with ibuffer
  (global-set-key (kbd "C-x C-b") #'ibuffer)

  ;; align code in a pretty way
  (global-set-key (kbd "C-x \\") #'align-regexp)

  (setq version-control t     ;; Use version numbers for backups.
        kept-new-versions 10  ;; Number of newest versions to keep.
        kept-old-versions 2   ;; Number of oldest versions to keep.
        delete-old-versions t ;; Don't ask to delete excess backup versions.
        backup-by-copying t)  ;; Copy all files, don't rename them.


  ;; highlight the current line
  (global-hl-line-mode +1)

  (electric-pair-mode 1)

  (defun eval-either ()
    (interactive)
    (if (use-region-p)
        (eval-region (region-beginning) (region-end))
      (eval-buffer))
    )
  
  (global-set-key (kbd "<f6>") 'eval-either)
  )

;; (use-package paradox
;;  :ensure t
;;  :bind
;; ("C-S-p" . list-packages))

