;;; Java ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'my-compile)

(add-hook 'java-mode-hook 'my-java-mode-hook)

; Konfigurera Java-mode för buffer.
(defun my-java-mode-hook ()
  ; Values for compiling files.
  (set (make-local-variable 'my-compile-file-format) "javac %s")
  ; Turn on syntax highlight.
  (font-lock-mode)
  ; Turn on I-menu.
  (imenu-add-menubar-index)
  ; Running 'static main' of current class.
  (local-set-key [C-f9]  'java-run-curr-buff)
)

(defun java-run-curr-buff ()
  "Runs the current class's main function."
  (interactive)
  (compile (format "java %s" (car (split-string (file-name-nondirectory (buffer-file-name)) "[.]"))))
)
