(defun memacs/init-ivy ()
  (use-package hydra
    :ensure t
    )

  (use-package ivy
    :bind
    (("C-s" . swiper))
    :diminish ivy-mode
    :custom
    ((ivy-use-virtual-buffers t)
     (enable-recursive-minibuffers t)
     (ivy-count-format "(%d/%d) ")
     (ivy-wrap t))
    :config
    (ivy-mode 1)
    ;; (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    )

  (use-package counsel
    :bind
    (
     ("M-x" . counsel-M-x)
     ("C-x C-f" . counsel-find-file)
     ("<f1> f" . counsel-describe-function)
     ("<f1> v" . counsel-describe-variable)
     ("<f1> l" . counsel-find-library)
     ("<f2> i" . counsel-info-lookup-symbol)
     ("<f2> u" . counsel-unicode-char)
     ;; ("C-c g" . counsel-git)
     ;; ("C-c j" . counsel-git-grep)
     ;; ("C-c k" . counsel-ag)
     ("C-x l" . counsel-locate)
     )
    ) 
  
  (use-package swiper
    :bind
    (("\C-s" . swiper))
    )
  )

