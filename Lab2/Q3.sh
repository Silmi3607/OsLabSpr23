#!/bin/bash
for i in {1..5}; do
for j in {1..2}; do
cd "folder_0$i"
cat "0$j"/test.txt >> ../merged.txt
cd ../
done
done 
