dane=/home/michal/Pobrane/baltimore-911-calls.zip
#standalone
(time unzip -c $dane | mongoimport -d test -c alarms  --type csv --headerline --drop) > out1.txt 2>&1
tail -3 out1.txt >> my_standalone.txt
rm out1.txt

#default
(time unzip -c $dane \
| mongoimport --host carbon/localhost:27001,localhost:27002,localhost:27003 \
      --drop -d test -c alarms --type csv --headerline ) > out2.txt 2>&1
tail -3 out2.txt >> my_replica1.txt
rm out2.txt

# {w: 1, j: false}
(time unzip -c /home/michal/Pobrane/baltimore-911-calls.zip \
| mongoimport --host carbon/localhost:27001,localhost:27002,localhost:27003 \
      --drop -d test -c alarms --type csv --headerline) > out3.txt 2>&1
tail -3 out3.txt >> my_replica2.txt
rm out2.txt 

# {w: 1, j: true}
(time unzip -c $dane \
| mongoimport --host carbon/localhost:27001,localhost:27002,localhost:27003 \
      --drop -d test -c alarms --type csv --headerline ) > out4.txt 2>&1
tail -3 out4.txt >> my_replica3.txt
rm out2.txt 

# {w: 2, j: false}
(time unzip -c $dane \
| mongoimport --host carbon/localhost:27001,localhost:27002,localhost:27003 \
      --drop -d test -c alarms --type csv --headerline --writeConcern {w: 2, j: false} ) > out5.txt 2>&1
tail -3 out5.txt >> my_replica4.txt
rm out2.txt
 
# {w: 2, j: true}
(time unzip -c $dane \
| mongoimport --host carbon/localhost:27001,localhost:27002,localhost:27003 \
      --drop -d test -c alarms --type csv --headerline --writeConcern {w: 2, j: true} ) > out6.txt 2>&1
tail -3 out6.txt >> my_replica5.txt
rm out2.txt 

