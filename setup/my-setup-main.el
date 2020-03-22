;; Main file for my personal setup.

(require 'compile)

(setq compilation-scroll-output t)

(font-lock-mode t)     ; Syntax-färglägg.
(column-number-mode t) ; Visa kolumn.
(show-paren-mode t)    ; Highlight matching parenthesis.
(blink-cursor-mode 0)  ; Markören icke-blinkande.
(setq-default truncate-lines t)
;; (setq-default show-trailing-whitespace t)

; General stuff.
(load "my-keybindings")
(load "my-windowframe")
(load "my-comment")
(load "my-outline")

; Programming modes.
;; (load "my-agda")
;; (load "my-haskell")
(load "my-python")
(load "my-cpp")
(load "my-java")
(load "my-shell-script")
(load "my-latex")
