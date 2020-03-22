;;
;; Functions, variables and key-bindings for shell-script-mode.
;;

(add-hook 'sh-mode-hook 'my-sh-mode-hook)

(defun buffer-file-base-name ()
  (file-name-nondirectory (buffer-file-name))
)

(defun my-sh-mode-hook ()
  (local-set-key [f10]   'shell-save-and-grep-functions)
  (local-set-key [S-f10] 'shell-save-and-grep-functions-sorted)
;  (local-set-key [f3]    'comment-hash-line)
  (set (make-local-variable 'compile-command)
       (concat "./" (buffer-file-base-name)))
)

(defun shell-save-and-grep-functions ()
  "Saves the current buffer and runs a grep for shell functions (^function) on it."
  (interactive)
  (save-buffer)
  (grep (concat "grep -nH ^function " (buffer-file-base-name)))
)

(defun shell-save-and-grep-functions-sorted ()
  "Saves the current buffer and runs a grep for shell functions (^function) on it."
  (interactive)
  (save-buffer)
  (grep (concat "grep -nH ^function " (buffer-file-base-name) " | sort -t : -k 3,3"))
)
