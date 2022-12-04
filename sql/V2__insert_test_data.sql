
INSERT INTO flyway_test.test_data (ID, test_val)
VALUES (100, 'hello')
    , (200, 'world')
    , (300, 'this is a non-repeatable migration example')
    , (301, 'which means that flyway will run this file 1 time during the creation of the database')
    , (302, 'so if you modify a V<XXX> file, it will not change anything in the database')
    , (303, 'instead, you want to write ALTER TABLE ... statements to modify the table')
    , (400, 'flyway does have the concept of repeatable migrations that allow you to modify a file again')
    , (401, 'but those have a different naming scheme and generally cannot be used when data needs to persist')
    , (402, 'but it is really good for things like functions and stored procedures (or whatever psql has)');