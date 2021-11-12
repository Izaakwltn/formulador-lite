;;;;exponents.lisp

(in-package :formulador-lite)

(defun make-exponent (lexed-list)
  (list 'formulador::script-box
	(if (equal (car (first lexed-list)) ':block)
            (car (block-eval (second (first lexed-list))))  
	    (list 'formulador::box (write-to-string (cdr (first lexed-list)))))
	':superscript
	(if (equal (car (third lexed-list)) ':block)
	    (car (block-eval (second (third lexed-list)))) 
	(list 'formulador::box (write-to-string (cdr (third lexed-list)))))))

					;test:
;FORMULADOR-LITE> (simple-draw "[(1/2)]^3")
;#<FORMULADOR:CANVAS 
;+--------+
;|       3|
;|/  1  \ |
;|| --- | |
;|\  2  / |
;+--------+
;with 7 defined regions>
