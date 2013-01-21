-- ----------------------------------------------------------
--  driver: postgresql, generated: 2011-01-10 15:46:15
-- ----------------------------------------------------------
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket ADD archive_flag INTEGER NULL;
UPDATE ticket SET archive_flag = 0 WHERE archive_flag IS NULL;
ALTER TABLE ticket ALTER archive_flag SET DEFAULT 0;
ALTER TABLE ticket ALTER archive_flag SET NOT NULL;
CREATE INDEX ticket_create_time_unix ON ticket (create_time_unix);
CREATE INDEX ticket_create_time ON ticket (create_time);
CREATE INDEX ticket_archive_flag ON ticket (archive_flag);
-- ----------------------------------------------------------
--  insert into table ticket_history_type
-- ----------------------------------------------------------
INSERT INTO ticket_history_type (name, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    ('ArchiveFlagUpdate', 1, 1, current_timestamp, 1, current_timestamp);
-- ----------------------------------------------------------
--  create table ticket_flag
-- ----------------------------------------------------------
CREATE TABLE ticket_flag (
    ticket_id INTEGER NOT NULL,
    ticket_key VARCHAR (50) NOT NULL,
    ticket_value VARCHAR (50) NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL
);
CREATE INDEX ticket_flag_ticket_id ON ticket_flag (ticket_id);
CREATE INDEX ticket_flag_ticket_id_create_by ON ticket_flag (ticket_id, create_by);
CREATE INDEX ticket_flag_ticket_id_ticket_key ON ticket_flag (ticket_id, ticket_key);
-- ----------------------------------------------------------
--  alter table article_flag
-- ----------------------------------------------------------
ALTER TABLE article_flag RENAME article_flag TO article_key;
-- ----------------------------------------------------------
--  alter table article_flag
-- ----------------------------------------------------------
ALTER TABLE article_flag ALTER article_key TYPE VARCHAR (50);
ALTER TABLE article_flag ALTER article_key DROP DEFAULT;
UPDATE article_flag SET article_key = '' WHERE article_key IS NULL;
ALTER TABLE article_flag ALTER article_key SET NOT NULL;
-- ----------------------------------------------------------
--  alter table article_flag
-- ----------------------------------------------------------
ALTER TABLE article_flag ADD article_value VARCHAR (50) NULL;
CREATE INDEX article_flag_article_id_create_by ON article_flag (article_id, create_by);
CREATE INDEX article_flag_article_id_article_key ON article_flag (article_id, article_key);
DROP INDEX article_flag_create_by;
-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user RENAME salutation TO title;
-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ALTER title TYPE VARCHAR (50);
ALTER TABLE customer_user ALTER title DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ALTER login TYPE VARCHAR (200);
ALTER TABLE customer_user ALTER login DROP DEFAULT;
UPDATE customer_user SET login = '' WHERE login IS NULL;
ALTER TABLE customer_user ALTER login SET NOT NULL;
-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ALTER customer_id TYPE VARCHAR (150);
ALTER TABLE customer_user ALTER customer_id DROP DEFAULT;
UPDATE customer_user SET customer_id = '' WHERE customer_id IS NULL;
ALTER TABLE customer_user ALTER customer_id SET NOT NULL;
-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ALTER zip TYPE VARCHAR (200);
ALTER TABLE customer_user ALTER zip DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ALTER city TYPE VARCHAR (200);
ALTER TABLE customer_user ALTER city DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ALTER country TYPE VARCHAR (200);
ALTER TABLE customer_user ALTER country DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ALTER pw TYPE VARCHAR (64);
ALTER TABLE customer_user ALTER pw DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table users
-- ----------------------------------------------------------
ALTER TABLE users RENAME salutation TO title;
-- ----------------------------------------------------------
--  alter table users
-- ----------------------------------------------------------
ALTER TABLE users ALTER title TYPE VARCHAR (50);
ALTER TABLE users ALTER title DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table users
-- ----------------------------------------------------------
ALTER TABLE users ALTER login TYPE VARCHAR (200);
ALTER TABLE users ALTER login DROP DEFAULT;
UPDATE users SET login = '' WHERE login IS NULL;
ALTER TABLE users ALTER login SET NOT NULL;
-- ----------------------------------------------------------
--  alter table users
-- ----------------------------------------------------------
ALTER TABLE users ALTER pw TYPE VARCHAR (64);
ALTER TABLE users ALTER pw DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table valid
-- ----------------------------------------------------------
ALTER TABLE valid ALTER name TYPE VARCHAR (200);
ALTER TABLE valid ALTER name DROP DEFAULT;
UPDATE valid SET name = '' WHERE name IS NULL;
ALTER TABLE valid ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table ticket_priority
-- ----------------------------------------------------------
ALTER TABLE ticket_priority ALTER name TYPE VARCHAR (200);
ALTER TABLE ticket_priority ALTER name DROP DEFAULT;
UPDATE ticket_priority SET name = '' WHERE name IS NULL;
ALTER TABLE ticket_priority ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table ticket_type
-- ----------------------------------------------------------
ALTER TABLE ticket_type ALTER name TYPE VARCHAR (200);
ALTER TABLE ticket_type ALTER name DROP DEFAULT;
UPDATE ticket_type SET name = '' WHERE name IS NULL;
ALTER TABLE ticket_type ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table ticket_lock_type
-- ----------------------------------------------------------
ALTER TABLE ticket_lock_type ALTER name TYPE VARCHAR (200);
ALTER TABLE ticket_lock_type ALTER name DROP DEFAULT;
UPDATE ticket_lock_type SET name = '' WHERE name IS NULL;
ALTER TABLE ticket_lock_type ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table groups
-- ----------------------------------------------------------
ALTER TABLE groups ALTER name TYPE VARCHAR (200);
ALTER TABLE groups ALTER name DROP DEFAULT;
UPDATE groups SET name = '' WHERE name IS NULL;
ALTER TABLE groups ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table roles
-- ----------------------------------------------------------
ALTER TABLE roles ALTER name TYPE VARCHAR (200);
ALTER TABLE roles ALTER name DROP DEFAULT;
UPDATE roles SET name = '' WHERE name IS NULL;
ALTER TABLE roles ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table ticket_state
-- ----------------------------------------------------------
ALTER TABLE ticket_state ALTER name TYPE VARCHAR (200);
ALTER TABLE ticket_state ALTER name DROP DEFAULT;
UPDATE ticket_state SET name = '' WHERE name IS NULL;
ALTER TABLE ticket_state ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table ticket_state_type
-- ----------------------------------------------------------
ALTER TABLE ticket_state_type ALTER name TYPE VARCHAR (200);
ALTER TABLE ticket_state_type ALTER name DROP DEFAULT;
UPDATE ticket_state_type SET name = '' WHERE name IS NULL;
ALTER TABLE ticket_state_type ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table salutation
-- ----------------------------------------------------------
ALTER TABLE salutation ALTER name TYPE VARCHAR (200);
ALTER TABLE salutation ALTER name DROP DEFAULT;
UPDATE salutation SET name = '' WHERE name IS NULL;
ALTER TABLE salutation ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table signature
-- ----------------------------------------------------------
ALTER TABLE signature ALTER name TYPE VARCHAR (200);
ALTER TABLE signature ALTER name DROP DEFAULT;
UPDATE signature SET name = '' WHERE name IS NULL;
ALTER TABLE signature ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table system_address
-- ----------------------------------------------------------
ALTER TABLE system_address ALTER comments TYPE VARCHAR (250);
ALTER TABLE system_address ALTER comments DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table follow_up_possible
-- ----------------------------------------------------------
ALTER TABLE follow_up_possible ALTER name TYPE VARCHAR (200);
ALTER TABLE follow_up_possible ALTER name DROP DEFAULT;
UPDATE follow_up_possible SET name = '' WHERE name IS NULL;
ALTER TABLE follow_up_possible ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table queue
-- ----------------------------------------------------------
ALTER TABLE queue ALTER comments TYPE VARCHAR (250);
ALTER TABLE queue ALTER comments DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table ticket_history_type
-- ----------------------------------------------------------
ALTER TABLE ticket_history_type ALTER name TYPE VARCHAR (200);
ALTER TABLE ticket_history_type ALTER name DROP DEFAULT;
UPDATE ticket_history_type SET name = '' WHERE name IS NULL;
ALTER TABLE ticket_history_type ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table article_type
-- ----------------------------------------------------------
ALTER TABLE article_type ALTER name TYPE VARCHAR (200);
ALTER TABLE article_type ALTER name DROP DEFAULT;
UPDATE article_type SET name = '' WHERE name IS NULL;
ALTER TABLE article_type ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table article_sender_type
-- ----------------------------------------------------------
ALTER TABLE article_sender_type ALTER name TYPE VARCHAR (200);
ALTER TABLE article_sender_type ALTER name DROP DEFAULT;
UPDATE article_sender_type SET name = '' WHERE name IS NULL;
ALTER TABLE article_sender_type ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table standard_response
-- ----------------------------------------------------------
ALTER TABLE standard_response ALTER comments TYPE VARCHAR (250);
ALTER TABLE standard_response ALTER comments DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table standard_response
-- ----------------------------------------------------------
ALTER TABLE standard_response ALTER name TYPE VARCHAR (200);
ALTER TABLE standard_response ALTER name DROP DEFAULT;
UPDATE standard_response SET name = '' WHERE name IS NULL;
ALTER TABLE standard_response ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table standard_attachment
-- ----------------------------------------------------------
ALTER TABLE standard_attachment ALTER comments TYPE VARCHAR (250);
ALTER TABLE standard_attachment ALTER comments DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table standard_attachment
-- ----------------------------------------------------------
ALTER TABLE standard_attachment ALTER content_type TYPE VARCHAR (250);
ALTER TABLE standard_attachment ALTER content_type DROP DEFAULT;
UPDATE standard_attachment SET content_type = '' WHERE content_type IS NULL;
ALTER TABLE standard_attachment ALTER content_type SET NOT NULL;
-- ----------------------------------------------------------
--  alter table standard_attachment
-- ----------------------------------------------------------
ALTER TABLE standard_attachment ALTER name TYPE VARCHAR (200);
ALTER TABLE standard_attachment ALTER name DROP DEFAULT;
UPDATE standard_attachment SET name = '' WHERE name IS NULL;
ALTER TABLE standard_attachment ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table auto_response_type
-- ----------------------------------------------------------
ALTER TABLE auto_response_type ALTER comments TYPE VARCHAR (250);
ALTER TABLE auto_response_type ALTER comments DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table auto_response_type
-- ----------------------------------------------------------
ALTER TABLE auto_response_type ALTER name TYPE VARCHAR (200);
ALTER TABLE auto_response_type ALTER name DROP DEFAULT;
UPDATE auto_response_type SET name = '' WHERE name IS NULL;
ALTER TABLE auto_response_type ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table auto_response
-- ----------------------------------------------------------
ALTER TABLE auto_response ALTER comments TYPE VARCHAR (250);
ALTER TABLE auto_response ALTER comments DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table auto_response
-- ----------------------------------------------------------
ALTER TABLE auto_response ALTER name TYPE VARCHAR (200);
ALTER TABLE auto_response ALTER name DROP DEFAULT;
UPDATE auto_response SET name = '' WHERE name IS NULL;
ALTER TABLE auto_response ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table service
-- ----------------------------------------------------------
ALTER TABLE service ALTER comments TYPE VARCHAR (250);
ALTER TABLE service ALTER comments DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table service_customer_user
-- ----------------------------------------------------------
ALTER TABLE service_customer_user ALTER customer_user_login TYPE VARCHAR (200);
ALTER TABLE service_customer_user ALTER customer_user_login DROP DEFAULT;
UPDATE service_customer_user SET customer_user_login = '' WHERE customer_user_login IS NULL;
ALTER TABLE service_customer_user ALTER customer_user_login SET NOT NULL;
-- ----------------------------------------------------------
--  alter table sla
-- ----------------------------------------------------------
ALTER TABLE sla ALTER comments TYPE VARCHAR (250);
ALTER TABLE sla ALTER comments DROP DEFAULT;
-- ----------------------------------------------------------
--  alter table customer_company
-- ----------------------------------------------------------
ALTER TABLE customer_company ALTER customer_id TYPE VARCHAR (150);
ALTER TABLE customer_company ALTER customer_id DROP DEFAULT;
UPDATE customer_company SET customer_id = '' WHERE customer_id IS NULL;
ALTER TABLE customer_company ALTER customer_id SET NOT NULL;
-- ----------------------------------------------------------
--  alter table customer_company
-- ----------------------------------------------------------
ALTER TABLE customer_company ALTER name TYPE VARCHAR (200);
ALTER TABLE customer_company ALTER name DROP DEFAULT;
UPDATE customer_company SET name = '' WHERE name IS NULL;
ALTER TABLE customer_company ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table notification_event
-- ----------------------------------------------------------
ALTER TABLE notification_event ALTER content_type TYPE VARCHAR (250);
ALTER TABLE notification_event ALTER content_type DROP DEFAULT;
UPDATE notification_event SET content_type = '' WHERE content_type IS NULL;
ALTER TABLE notification_event ALTER content_type SET NOT NULL;
-- ----------------------------------------------------------
--  alter table notification_event
-- ----------------------------------------------------------
ALTER TABLE notification_event ADD comments VARCHAR (250) NULL;
-- ----------------------------------------------------------
--  alter table package_repository
-- ----------------------------------------------------------
ALTER TABLE package_repository ALTER name TYPE VARCHAR (200);
ALTER TABLE package_repository ALTER name DROP DEFAULT;
UPDATE package_repository SET name = '' WHERE name IS NULL;
ALTER TABLE package_repository ALTER name SET NOT NULL;
-- ----------------------------------------------------------
--  alter table article_attachment
-- ----------------------------------------------------------
ALTER TABLE article_attachment ALTER content_type TYPE VARCHAR (450);
ALTER TABLE article_attachment ALTER content_type DROP DEFAULT;
ALTER TABLE ticket_flag ADD CONSTRAINT FK_ticket_flag_ticket_id_id FOREIGN KEY (ticket_id) REFERENCES ticket (id);
ALTER TABLE ticket_flag ADD CONSTRAINT FK_ticket_flag_create_by_id FOREIGN KEY (create_by) REFERENCES users (id);
