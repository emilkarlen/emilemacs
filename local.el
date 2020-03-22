;; If using locally installed libraries, the load-path of these must be known
;; to emacs to be able to compile files that depend on these (using elisp-comp
;; which is installed by autotoolset).
;;
;; This file should be installed in
;;   /usr/share/emacs/site-lisp/site-start.d

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
