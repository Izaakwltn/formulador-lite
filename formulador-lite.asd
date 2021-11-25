;;;; formulador-lite.asd
;;;;
;;;; Copyright (c) 2021 Izaak Walton
;;;; Based on Robert Smith's Formulador

(asdf:defsystem #:formulador-lite
  :version "0.0.1"
  :author "Izaak Walton <izaakw@protonmail.com"
  :license "GNU General Purpose License"
  :description "A simple-input translater for Formulador's pretty printer"
  :depends-on (#:formulador #:alexa)
  :serial t
  :components ((:file "package")
	       (:file "lexical-analysis")
	       (:file "unit-detection")
	       (:file "blocks")
	       (:file "parentheses")
	       (:file "operators")
	       (:file "simple-draw")
	       (:file "interpreter"))
	       
