Repozytorium z przedmiotu NoSQL.

Dane: [Baltimore 911 Calls](https://www.kaggle.com/sohier/baltimore-911-calls)

Opis danych: This dataset records the time, location, priority, and reason for calls to 911 in the city of Baltimore.

Ilość dokumentów w bazie: 2.799.914


TODO:
- [x] Konwersja danych CSV to JSON
- [x] Instalaja mongoDB
- [x] Import danych do mongoDB
- [x] Praca z replica set na localhost
- [ ] Praca z replica set na 3 komputerach
- [x] Napisanie skryptu do importów i liczenia czasu
- [ ] Przetestowanie skryptu
- [ ] Napisanie skryptu do tworzenia tabelki
- [ ] Napisanie wniosków



Tabelka z czasami dla moich danych:

| Typ importu  | czas real	    | czas user     | sys           |
| :---         |     ---      |          --- |          --- |
| standalone   |   8m27.309s     | 2m36.964s    | 0m8.096s    |
| replica set { "w" : 1, "wtimeout" : 0 }     | 35m50.572s      | 3m10.512s      | 0m10.108s      |
| replica set {w: 1, j: false}     | 23m18.152s      | 3m7.120s      | 0m9.692s      |
| replica set {w: 1, j: true}     | trwają prace       | trwają prace      | trwają prace      |
| replica set {w: 2, j: false}     | trwają prace       | trwają prace      | trwają prace      |
| replica set {w: 2, j: true}    | trwają prace       | trwają prace      | trwają prace      |


Konwersja danych CSV to JSON ([csvtojson](https://www.npmjs.com/package/csvtojson)):

Instalacja:
```
npm i -g csvtojson
```

Użycie:
```
csvtojson source.csv > converted.json
```
