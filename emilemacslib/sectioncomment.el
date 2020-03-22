;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copyright 2009 Emil Karlen						 ;;
;; 									 ;;
;; This program is free software: you can redistribute it and/or modify	 ;;
;; it under the terms of the GNU General Public License as published by	 ;;
;; the Free Software Foundation, either version 3 of the License, or	 ;;
;; (at your option) any later version.					 ;;
;; 									 ;;
;; This program is distributed in the hope that it will be useful,	 ;;
;; but WITHOUT ANY WARRANTY; without even the implied warranty of	 ;;
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the	 ;;
;; GNU General Public License for more details.				 ;;
;; 									 ;;
;; You should have received a copy of the GNU General Public License	 ;;
;; along with this program.  If not, see <http://www.gnu.org/licenses/>. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'newcomment)

(provide 'sectioncomment)

(defun sectioncomment-array-last (a)
  (aref a (- (length a) 1))
)

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


(defun sectioncomment-defun (sHeader &optional nLevel)
  "Inserts a comment that servers as a defun section marker.  Asks the user for the header.
nLevel is the number of extra comment characters to surround the heading (default 2)."
 (interactive "*sMarker: \nP")
 ;(message "%s" nLevel)
 (let*
     ((sCommentStart (comment-string-strip comment-start t t))
      (sCommentEnd   (comment-string-strip comment-end   t t))
      (chCommentChar (sectioncomment-array-last sCommentStart))
      (nExtra        (if nLevel (abs nLevel) 2))
      (nExtraEnd     (+ nExtra (- (length sCommentStart) (length sCommentEnd))))
      )
   (insert-before-markers     sCommentStart)
   (insert-char chCommentChar nExtra nil)

   (insert-before-markers " ")
   (insert-before-markers sHeader)
   (insert-before-markers " ")

   (insert-char chCommentChar nExtraEnd nil)
   (insert-before-markers     sCommentEnd)
   )
)


(defun sectioncomment-defun-indent-newline (sHeader &optional nLevel)
  "Runs command back-to-indentation, sectioncomment-defun,  newline-and-indent."
 (interactive "*sMarker: \nP")
 (back-to-indentation)
 (sectioncomment-defun sHeader nLevel)
 (newline-and-indent)
)
