#!/bin/bash

expr 30 + 10

expr 30 - 10

expr 30 / 10

# using * directly will not work in bash because * have it's predifined work. Therefore we have to add \ infront of * .
expr 30 \* 10

var1=100
var2=50

expr $var1 + $var2
expr $var1 - $var2
