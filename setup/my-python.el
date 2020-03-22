;; Python related stuff

(require 'compile)

(require 'python)
(require 'my-outline)

(add-hook 'python-mode-hook 'my-python-mode-hook)

; comment-padding
; (let ((n                '(length sCommentStart))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; - simptest -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun compile-simptestcase (sTestCaseFile)
  "Compile by running simptestcase -v --m4 on the given file."
  (interactive "fSimptest testcase file: ")
  (compile (concat "simptestcase -v --m4 " sTestCaseFile))
)

(defun compile-simptestcase-exec (sTestCaseFile)
  "Compile by running simptestcase --exec --m4 on the given file."
  (interactive "fSimptest m4 testcase file: ")
  (compile (concat "simptestcase -4e " sTestCaseFile))
)

(defun compile-simptestcase-exec-ph (sTestCaseFile)
  "Compile by running simptestcase --exec --m4 on the given file (and replacing photo related paths)."
  (interactive "fSimptest m4 testcase file: ")
  (let
      ((sSedPgm "s:/home/karlen/devel/photography/trunk/photobase/tests/scripts/../../src/::"))
    (compile (concat "simptestcase -4e " sTestCaseFile " 3>&2 2>&1 1>&3 "
		     "| sed " sSedPgm " 3>&2 2>&1 1>&3"))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; - Doxygen -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun doxy-insert-and-move-point (s n)
  "Inserts a (Doxygen) tag and moves point for easy filling."
 (insert-before-markers "@")
 (insert-before-markers s)
 (backward-char n)
 )

(defun doxy-projdb-requirement ()
  "Inserts a Doxygen tag for projdb_requirement."
 (interactive)
 (doxy-insert-and-move-point "projdb_requirement{}" 1)
 )

(defun doxy-py-param ()
  "Inserts a Doxygen tag for Python parameter."
 (interactive)
 (doxy-insert-and-move-point "py_param{,}" 2)
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; - Section comment -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun sectioncomment-file (sHeader)
  "Inserts a comment that servers as a file section header.  Asks the user for the header."
 (interactive "*sHeader: ")
 (let*
     ((sCommentStart (comment-string-strip comment-start t t))
      (sCommentEnd   (comment-string-strip comment-end   t t))
      (sExtraSpace   (if (eq (sectioncomment-array-last comment-start) ?\ ) "" " "))
      (chCommentChar (sectioncomment-array-last sCommentStart))
      (nNumChars     (- (- 79 (length sCommentStart)) (length sCommentEnd)) )
      )
   (insert-before-markers sCommentStart)
   (insert-char           chCommentChar nNumChars nil)
   (insert-before-markers sCommentEnd)

   (insert-char ?\n  1 nil)
   (insert-before-markers comment-start)
   (insert-before-markers sExtraSpace)
   (insert-before-markers "- ")
   (insert-before-markers sHeader)
   (insert-before-markers " -")
   (insert-before-markers comment-end)
   (insert-char ?\n  1 nil)

   (insert-before-markers sCommentStart)
   (insert-char           chCommentChar nNumChars nil)
   (insert-before-markers sCommentEnd)

   (insert-char ?\n  1 nil)
   )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; - python-mode-hook -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun my-python-mode-hook ()
  (imenu-add-menubar-index)
  ; comment-region will also make comments of empty lines.
  (setq comment-empty-lines t)
  (local-set-key [C-tab]           'complete-symbol)
  (local-set-key [f9]              'python-check)
  (local-set-key [?\C-c \C-up]     'python-beginning-of-block)
  (local-set-key [?\C-c \C-down]   'python-end-of-block)
;  (define-key python-mode-map "\C-c\C-s"     'compile-simptestcase-exec-ph)
  (define-key python-mode-map "\C-c\C-x\C-p" 'compile-simptestcase-exec-ph)
  (define-key python-mode-map "\C-c\C-x\C-e" 'compile-simptestcase-exec)
  (define-key python-mode-map "\C-c\C-x\C-t" 'compile-simptestcase)
  (local-set-key [S-C-f9]          'compile-simptestcase-exec)
  (local-set-key [S-f9]            'compile-simptestcase-exec-ph)

  (define-key python-mode-map "\C-c\C-d\C-r" 'doxy-projdb-requirement)
  (define-key python-mode-map "\C-c\C-d\C-p" 'doxy-py-param)

  (outline-minor-mode)
  (my-outline-mode-hook)
;  (my-outline-minor-mode-hook)
  (setq compilation-scroll-output t)
  )

; (add-hook 'python-mode-hook 'imenu-add-menubar-index)
