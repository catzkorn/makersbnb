# MakersBnB

test database 

run:
```
psql -c 'CREATE DATABASE makersbnb_test;'
psql -d makersbnb_test -f db/migrations/test_database_setup.sql
```


run:
```
psql -c 'CREATE DATABASE makersbnb;'
psql -d makersbnb -f db/migrations/database_setup.sql
```



Booking Management class:

Methods:

+ show customer bookings

+ show host listings booked

+ confirm booking

+ request booking

+ show host requested bookings
