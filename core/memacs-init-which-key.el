(defun memacs/init-which-key()
  (use-package which-key			
    :ensure t
    :config
    (which-key-mode)
    (which-key-setup-side-window-bottom)
    ;; (setq which-key-sort-order 'which-key-key-order)
    ;; same as default, except single characters are sorted alphabetically
    ;; (setq which-key-sort-order 'which-key-key-order-alpha)
    ;; same as default, except all prefix keys are grouped together at the end
    ;; (setq which-key-sort-order 'which-key-prefix-then-key-order)
    ;; same as default, except all keys from local maps shown first
    ;; (setq which-key-sort-order 'which-key-local-then-key-order)
    ;; sort based on the key description ignoring case
    ;; (setq which-key-sort-order 'which-key-description-order)
    ;; location of which-key window. valid values: top, bottom, left, right, 
    ;; or a list of any of the two. If it's a list, which-key will always try
    ;; the first location first. It will go to the second location if there is
    ;; not enough room to display any keys in the first location
    ;; (setq which-key-side-window-location 'bottom)

    ;; max width of which-key window, when displayed at left or right.
    ;; valid values: number of columns (integer), or percentage out of current
    ;; frame's width (float larger than 0 and smaller than 1)
    ;; (setq which-key-side-window-max-width 0.33)

    ;; max height of which-key window, when displayed at top or bottom.
    ;; valid values: number of lines (integer), or percentage out of current
    ;; frame's height (float larger than 0 and smaller than 1)
    (setq which-key-side-window-max-height 0.25)

    :diminish which-key-mode
    )
  )
