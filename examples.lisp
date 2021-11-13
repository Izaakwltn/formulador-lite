;;;;examples.lisp

(in-package :formulador-lite)

;;;;working through the examples from formulador's readMe:

(simple-draw "x/y") ;or (simple-draw "[x/y]")

(simple-draw "[[x/y] + [w/[u+v]]] / [[p+q] / [r + [1/s]]]")

(simple-draw "1/[[1/h] + [1/a] + [1/r] + [1/m] + [1/o] + [1/n] + [1/i] + [1/c]]")


;;;;basic formula list:

FORMULADOR-LITE> (simple-draw "[c^2] = [a^2] + [b^2]")
#<FORMULADOR:CANVAS 
+------------------+
|   2      2      2|
||c|  = |a|  + |b| |
+------------------+
with 15 defined regions>

FORMULADOR-LITE> (simple-draw "y = mx + b")
#<FORMULADOR:CANVAS 
+----------------------+
| |y|  =  |mx|  +  |b| |
+----------------------+
with 6 defined regions>
