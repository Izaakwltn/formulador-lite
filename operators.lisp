;;;;operators.lisp

(in-package :formulador-lite)

;;;;------------------------------------------------------------------------
;;;;Exponents
;;;;------------------------------------------------------------------------

(defun make-exponent (lexed-list)
  (list 'formulador::script-box
	(if (equal (car (first lexed-list)) ':block)
            (car (block-eval (second (first lexed-list))))  
	    (list 'formulador::box
		  (write-to-string (cdr (first lexed-list)))))
	':superscript
	(if (equal (car (third lexed-list)) ':block)
	    (car (block-eval (second (third lexed-list)))) 
	    (list 'formulador::box
		  (write-to-string (cdr (third lexed-list)))))))

;;;;------------------------------------------------------------------------
;;;;Fractions
;;;;------------------------------------------------------------------------

(defun frac-group (lexed-list)
  "Generates a (frac-box from the first three elements of a lexed list."
  (list 'formulador::frac-box
	(if (equal (car (first lexed-list)) ':block)
            (list 'formulador::row-box
		  (list 'list
			(car (block-eval (second (first lexed-list))))))
	    (list 'formulador::box
		  (write-to-string (cdr (first lexed-list)))))
	(if (equal (car (third lexed-list)) ':block)
	    (list 'formulador::row-box
		  (list 'list
			(car (block-eval (second (third lexed-list))))))
	    (list 'formulador::box
		  (write-to-string (cdr (third lexed-list)))))))

;;;;------------------------------------------------------------------------
;;;;Addition, subtraction, and  multiplication chains
;;;;------------------------------------------------------------------------

(defun asm-chain (lexed-list)
  (cond ((or (detect-asm-chain-end lexed-list)
	     (detect-end-paren lexed-list)
	     (detect-end-brack lexed-list))
	 nil)
	((detect-block lexed-list)
	 (cons (car (block-eval (cadr (first lexed-list))))
	       (asm-chain (rest lexed-list))))
	(t (cons
	    (list 'formulador::box
		  (concatenate 'string
			       " "
			       (write-to-string
				(cdr (first lexed-list)))
			       " "))
	    (asm-chain (rest lexed-list))))))

;;;;------------------------------------------------------------------------
