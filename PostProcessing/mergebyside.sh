#!/bin/bash

# This script will grep red-side results from file in order of test (Stress-ng, DD, IPERF, IPMI Tool)

#echo $(date)


#rm -rf REDCLEAN.txt
#rm -rf BLACKCLEAN.txt
#touch REDCLEAN.txt
#touch BLACKCLEAN.txt


# Arrays representing different tests with different tags to the rsyslog server; can easily be added or taken away
declare -a label
label[0]="STRESS_NG"
label[1]="PING_TEST"
label[2]="HDPARM"
label[3]="STREAM_C"
label[4]="IPERF"
label[5]="USB_PASSMARK"
label[6]="IPMITOOL"
label[7]="TAMPER_STATUS"
label[8]="FIBER_FPGA_TEMP"
label[9]="DD_TEST"
label[10]="UPTIME"


for i in ${label[@]}
do
		cat tmp/red/$i.txt >> tmp/REDCLEAN.txt
		echo "buffer line" >> tmp/REDCLEAN.txt
		cat tmp/black/$i.txt >> tmp/BLACKCLEAN.txt
		echo "buffer line" >> tmp/BLACKCLEAN.txt
done

rm -rf tmp/red
rm -rf tmp/black

#echo $(date)

# for i in ${label[@]}
# do
# 	grep "red-1 $i" "$msg_file" >> tmp/red/($i)
# 	grep "black-1 $i" "$msg_file" >> tmp/black/($i)
# done

# for i in ${label[@]}
# do
# 	cat "red/($i)"  >> tmp/REDCLEAN.txt

# 	cat "red/($i)"  >> tmp/BLACKCLEAN.txt
# 	grep "black-1 $i" "$msg_file" >> black/($i)
# done