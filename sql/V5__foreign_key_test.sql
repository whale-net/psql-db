create unique index uix_test_data_id on flyway_test.test_data(id);

alter table flyway_test.test_data_extra_comments
    add constraint fk_test_data_id
        foreign key (test_data_id) references flyway_test.test_data (id);

