#!/bin/bash

Gpu_count=6 #Enter Your number of GPUs

str=`cat /var/run/ethos/stats.file | grep -i '^mem:' `
IFS=' ' # space is set as delimiter
read -ra ADDR <<< "$str" # str is read into an array as tokens separated by IFS
for i in "${ADDR[@]}";
do # access each element of array
        if [ "$i" == "300" ]; then
                sudo /sbin/reboot
#echo "$i"
fi
done


read var1 < /var/run/ethos/gpucount.file
if [ "$var1" == "$Gpu_count" ]; then
        echo $var1 adapters
else
        sudo /sbin/reboot
fi

exit 0
