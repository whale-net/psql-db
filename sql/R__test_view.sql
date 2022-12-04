-- because this file is prefixed with R__, it will run whenever it has been modified (chekcsum changes)
-- this is useful for things like views and functions
-- this is an example of a view, you can modify this if you want to see how it works
CREATE OR REPLACE VIEW flyway_test.v_test_data_extra_comments
AS
    SELECT td.id as test_data_id, tdec.id as test_data_extra_comment_id
        , td.test_val, tdec.comment
        , tdec.id as dummy_id_val_for_a_test_pleas_ignore
    FROM flyway_test.test_data td
    INNER JOIN flyway_test.test_data_extra_comments tdec on td.id = tdec.test_data_id
    ;

-- although apparently if you want to rename a column, it will have to be altered? I'm not sure how to handle that yet

-- after a bit of testing, maybe we should explicitly drop the view and then create? create or replace doesn't like renaming I guess
-- unsure if that is best practices though, will figure out when we need to