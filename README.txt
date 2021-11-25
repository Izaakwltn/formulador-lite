# formulador-lite
A simple input interface for @stylewarning's formulador
#### First, enter into drawing mode:
(start-drawing)
#### and enter your formula below, with no spaces:
x/y
#<CANVAS 
+---+
| X |
|---|
| Y |
+---+
with 3 defined regions>

#### or try another formula:
  
[a^2]+[b^2]=[c^2]
#<CANVAS 
+------------+
| 2    2    2|
|A  + B  = C |
+------------+
with 15 defined regions>
  
#### and one more:
  
1/[[1/h]+[1/a]+[1/r]+[1/m]+[1/o]+[1/n]+[1/i]+[1/c]]
#<CANVAS 
+-----------------------------------------------+
|                       1                       |
|-----------------------------------------------|
|  1     1     1     1     1     1     1     1  |
| --- + --- + --- + --- + --- + --- + --- + --- |
|  H     A     R     M     O     N     I     C  |
+-----------------------------------------------+
with 35 defined regions>

#### When you're ready to finish drawing, simply type:
stop
Drawing terminated
NIL
####-----------------------------------------------------
---------------------------------------------------------
#### --------------------------------------------------
FORMULADOR-LITE> (simple-draw "x/y")
#<FORMULADOR:CANVAS 
+-----+
| |x| |
|-----|
| |y| |
+-----+

### In order to execute more complex formulas, apply brackets to units within a larger operation:

FORMULADOR-LITE> (simple-draw "[(1/2)]^2")
#<FORMULADOR:CANVAS 
+--------+
|       2|
|/  1  \ |
|| --- | |
|\  2  / |
+--------+
with 7 defined regions>

FORMULADOR-LITE> (simple-draw "[x/y]+[w/[u+v]]")
#<FORMULADOR:CANVAS 
+---------------+
| |x|     |w|   |
|-----+---------|
| |y|   |u|+|v| |
+---------------+

FORMULADOR-LITE> (simple-draw "1/[[1/h] + [1/a] + [1/r] + [1/m] + [1/o] + [1/n] + [1/i] + [1/c]]")
#<FORMULADOR:CANVAS 
+---------------------------------------------------------------+
|                               1                               |
|---------------------------------------------------------------|
|   1       1       1       1       1       1       1       1   |
| ----- + ----- + ----- + ----- + ----- + ----- + ----- + ----- |
|  |h|     |a|     |r|     |m|     |o|     |n|     |i|     |c|  |
+---------------------------------------------------------------+
