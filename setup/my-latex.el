(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)

(defun my-LaTeX-mode-hook ()
  (local-set-key [f5]   (lambda () (interactive) (insert-pair 0 ?$ ?$)))
  (local-set-key [C-f5] (lambda () (interactive) (insert-pair 0 ?$ ?$) (insert "\\")))
)
