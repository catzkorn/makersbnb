# MakersBnB

        ) )        /\
       =====      /  \
      _|___|_____/ __ \____________
     |::::::::::/ |  | \:::::::::::|
     |:::::::::/  ====  \::::::::::|
     |::::::::/__MAKERS__\:::::::::|
     |_________|  _BNB_ |__________|
      | ______ | / || \ | _______ |
      ||  |   || ====== ||   |   ||
      ||--+---|| |    | ||---+---||
      ||__|___|| |   o| ||___|___||
      |========| |____| |=========|
     (^^-^^^^^-|________|-^^^--^^^)
     (,, , ,, ,/________\,,,, ,, ,)
    ','',,,,' /__________\,,,',',;;


Welcome to MakersBNB! 


# Team Green

## Members
+ [Farhaan Ali](https://github.com/farhaan-ali)
 + [Charlotte  Brandhorst-Satzkorn](https://catzkorn.dev)
 + [Courtenay Donald](https://github.com/c-donald)
+ [Cristina Fujiname](https://github.com/cfujiname)
+ [Connor Worthington](https://github.com/CRTW26)



## Team Principles
+ Don’t Ignore Testing
 + Always ask for help if you are stuck
+ The project is for everyone - Everyone understanding the project is important
+ Overtime - No major implementation changes after 6pm unless otherwise agreed
+ Spread knowledge
+ Everyone has the chance to run a standup and retro

## Team Goal

+ Less is more - Don’t over extend the project. Figure out what we want to do and do that very well.

# Product Design & Management

## Github Projects

A github project board was used to manage the development of this product. This allowed the team to create and assign issues to pairing teams to develop and implement. 

![Github Project Board](https://imgur.com/EPQoKpn.jpg)

## User Stories

Separate sets of user stories were created for each 2 day sprint. 

### Sprint 1

![Sprint 1 user stories](https://imgur.com/GcRnDEj.jpg)

### Sprint 2
![Sprint 2 user stories](https://imgur.com/hrT3Auf.jpg)

## Class Diagrams

Class diagrams were created to give a basic structure to class expectations during the project. 

![Class Diagrams](https://imgur.com/RIDAjmN.jpg)


Management classes were used to interact with the database by passing in space, booking or user objects. 

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

+ show host pending bookings

## CRC Diagrams

CRC diagrams were initially created to mock the structure of databases and what datatypes may be suitable for use.

![CRC Diagram](https://imgur.com/Y5qc7PN.jpg)


## MVC Diagram

A MVC diagram was created to visually represent the log between the client, controller, model and viewer.

![MVC Diagram](https://imgur.com/QxeydnR.jpg)


# Database 

## Structure

Test environment consisting of 2 Databases;

+ makersbnb 
+ makersbnb_test (for testing purposes)
 
 
Each database has 3 tables: 

### Spaces 
+ id
+ name
+ description
+ price
+ userid

### Users 
+ id
+ email
+ name
+ password)

### Bookings 
+ bookingid
+ spaceid
+ guestid
+ stay_date
+ confirmation


## Security 

### Userid

User id's are UUIDv4's that were generated using the pgcrypto postgresql extension to prevent userid enumeration. 

### Passwords
Passwords are stored within the database as bcrypt hashes using the pgcrypto postgresql extension. 

This was implemented using [this guide](https://x-team.com/blog/storing-secure-passwords-with-postgresql/).

### SQL Injection Protection

Variable interpolation was used to protect against SQL injection. This was achieved by using the pg gem.

## Data Integrity 

### Foreign Key References

The messages table contains a foreign key reference to the users table to ensure that only users that exist in the schema can be added as message authors. If a user were to delete their account, their message history would be removed as a consequence. 


## Database Methods

### Joins

To reduce duplication of data within the tables, join methods were used to gain access to information stored within other tables.

```
"SELECT bookings.*, users.*, users.name AS user_name, spaces.* FROM bookings LEFT JOIN spaces ON bookings.spaceid = spaces.id LEFT JOIN users ON bookings.guestid = users.id WHERE spaces.userid = $1 AND bookings.confirmation IS NULL;"
```
This example was used to access user information (name, email, hostid) without explicitly storing that within the booking table.

## To set-up databases:

### Test database
Run:
```
psql -c 'CREATE DATABASE makersbnb_test;'
psql -d makersbnb_test -f db/migrations/test_database_setup.sql
```

### Live database
Run:
```
psql -c 'CREATE DATABASE makersbnb;'
psql -d makersbnb -f db/migrations/database_setup.sql

```

# How to run tests

Run bundle in the directory to install required gems:
```
charlotte@Charlottes-MBP makersbnb % bundle
```

Run rspec to test:
```
charlotte@Charlottes-MBP makersbnb % rspec
```

# How to use

## Start local server

- run `rackup`

```
charlotte@Charlottes-MBP makersbnb % rackup
[2020-10-02 12:36:47] INFO  WEBrick 1.6.0
[2020-10-02 12:36:47] INFO  ruby 2.7.0 (2019-12-25) [x86_64-darwin19]
[2020-10-02 12:36:47] INFO  WEBrick::HTTPServer#start: pid=9084 port=9292
```
- Navigate to `http://localhost:9292/` in your web browser

## Sign Up

### Required Information:
- Unique Email
- Name
- Password

## Log In

### Required Information:
- Email
- Password

## Add Spaces
### Requirements:
- User must be logged in.
### Required Information:
- Name
- Price
- Description

## View Spaces

- View spaces hosted by logged in user.
- Accept or decline booking requests on spaces.

## My Bookings

- View confirmed, pending or declined booking requests.




