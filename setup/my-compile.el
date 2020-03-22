;;
;; Variables, functions and key-bindings for compilation.
;; Provides "my-compile".
;;
;; Individual modes should set `my-compile-file-format'
;; and possibly also `my-make-file-format'.
;; These are used by `save-and-compile-curr-buff' and `save-and-make-curr-buff'.
;;

(provide 'my-compile)

(defvar my-compile-file-format
  "echo Emacs variable my-compile-file-format not set; exit 1"
  "The format string for compiling the current buffer (usually using F9).
  The name of the current buffer is inserted where the %s appears in the string.
  A good idea is to set this variable and make it local in programming mode hooks.
  As in
  (set (make-local-variable 'my-compile-file-format) \"ghc -c %s\")"
)

(defvar my-make-file-format
  "echo Emacs variable my-make-file-format not set; exit 1"
  "The format string for compiling and making the current buffer.
  Used when the current buffer serves as a main program and no extra link information
  is needed by the \"maker\".  Usefull for GHC which has a --make flag.
  The string should accept two printf arguments: the name of the target
  executable and the name of the current file.
  A good idea is to set this variable and make it local in programming mode hooks.
  As in
  (set (make-local-variable 'my-make-file-format) \"ghc --make -o %s %s\")"
)

; Compile or make current buffer using the variables above.
(global-set-key [f9]    'save-and-compile-curr-buff)
(global-set-key [C-f9]  'save-and-make-curr-buff)
; Compile with make.
(global-set-key [f10]   (lambda () (interactive) (compile "make -k")))
; Recompile (compile using last compile command line).
(global-set-key [S-f10] (lambda () (interactive) (compile compile-command)))
; Navigating to errors.
(global-set-key [f11]   'next-error)
(global-set-key [S-f11] 'previous-error)

(defun buffer-file-base-name ()
  (file-name-nondirectory (buffer-file-name))
)

(defun save-and-compile-curr-buff ()
  "Compiles the current buffer using with the command specified by my-compile-file-format."
  (interactive)
  (save-buffer)
  (compile (format my-compile-file-format (buffer-file-base-name)))
)

(defun save-and-make-curr-buff ()
  "Makes the current buffer using with the command specified by my-make-file-format."
  (interactive)
  (save-buffer)
  (compile (format my-make-file-format
		   (file-name-sans-extension (buffer-file-base-name))
		   (buffer-file-base-name)))
)
