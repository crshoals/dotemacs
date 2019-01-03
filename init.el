
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t) ; No splash screen please ... jeez

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file custom-file)
(load-file "~/.emacs.d/core/memacs-pre-init.el")

(memacs/pre-init)
(memacs/init-aggressive-indent)
(memacs/init-yasnippet)
(memacs/ui-config)
(memacs/init-sandbox)
(memacs/init-delight)
(memacs/init-ivy)
(memacs/init-evil)
(memacs/init-which-key)
(memacs/init-dired-sidebar)
(memacs/init-ranger)
(memacs/post-init)
(put 'dired-find-alternate-file 'disabled nil)
