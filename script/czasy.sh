for ((i=1; $i<= 5;i++)) ; do
	(time sleep 1) > "$i.txt" 2>&1
	tail -3 "$i.txt" > "czas_$i.txt"
	rm "$i.txt"
done

