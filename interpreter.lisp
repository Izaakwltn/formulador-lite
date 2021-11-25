;;;;interpreter.lisp

(in-package :formulador-lite)

(defvar drawing-in-progress nil)

(defun command-input ()
  (let ((input (read)))
  (if (equal (princ-to-string input) "STOP")
      (progn (setq drawing-in-progress nil)
	     (princ "Drawing terminated"))
      (princ (simple-draw (princ-to-string input))))))

(defun start-drawing ()
  (setq drawing-in-progress t)
  (loop while drawing-in-progress
	do (progn (command-input) (terpri))))
	   
