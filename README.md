# MakersBnB

Test environment consisting of 2 Databases and 3 tables: spaces, users, bookings
* test database 

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


## Space Management class:

Methods:

+ show all spaces

+ create space(space_object), with _name_, _price_ and _description_

+ shows user_spaces(user_id)

+ shows specific spaces view_spaces(space_id)

+ shows specific spaces according to availability

+ shows specific spaces according to availability

+ contains a method for converting string month to a date object

## User Management class:

Methods:

+ has a sign up functionality

+ has a log in functionality

* note that logout functionality is implemented by destroying a session, no need for a method itself.

## Booking Management class:

Methods:

+ show customer bookings

+ show host listings booked

+ confirm booking

+ request booking

+ show host requested bookings

