;;;;unit-detection.lisp
;;;;
(in-package :formulador-lite)
;;;;------------------------------------------------------------------------
;;;;Formula unit detection:
;;;;------------------------------------------------------------------------
(defun detect-brack (lexed-line)
  "Detects the beginning of a bracketed block."
  (equal (car (first lexed-line)) ':left-brack))

(defun brack-length (lexed-line)
  "Determines the number of elements before the end of a bracketed block."
  (loop for i in lexed-line
	until (equal (car (first lexed-line)) ':right-brack)
	sum 1 into length
	finally (return (- length 1))))

(defun detect-end-brack (lexed-line)
  "Detects the end of a bracketed block."
  (equal (car (first lexed-line)) ':right-brack))

(defun detect-paren (lexed-line)
  "Detects whether there is a parenthesis group."
  (equal (car (first lexed-line)) ':left-paren))

(defun detect-end-paren (lexed-line)
  "Detects the closing parenthesis for a parenthesis group."
  (equal (car (first lexed-line)) ':right-paren))

(defun detect-asm-chain (lexed-line)
  "Detects whether the first object is a member of an add/subtract/multiply chain."
  (member (cdr (second lexed-line)) '(= + - * )))

(defun detect-asm-chain-end (lexed-line)
  "Detects whether the asm chain should end."
  (and (not (member (cdr (first lexed-line)) '(= + - * )))
       (not (member (car (first lexed-line)) '(:number :variable :block)))))

(defun detect-frac (lexed-line)
  "Detects whether there is a fraction."
  (equal (cdr (second lexed-line)) ':/))

(defun detect-exp (lexed-line)
  "Detects whether there is an exponent."
  (equal (car (second lexed-line)) ':exponent))

(defun detect-block (blocked-line)
  "Detects whether there is a unit."
  (equal (car (first blocked-line)) ':block))

;;;;------------------------------------------------------------------------
