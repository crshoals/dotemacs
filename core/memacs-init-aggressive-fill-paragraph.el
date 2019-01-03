(defun memacs/aggressive-fill-paragraph ()
  (use-package aggressive-fill-paragraph
    :ensure t
    :config
    (afp-setup-recommended-hooks)
    )
  )
