;;; C++ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'my-compile)

(add-hook 'c++-mode-hook 'my-cpp-mode-hook)

; Konfigurera C++-mode för buffer.
(defun my-cpp-mode-hook ()
  ; Values for compiling files.
  (set (make-local-variable 'my-compile-file-format) "g++ -c %s")
  (set (make-local-variable 'my-make-file-format)    "g++ -o %s %s")
  ; Turn on syntax highlight.
  (font-lock-mode)
  ; Turn on I-menu.
  (imenu-add-menubar-index)
)
