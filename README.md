# Join and Window Function tutorials

These guides were originally prepared for internal training at TopOPPS.

## Setup a database

You may be able to contact me to get credentials to access a running database. If not, follow these steps to get a database with the library schema.

### 1. Install PostgreSQL

(The best SQL database)

#### Mac:

Best bet is to use http://postgresapp.com/ .

Make sure to set up your path once it's installed:

1. Run atom ~/.bash_profile.
2. Add the line `export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin`
3. Save and close the file.

#### Windows:

Download the installer from http://www.enterprisedb.com/products-services-training/pgdownload#windows and run it. Update the PATH, as advised at https://stackoverflow.com/a/22921860/1586229. I don't have a Windows machine, so please comment here if you have more guidance.

#### Linux:

Use your distro's package manager to install postgres.

### 2. Create a database, and load the .pg_dump file

```bash
$ createdb library
$ gzip -d join_tutorial.pg_dump.gz
$ psql -d library < join_tutorial.pg_dump # This one will emit some errors like 'ERROR:  role "zampmgjjqmxrvg" does not exist', but you can safely ignore them
$ psql -d library -c 'SELECT * FROM loan LIMIT 5' # Check that everything worked okay
 id | book_copy_id |  date_out  |  date_due  | date_back  | borrower_id
----+--------------+------------+------------+------------+-------------
  1 |          525 | 2003-04-11 | 2003-05-02 | 2003-04-15 |          27
  2 |          462 | 2009-02-07 | 2009-02-28 | 2009-02-12 |          45
  4 |          573 | 2005-10-13 | 2005-11-03 | 2005-10-30 |          29
  5 |          112 | 2003-12-09 | 2003-12-30 | 2003-12-21 |          12
  6 |          496 | 2014-08-26 | 2014-09-16 | 2014-09-01 |          18
(5 rows)
```

## Accessing the database

If you're hosting the db yourself, you'll want to enter the following connection info into your db client:

| | |
|-|-|
|Host| localhost|
|Port| 5432|
|User| &lt;your computer username&gt;|
|Password| &lt;empty&gt;|
|Database|library (or whatever you named it)|

#### Mac:

I recommend [Postico](https://eggerapps.at/postico/) (made by the same people as postgresapp).

#### Windows and Linux:

Haven't explored much, but I've heard Navicat is good (paid). pgAdmin is popular and free, but (IMO) ugly. sqlectron is free and pretty, but it's an electron app (which might bother you). Let me know if there's an option here you recommend.

## Other Resources

- https://sqlbolt.com/
- http://www.windowfunctions.com/
