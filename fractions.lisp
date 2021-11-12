;;;;fractions.lisp

(in-package :formulador-lite)

(defun frac-group (lexed-list)
  "Generates a (frac-box from the first three elements of a lexed list."
  (list 'formulador::frac-box
	(if (equal (car (first lexed-list)) ':block)
            (list 'formulador::row-box (list 'list (car (block-eval (second (first lexed-list))))))
	    (list 'formulador::box (write-to-string (cdr (first lexed-list)))))
	(if (equal (car (third lexed-list)) ':block)
	    (list 'formulador::row-box (list 'list (car (block-eval (second (third lexed-list))))))
	    (list 'formulador::box (write-to-string (cdr (third lexed-list)))))))

;(defun frac-blocks (blocked-list)
;  (list 'formulador::frac-box (block-eval...
  
;;;if first or third are :units, instead return the cdr

