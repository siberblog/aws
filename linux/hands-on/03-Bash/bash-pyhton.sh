#!/bin/bash

num1=2121
num2=2222

code=$(cat<<END
print($num1)
print($num2) 
print($num1 + $num2)
END
)

echo "---------------"

python -c "$code"



