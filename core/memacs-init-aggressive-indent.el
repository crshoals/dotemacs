(defun memacs/init-aggressive-indent ()
  (use-package aggressive-indent
    :ensure t
    :config
;;    (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
;; (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
;; (add-hook 'ruby-mode-hook #'aggressive-indent-mode)

 (global-aggressive-indent-mode 1)
 )
  )
