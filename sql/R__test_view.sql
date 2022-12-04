CREATE OR REPLACE VIEW flyway_test.v_test_data_extra_comments
AS
    SELECT td.id as test_data_id, tdec.id as test_data_extra_comment_id
        , td.test_val, tdec.comment
    FROM flyway_test.test_data td
    INNER JOIN flyway_test.test_data_extra_comments tdec on td.id = tdec.test_data_id
    ;
