(defun memacs/init-company ()
  (use-package company
    :ensure t
    )

  (add-hook'after-init-hook 'global-company-mode)
  (global-company-mode 1)
  )
