# formulador-lite
A simple input interface for @stylewarning's formulador
### The simplest input consts of only one operation:

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
