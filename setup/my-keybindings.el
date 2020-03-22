;; Global key bindings

;; backslash
(global-set-key (kbd "§")  (lambda () (interactive) (insert "\\")))
(global-set-key (kbd "\\") (lambda () (interactive) (insert "§")))

;; alignment
(global-set-key (kbd "C-x a r") 'align-regexp)

;; grep
(global-set-key [C-f8] 'grep)
(global-set-key [f8]   'grep-find)

;; fill
(global-set-key [f4]   'auto-fill-mode)
(global-set-key [C-f4] 'fill-region)
;; (global-set-key [C-f4] 'fill-individual-paragraphs)

;; Macros
(global-set-key [f12]    'call-last-kbd-macro)
(global-set-key [S-f12]  'kmacro-start-macro-or-insert-counter)
(global-set-key [C-f12]  'kmacro-end-or-call-macro)

;; Help
(global-set-key [f1] 'manual-entry)

;; Functions
(global-set-key [C-M-up]       'beginning-of-defun)
(global-set-key [C-M-down]     'end-of-defun)

;; Paragraphs
(global-set-key [?\M-ö]   'backward-paragraph)
(global-set-key [?\M-\C-m]   'backward-paragraph)

(global-set-key [?\M-ä]   'forward-paragraph)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; - White space and line join-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key [?\M-+] 'delete-horizontal-space)
(global-set-key [?\M-?] 'delete-space-forward)

(global-set-key [?\S-\C-j] '(lambda () (interactive) (join-lines 1)))
(global-set-key [?\M-\C-å] '(lambad () (interactive) (join-lines 1) (end-of-line)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; - sexp and parenthasis -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Parenthasis
;; (Remember: predefined MC-SPC sets mark at other end of expr.)
(global-set-key [C-M-left]   'backward-sexp)
(global-set-key [C-M-right]  'forward-sexp)
(global-set-key [C-M-delete] 'backward-kill-sexp)
(global-set-key [C-M-k]      'kill-sexp)
;; (global-set-key [?\C-\M-\}] 'delete-pair) ;; Deletes parenthesis around sexp ttr.
;; (global-set-key [?\C-\M-ö]  'delete-pair) ;; Deletes parenthesis around sexp ttr.
(global-set-key [?\M-\C-,]   'delete-pair) ;; Deletes parenthesis around sexp ttr.
;; Inserting pairs of parentheses.
;; ("transient-mark" so insert around region.)
(global-set-key [?\M-\}]    (lambda () (interactive) (insert-pair 0 ?\{ ?\})))
(global-set-key [?\M-\]]    (lambda () (interactive) (insert-pair 0 ?\[ ?\])))
(global-set-key [?\M-\"]    (lambda () (interactive) (insert-pair 0 ?\" ?\")))
(global-set-key [?\M-\']    (lambda () (interactive) (insert-pair 0 ?\' ?\')))

;; Mark sexp and copy
(global-set-key [?\M-\C-w]   (lambda () (interactive) (mark-sexp) (kill-ring-save (point) (mark))))



;; Buffer menu
(global-set-key (kbd "C-x C-b")  (lambda () (interactive) (buffer-menu 1)))

;; (global-set-key "\C-x "        (lambda ()  (interactive) (switch-to-buffer nil)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; - Scrolling -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key [f6]           (lambda () (interactive) (recenter 0)))

(global-set-key [C-up]         (lambda () (interactive) (scroll-down 1)))
(global-set-key [C-down]       (lambda () (interactive) (scroll-up   1)))

(global-set-key [S-M-up]       (lambda () (interactive) (scroll-other-window -1)))
(global-set-key [S-M-down]     (lambda () (interactive) (scroll-other-window  1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; - Bookmarks -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key [S-f7]   (lambda () (interactive)
			   (bookmark-set (file-name-nondirectory (buffer-name)))))
(global-set-key [f7]     (lambda ()
			   (interactive)
			   (bookmark-jump (file-name-nondirectory (buffer-name)))
			   (recenter)))
(global-set-key [C-f7]   'bookmark-set)
(global-set-key [M-f7]   'bookmark-jump)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; - Tags -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key [?\C-.] 'pop-tag-mark) ; Default M-*


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; - functions -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun join-lines (num-spaces-between-lines)
  "Moves the following line to the end of the current line."
  (interactive)
  (delete-indentation t)
  (just-one-space)
  ; If following text is beginning of comment - remove it and then
  ; just-one-space.
  (let*
      (
       (nComLen (length comment-start))
       (sNext   (buffer-substring (point) (+ (point) nComLen)))
       )
    (when (string= sNext comment-start)
      (delete-char nComLen)
      (just-one-space num-spaces-between-lines))
    )
  )

(defun delete-space-forward ()
  (interactive)
  (save-excursion
    (looking-at "[[:space:]]+")
    (replace-match "")
    )
  )
