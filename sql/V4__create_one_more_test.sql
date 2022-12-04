CREATE TABLE flyway_test.test_data_extra_comments(
    ID SERIAL PRIMARY KEY
    , test_data_id INT NOT NULL
    , comment VARCHAR(100) NOT NULL
    );

INSERT INTO flyway_test.test_data_extra_comments (test_data_id, comment)
VALUES (300, 'https://flywaydb.org/documentation/getstarted/why')
    , (300, 'https://flywaydb.org/documentation/getstarted/how')
    , (300, 'https://flywaydb.org/documentation/concepts/migrations#overview')
    , (400, 'https://flywaydb.org/documentation/concepts/migrations#repeatable-migrations')
    , (1000, 'there is always something else')
    , (1000, 'https://flywaydb.org/documentation/getstarted/how');
