;;; Haskell ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'my-compile)

(load "haskell-site-file")

(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
;; ghc-mod
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

(custom-set-variables '(haskell-tags-on-save t))

; Konfigurera Haskell-mode för buffer.
(defun my-haskell-mode-hook ()
  ; Prefix for compiling files.
  (set (make-local-variable 'my-compile-file-format) "ghc -c %s")
  (set (make-local-variable 'my-make-file-format)    "ghc --make -o %s %s")
  ; Haskell doc mode.
  (turn-on-haskell-doc-mode)
  ;(turn-on-haskell-indent)
  (font-lock-mode)
  (imenu-add-menubar-index)

  (local-set-key [C-tab]   'complete-symbol)
  (local-set-key [C-.]     'inferior-haskell-find-definition)
  ; Något inkonsekvent ordning här eftersom -glasgow.. är vanligast ft.
;;   (local-set-key [f9]     'ghc-save-and-compile-curr-buff)
;;   (local-set-key [C-f9]   'ghc-save-and-make-curr-buff)
;;
;;   (local-set-key [f10]    (lambda () (interactive) (compile "make")))
;;   (local-set-key [f10]    (lambda () (interactive) (compile "make jlc")))

;;  (set (make-local-variable 'compile-command)
;;       (concat "ghc -c " (buffer-file-base-name)))
)
