;;;;simple-draw.lisp

(in-package :formulador-lite)

;(defun simple-draw (command)
;  (formulador::draw (eval (eval command))))


(defun s-draw (formula-string)
  (block-cycle (block-list (lex-line formula-string))))

(defun simple-draw (formula-string)
  (formulador::draw (eval (first (s-draw formula-string)))))
