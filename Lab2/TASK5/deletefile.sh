#!/bin/bash

for i in {1..5}
do
for j in {1..2}
do
rm "test0$i"/"0$j"/test.txt
done 
done 
