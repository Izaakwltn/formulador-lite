;;;;blocks.lisp

(in-package :formulador-lite)

(defun make-block (lexed-list)
  "Builds a block as detected."
  (cond ((detect-end-brack lexed-list) nil)
	((detect-brack lexed-list)
	 (cons (list ':block (make-block (rest lexed-list)))
	       (make-block (nthcdr (- (deep-length (make-block (rest lexed-list))) 1) lexed-list))))
	(t (cons (first lexed-list)
		 (make-block (rest lexed-list))))))

(defun deep-length (list)
  "Recursevile finds the total length of atoms in a list"
  (cond ((null list) 0)
	((atom list) 1)
	(t (+ (deep-length (car list))
	      (deep-length (cdr list))))))

(defun block-list (lexed-list)
  (cond ((null lexed-list) nil)
	((detect-end-brack lexed-list) (block-list (rest lexed-list)))
	((detect-brack lexed-list)
	 (cons (list ':block (make-block (rest lexed-list)))
	       (block-list  (nthcdr (- (deep-length (make-block (rest lexed-list))) 1) lexed-list))))
	(t (cons (first lexed-list) (block-list (rest lexed-list))))))

;test:
;FORMULADOR-LITE> (block-list (lex-line "[a+b]/[c+d]"))
;((:BLOCK ((:VARIABLE . |a|) (:OPERATOR . +) (:VARIABLE . |b|))) (:FRAC . :/)
; (:BLOCK ((:VARIABLE . |c|) (:OPERATOR . +) (:VARIABLE . |d|))))

;;;;test examples desired input:

;"x/y"

; "[ [x / y]  + [w / [u + v]]] / [[p + q] / [r + [1 / s]]]"
(defun block-eval (block-unit)
  "Evaluates a block."
  (cond ((null block-unit) nil)
	((detect-paren block-unit)
	 (cons (cons 'formulador::parens-box
		     (make-parens-group (rest block-unit)))
	       (block-eval (nthcdr (+ 1 (deep-length (make-parens-group (rest block-unit))))
			block-unit))))
	((detect-power block-unit)
	 (cons (make-exponent block-unit)
	       (block-eval (rest (rest (rest block-unit))))))
	((detect-frac block-unit)
	 (cons (frac-group block-unit)
	       (block-eval (rest (rest (rest block-unit))))))
	((detect-asm-chain block-unit)
	 (cons (cons 'formulador::glue (asm-chain block-unit))
	       (block-eval (nthcdr (+ 1 (deep-length (asm-chain block-unit))) block-unit))))
	((detect-block block-unit)
	 (cons (car (block-eval (cadr (first block-unit))))
	       (block-eval
		(nthcdr (+ 1 (deep-length (block-eval (rest block-unit)))) block-unit))))
        (t (cons (first block-unit) (block-eval (rest block-unit))))))

(defun block-cycle (blocked-list)
  "Cycles through a blocked list and evaluates the boxes, in addition to operators and variables."    
  (cond ((null blocked-list) nil)
	((detect-paren blocked-list)
	 (cons (cons 'formulador::parens-box (make-parens-group (rest blocked-list)))
	       (block-cycle (nthcdr (deep-length (make-parens-group (rest blocked-list))) blocked-list))))
	((detect-power blocked-list)
	 (cons (make-exponent blocked-list)
	       (block-cycle (rest (rest (rest blocked-list))))))
	((detect-frac blocked-list)
	 (cons (frac-group blocked-list)
	       (block-cycle (rest (rest (rest blocked-list))))))
	((detect-asm-chain blocked-list)
	 (cons (cons 'formulador::glue (asm-chain blocked-list))
	       (block-cycle (nthcdr (+ 1 (deep-length (asm-chain (rest blocked-list))))
				    blocked-list))))
	((detect-block blocked-list)
	 (cons (car (block-eval (cadr (first blocked-list))))
	       (block-cycle
		(nthcdr (+ 1 (deep-length (block-eval (rest blocked-list)))) blocked-list))))
	(t (cons (first blocked-list)
		 (block-cycle (rest blocked-list))))))

	    



					;test
;FORMULADOR-LITE> (block-cycle (block-list (lex-line "[(1/2)]")))
;(((FORMULADOR:PARENS-BOX
;   (FORMULADOR:FRAC-BOX (FORMULADOR:BOX "1") (FORMULADOR:BOX "2")))))

