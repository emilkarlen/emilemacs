;; Stuff related to comments.

(require 'sectioncomment)

(global-set-key [f3]       'comment-or-uncomment-region)
(global-set-key [C-f3]     'sectioncomment-file)
(global-set-key [M-f3]     'sectioncomment-defun)
(global-set-key [M-return] 'sectioncomment-defun-indent-newline)
