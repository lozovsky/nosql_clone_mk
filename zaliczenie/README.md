## Projekt na zaliczenie z NoSQL


Opis
-------
Projekt został napisany w Ruby i korzysta z [Ruby MongoDB Driver](https://docs.mongodb.com/ruby-driver/master/).
1. Przed użyciem aplikacji należy uruchomić [Replica Set](https://github.com/egzamin/nosql/tree/master/replica_sets).
2. Uruchamiamy skyprt import.sh, znajdujący sie w folderze bin. Wykona on import do replica set bazy znajdujądej się w folderze data (20 000 dokumentów).
3. Następnie należy uruchumić rspec, aby upewnić się czy połączenie z baza jest poprawne.

Skrypty
-------
1. bin/agg1.rb
Skrypt zlicza ilość wystąpień poszczególnych powodów zgloszeń telefonicznych.

```
$ ./agg1.rb -l n # tworzy tabelkę z n najczęsciej powiająjącymi się powodami zgloszeń
```
Tabelka wygenerowana przy użyciu komendy ./agg1.rb -l 15
<table>
  <tr>
    <th>_id</th>
    <th>count</th>
  </tr>
  <tr>
    <td>911/NO  VOICE</td>
    <td>3940</td>
  </tr>
  <tr>
    <td>DISORDERLY</td>
    <td>1959</td>
  </tr>
  <tr>
    <td>COMMON ASSAULT</td>
    <td>939</td>
  </tr>
  <tr>
    <td>Traffic Stop</td>
    <td>896</td>
  </tr>
  <tr>
    <td>AUTO ACCIDENT</td>
    <td>788</td>
  </tr>
  <tr>
    <td>NARCOTICSOutside</td>
    <td>735</td>
  </tr>
  <tr>
    <td>SILENT ALARM</td>
    <td>543</td>
  </tr>
  <tr>
    <td>OTHER</td>
    <td>543</td>
  </tr>
  <tr>
    <td>INVESTIGATE</td>
    <td>521</td>
  </tr>
  <tr>
    <td>FAMILY DISTURB</td>
    <td>495</td>
  </tr>
  <tr>
    <td>LARCENCY</td>
    <td>437</td>
  </tr>
  <tr>
    <td>BURGLARY</td>
    <td>414</td>
  </tr>
  <tr>
    <td>Repairs/Service</td>
    <td>413</td>
  </tr>
  <tr>
    <td>HIT AND RUN</td>
    <td>373</td>
  </tr>
  <tr>
    <td>DESTRUCT PROPTY</td>
    <td>316</td>
  </tr>
</table>
<to_s/>


2. bin/agg2.rb
Skrypt tworzy diagram z statystykami zgloszeń w poszczególnych dzielnicach.
Przykładowy [Diagram](https://github.com/nosql/app-cli-mkassjanski/blob/master/zaliczenie/bin/district_alarms.pdf)

3. bin/agg3.rb
Skrypt zwraca statystyki zgloszeń w wybranej dzielnicy.
```
$ ./agg3.rb -d <district> # zwraca zliczone powody w dzielnicy <district>
```
Lista przykładowych dzielnic: NE,CD,SD,ND,SW,NW,ED,CW,TRU,SS

3. bin/insert_one.rb
Skrypt pozwala na dodanie swojego zgłoszenia do bazy.

TODO:
-------
- [x] Stworzenie mniejszego zbioru danych na cele aplikacji (20 000 dokumentów)
- [x] Połączenie do bazy
- [x] Insert pojedynczego dokumentu
- [x] Zliczenie typów zgloszeń (tabelka)
- [x] Zliczenie zgloszeń w poszególnych dzielnicach (diagram)
- [x] Select na podstawie wprowadzonej dzielnicy
- [ ] Generowanie mapki z miejscami zgłoszeń
- [x] Replica Set
- [x] Test na connection


Rspec
----------

```
$ rspec spec/*
```
