;;;;lexical-analysis.lisp

(in-package :formulador-lite)

;;;;------------------------------------------------------------------------
;;;;Defining tokens
;;;;------------------------------------------------------------------------

(deftype token ()
  '(cons keyword t))

(defun tok (type &optional val)
  (cons type val))

;;;;------------------------------------------------------------------------
;;;;The Analysis
;;;;------------------------------------------------------------------------

(alexa:define-string-lexer formulexer
  "A lexical analyzer for formulador input."
  ((:oper   "[=+*-]")
   (:num  "\\d+")
   (:symb "[A-Za-z][A-Za-z0-9_]*"))
  ("{{OPER}}" (return (tok :operator (intern $@))))
  ("{{NUM}}"  (return (tok :number (parse-integer $@))))
  ("{{SYMB}}" (return (tok :variable (intern $@))))
  ("\\/"      (return (tok :frac (intern $@ 'keyword))))
  ("\\^"      (return (tok  :exponent)))
  ("\\("      (return (tok :left-paren)))
  ("\\)"      (return (tok :right-paren)))
  ("\\["      (return (tok :left-brack)))
  ("\\]"      (return (tok :right-brack)))
  ("\\s+"     nil))

(defun lex-line (string)
  "Breaks down a formula string into tokens."
  (loop :with lexer := (formulexer string)
	:for tok := (funcall lexer)
	:while tok
	:collect tok))
