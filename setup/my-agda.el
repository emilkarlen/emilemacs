;; Agda related stuff

;; (autoload 'agda2-mode "agda2-mode" "Agda2 mode." t)
;; (add-to-list 'auto-mode-alist '("\\.l?agda$" . agda2-mode))
;; (modify-coding-system-alist 'file "\\.l?agda$" 'utf-8)

;; (add-hook 'agda2-mode-hook 'my-agda2-mode-hook)

;; (defun my-agda2-mode-hook ()
;;   (font-lock-mode t)
;;   (set-input-method 'TeX)
;;   (local-set-key [f9]     'agda2-load)
;; ;  (lambda nil
;; ;    (require 'quail)
;; ;    (set-input-method 'TeX)
;; ;    )
;; )

(eval-after-load "quail/latin-ltx"
  '(mapc (lambda (pair)
	   (quail-defrule (car pair) (cadr pair) "TeX"))
         '(("\\comp" "∘")
           ("\\[[" "⟦") ("\\]]" "⟧")
					; If you find it awkward to write comments using the TeX input
					; method the following bindings may make life more bearable
					; for you:
           ("--" ["--"]) ("---" ["---"])
					; Add more keybindings here.
           ("\\nat" "ℕ")
           )))
