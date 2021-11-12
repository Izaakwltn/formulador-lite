;;;;asm-chains.lisp

(in-package :formulador-lite)

;;;Addition, subtraction, and multiplication chains

(defun asm-chain (lexed-list)
  (cond ((or (detect-asm-chain-end lexed-list)
	     (detect-end-paren lexed-list)
	     (detect-end-brack lexed-list))
	 nil)
	((detect-block lexed-list)
	 (cons (car (block-eval (cadr (first lexed-list))))
	       (asm-chain (rest lexed-list))))
	(t (cons (list 'formulador::box
		       (concatenate 'string " " (write-to-string (cdr (first lexed-list))) " "))
		 (asm-chain (rest lexed-list))))))

;;;;loop through the lexed-list until the 


	 ;;;[1 + 2 + 3]
