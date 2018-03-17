#!/bin/bash
calc(){ awk "BEGIN { print $* }"; }
for ((i=1; $i<=5; i++));do
line1=($(head -n 1 "czas_"$i".txt"))
temp_line2=($(head -n 2 "czas_"$i".txt"))
line2="${temp_line2[3]}"
line3=($(tail -n 1 "czas_"$i".txt"))
#echo "${line1[1]}"
#echo "$line2"
#echo "${line3[1]}"

real_time=${line1[1]}
user_time=$line2
sys_time=${line3[1]}

# REAL TIME
sekundy=$(echo "$real_time" | grep -Po '(?<=(m)).*(?=s)')
#echo "$sekundy"
minuty=$(echo "$real_time" | grep -Po '.*(?=m)')
#echo "$minuty"
min_to_s=$[$[minuty]*60]
sum_time=$(echo "$min_to_s+$sekundy" | bc)
#echo "$sum_time"
sum_real+=("$sum_time")


# USER TIME
sekundy2=$(echo "$user_time" | grep -Po '(?<=(m)).*(?=s)')
echo "$sekundy2"
minuty2=$(echo "$user_time" | grep -Po '.*(?=m)')
#echo "$minuty"
min_to_s2=$[$[minuty2]*60]
sum_time2=$(echo "$min_to_s2+$sekundy2" | bc)
#echo "$sum_time"
sum_user+=("$sum_time2")



# SYS TIME
sekundy3=$(echo "$sys_time" | grep -Po '(?<=(m)).*(?=s)')
minuty3=$(echo "$sys_time" | grep -Po '.*(?=m)')
min_to_s3=$[$[minuty3]*60]
sum_time3=$(echo "$min_to_s3+$sekundy3" | bc)
sum_sys+=("$sum_time3")

done

echo "${sum_real[@]}"
echo "${sum_user[@]}"
echo "${sum_sys[@]}"

all_sum_real_time=$(echo "${sum_real[0]}+${sum_real[1]}+${sum_real[2]}+${sum_real[3]}+${sum_real[4]}" | bc)
all_sum_user_time=$(echo "${sum_user[0]}+${sum_user[1]}+${sum_user[2]}+${sum_user[3]}+${sum_user[4]}" | bc)
all_sum_sys_time=$(echo "${sum_sys[0]}+${sum_sys[1]}+${sum_sys[2]}+${sum_sys[3]}+${sum_sys[4]}" | bc)

avg_real_time=$(echo "$all_sum_real_time/5" | bc)
avg_user_time=$(echo "$all_sum_user_time/5" | bc)
avg_sys_time=$(echo "$all_sum_sys_time/5" | bc)

liczba_ele=5
calc $all_sum_real_time/$liczba_ele >> avg.txt
calc $all_sum_user_time/$liczba_ele >> avg.txt
calc $all_sum_sys_time/$liczba_ele >> avg.txt



#czas=${line[1]}
#echo "$czas"
#sekundy=$(echo "$czas" | grep -Po '(?<=(m)).*(?=s)')
#echo "$sekundy"
#minuty=$(echo "$czas" | grep -Po '.*(?=m)')
#echo "$minuty"
#min_to_s=$[$[minuty]*60]
#sum_time=$(echo "$min_to_s+$sekundy" | bc)
#echo $sum_time
