line=($(head -n 1 czas_1.txt))
czas=${line[1]}
#echo "$czas"
sekundy=$(echo "$czas" | grep -Po '(?<=(m)).*(?=s)')
echo "$sekundy"
minuty=$(echo "$czas" | grep -Po '.*(?=m)')
echo "$minuty"
min_to_s=$[$[minuty]*60]
sum_time=$(echo "$min_to_s+$sekundy" | bc)
echo $sum_time
