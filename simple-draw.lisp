;;;;simple-draw.lisp

(in-package :formulador-lite)


;(defun s-draw (formula-string)
 ; (block-cycle (block-list (lex-line formula-string))))

(defun simple-draw (formula-string)
  "Given a formula-string, returns pretty-printed formulador formula."
  (formulador::draw
   (eval (first (block-cycle (block-list (lex-line formula-string)))))))
