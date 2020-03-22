; Automatically load the "foldout" package when "outline" is used.
(eval-after-load "outline" '(require 'foldout))

(require 'outline)

(provide 'my-outline)

(add-hook 'outline-mode-hook 'my-outline-mode-hook)

(defun my-outline-mode-hook ()
  (define-key outline-mode-prefix-map [C-right] 'outline-next-visible-heading)
  (define-key outline-mode-prefix-map [C-left]  'outline-previous-visible-heading)
  (define-key outline-mode-prefix-map [C-right] 'outline-next-visible-heading)
  (define-key outline-mode-prefix-map [C-up]    'outline-backward-same-level)
  (define-key outline-mode-prefix-map [C-down]  'outline-forward-same-level)
  (define-key outline-mode-prefix-map [C-tab]   'show-children)

;;   (local-set-key [?\C-c C-left]    'outline-previous-visible-heading)
;;   (local-set-key [?\C-c C-right]   'outline-next-visible-heading)
;;   (local-set-key [?\C-c C-up]      'outline-backward-same-level)
;;   (local-set-key [?\C-c C-down]    'outline-forward-same-level)
)

;;   (define-key outline-mode-prefix-map "\C-n" 'outline-next-visible-heading)
;;   (define-key outline-mode-prefix-map "\C-p" 'outline-previous-visible-heading)
;;   (define-key outline-mode-prefix-map "\C-i" 'show-children)
;;   (define-key outline-mode-prefix-map "\C-s" 'show-subtree)
;;   (define-key outline-mode-prefix-map "\C-d" 'hide-subtree)
;;   (define-key outline-mode-prefix-map "\C-u" 'outline-up-heading)
;;   (define-key outline-mode-prefix-map "\C-f" 'outline-forward-same-level)
;;   (define-key outline-mode-prefix-map "\C-b" 'outline-backward-same-level)
