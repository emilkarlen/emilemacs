;; Stuff related to windows and frames.

(require 'windmove)

;; Now, the stuff to move between frames and windows

;; Switching between windows using [s]-<arrow-key>
;; [s] is the 'Microsoft' key
;; From lists.gnu.org/archive/html/help-gnu-emacs/2008-04/msg00303.html

;; Customization of windmove.
(windmove-default-keybindings 'shift)
(setq windmove-wrap-around t)

;; Resizing current window
(global-set-key [M-down] (lambda () (interactive) (enlarge-window  1)))
(global-set-key [M-up]   (lambda () (interactive) (enlarge-window -1)))

;; Switching between frames
(global-set-key [S-C-M-right]  'other-frame)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup emacs frames
;; To create the second frame: C-x-5-2
;; To erase the current frame: C-x-5-0

;; (setq default-frame-alist
;;       '(
;;     (top . 0) (left . 841) ;; 841 = (screen resolution/2) + 1
;;     (width . 80) (height . 55)
;;     (font . "10x20") ;; default font
;;     ))

;; Setup the initial frame
;; Parameters specified here supersede the values given in
;; `default-frame-alist'.
;; (setq initial-frame-alist '((left . 0)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
