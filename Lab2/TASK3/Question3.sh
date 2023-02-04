#!/bin/bash

for i in {1..5}
do
for j in {1..2}
do
mkdir "test0$i"
mkdir "test0$i"/"0$j"
touch "test0$i"/"0$j"/test.txt
date > "test0$i"/"0$j"/test.txt
done 
done 

for i in {1..5}
do
for j in {1..2}
do 
cat "test0$i"/"0$j"/test.txt >> merge.txt
done 
done 
