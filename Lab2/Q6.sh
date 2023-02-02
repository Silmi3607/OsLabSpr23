#!/bin/bash
N=$1
a=0
b=1
for (( i=0; i<N; i++ )); do
echo -n "$a,"
var=$((a + b))
a=$b
b=$var
done
