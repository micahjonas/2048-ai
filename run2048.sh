# Command to run the sh script in the background:
#
# nohup ~/expectimax/2048-ai/run2048.sh 10 25 run2.txt > log2.txt 2>&1&
# echo $! > save_pid.txt
# If necessary use kill -9 `cat save_pid.txt`

echo "start eval" > $3

count=$1
while [ $count -lt $2 ]
do
  start_time=`date +%s`
  count=`expr $count + 1`
  echo "run: $count" >> $3
  ./bin/2048 $3
  end_time=`date +%s`
  echo "execution time was `expr $end_time - $start_time` s." >> $3
done
