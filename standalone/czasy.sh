dane=/home/michal/Pobrane/baltimore-911-calls.zip
#standalone



for ((i=1; $i<= 5;i++)) ; do
	(time unzip -c $dane | mongoimport -d test -c alarms  --type csv --headerline --drop) > "$i.txt" 2>&1
	tail -3 "$i.txt" > "czas_$i.txt"
	rm "$i.txt"
done

