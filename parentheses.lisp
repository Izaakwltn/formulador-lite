;;;;parentheses.lisp
(in-package :formulador-lite)


(defun deep-length (list)
  "Recursevile finds the total length of atoms in a list"
  (cond ((null list) 0)
	((atom list) 1)
	(t (+ (deep-length (car list))
	      (deep-length (cdr list))))))

(defun make-parens-group (lexed-list)
  "Given a list following a left-paren, returns all items contained within the parenthetical."
  (cond ((detect-end-paren lexed-list) nil)
	((detect-paren lexed-list)
	 (cons (cons 'formulador::parens-box (first (make-parens-group (rest lexed-list))))
	       (make-parens-group
		(nthcdr (deep-length (make-parens-group (rest lexed-list)))
			lexed-list))))
	((detect-asm-chain lexed-list)
	 (cons (cons 'formulador::glue (asm-chain lexed-list))
	       (make-parens-group
		(nthcdr (deep-length (asm-chain lexed-list))
			lexed-list))))
	((detect-frac lexed-list)
	 (cons (frac-group lexed-list)
	       (make-parens-group (rest (rest (rest lexed-list))))))
	((detect-asm-chain lexed-list)
	 (cons (cons 'formulador::glue (asm-chain lexed-list))
	       (make-parens-group
		(nthcdr (+ 1 (deep-length (asm-chain lexed-list)))
			lexed-list))))
	(t (cons (first lexed-list)
		 (make-parens-group (rest lexed-list))))))

;(;defun make-parens-group (lexed-list)
 ; (cond ((detect-end-paren lexed-list) nil)
;	(t (cons (first lexed-list)
;		 (make-parens-group (rest lexed-list))))))

;(defun deep-length (list)
;  "Finds the total length of atoms in a list"
;  (cond ((null list) 0);
;	((atom list) 1)
;	(t (+ (deep-length (car list))
;	      (deep-length (cdr list))))))

(defun make-parens-list (lexed-list)
  "Goes through the lexed list and converts everything to parenthetical groups."
  (cond ((null lexed-list) nil)
	((detect-paren lexed-list)
	 (cons (list ':unit
		     (list 'formulador::parens-box (first (make-parens-group (rest lexed-list)))))
	       (make-parens-list
		(nthcdr (deep-length (make-parens-group (rest lexed-list)))
			lexed-list))))
	(t (cons (first lexed-list) (make-parens-list (rest lexed-list))))))

;;;;test
;(formulador::draw (eval (cadar (make-parens-list (lex-line "(1/2)")))))

					;bigger test:
;(loop for i in (make-parens-list (lex-line "(1/2) + (3/4)"))
 ;     collect (cdr i))





