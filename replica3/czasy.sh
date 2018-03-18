dane=/home/michal/Pobrane/baltimore-911-calls.zip
#replica {w:1, j:false}



for ((i=1; $i<= 5;i++)) ; do
	(time unzip -c $dane \
| mongoimport --host carbon/localhost:27001,localhost:27002,localhost:27003 \
      --drop -d test -c alarms --type csv --headerline --writeConcern '{w:1, j:true}') > "$i.txt" 2>&1
	tail -3 "$i.txt" > "czas_$i.txt"
	rm "$i.txt"
done

