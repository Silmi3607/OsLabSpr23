for i in {1..5}; do
mkdir "folder_0$i"
for j in {1..2}; do
cd "folder_0$i"
mkdir "0$j"
touch "0$j"/test.txt
date > "0$j"test.txt
cd ..
done 
done
