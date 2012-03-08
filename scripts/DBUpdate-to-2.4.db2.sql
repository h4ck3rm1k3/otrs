-- ----------------------------------------------------------
--  driver: db2, generated: 2009-07-13 14:35:40
-- ----------------------------------------------------------
-- ----------------------------------------------------------
--  create table notification_event
-- ----------------------------------------------------------
CREATE TABLE notification_event (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR (200) NOT NULL,
    subject VARCHAR (200) NOT NULL,
    text CLOB (31K) NOT NULL,
    content_type VARCHAR (100) NOT NULL,
    charset VARCHAR (100) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT notification_event_name UNIQUE (name)
);

-- ----------------------------------------------------------
--  create table notification_event_item
-- ----------------------------------------------------------
CREATE TABLE notification_event_item (
    notification_id INTEGER NOT NULL,
    event_key VARCHAR (200) NOT NULL,
    event_value VARCHAR (200) NOT NULL
);

CREATE INDEX notification_event_item_event_64 ON notification_event_item (event_key);

CREATE INDEX notification_event_item_event_e4 ON notification_event_item (event_value);

CREATE INDEX notification_event_item_notifidc ON notification_event_item (notification_id);

-- ----------------------------------------------------------
--  alter table postmaster_filter
-- ----------------------------------------------------------
ALTER TABLE postmaster_filter ADD f_stop SMALLINT;

ALTER TABLE ticket ALTER COLUMN until_time SET DEFAULT 0;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ticket');

ALTER TABLE ticket ALTER COLUMN until_time DROP DEFAULT;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ticket');

UPDATE ticket SET until_time = 0 WHERE until_time IS NULL;

ALTER TABLE ticket ALTER COLUMN until_time SET NOT NULL;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ticket');

CREATE INDEX ticket_until_time ON ticket (until_time);

ALTER TABLE ticket ALTER COLUMN timeout SET DEFAULT 0;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ticket');

ALTER TABLE ticket ALTER COLUMN timeout DROP DEFAULT;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ticket');

UPDATE ticket SET timeout = 0 WHERE timeout IS NULL;

ALTER TABLE ticket ALTER COLUMN timeout SET NOT NULL;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ticket');

CREATE INDEX ticket_timeout ON ticket (timeout);

-- ----------------------------------------------------------
--  alter table article
-- ----------------------------------------------------------
ALTER TABLE article ADD a_in_reply_to VARCHAR (3800);

-- ----------------------------------------------------------
--  alter table article
-- ----------------------------------------------------------
ALTER TABLE article ADD a_references VARCHAR (3800);

-- ----------------------------------------------------------
--  alter table article_attachment
-- ----------------------------------------------------------
ALTER TABLE article_attachment ADD content_id VARCHAR (250);

-- ----------------------------------------------------------
--  alter table article_attachment
-- ----------------------------------------------------------
ALTER TABLE article_attachment ADD content_alternative VARCHAR (50);

-- ----------------------------------------------------------
--  create table service_preferences
-- ----------------------------------------------------------
CREATE TABLE service_preferences (
    service_id INTEGER NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value VARCHAR (250)
);

CREATE INDEX service_preferences_service_id ON service_preferences (service_id);

-- ----------------------------------------------------------
--  create table sla_preferences
-- ----------------------------------------------------------
CREATE TABLE sla_preferences (
    sla_id INTEGER NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value VARCHAR (250)
);

CREATE INDEX sla_preferences_sla_id ON sla_preferences (sla_id);

-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ADD phone VARCHAR (150);

-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ADD fax VARCHAR (150);

-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ADD mobile VARCHAR (150);

-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ADD street VARCHAR (150);

-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ADD zip VARCHAR (150);

-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ADD city VARCHAR (150);

-- ----------------------------------------------------------
--  alter table customer_user
-- ----------------------------------------------------------
ALTER TABLE customer_user ADD country VARCHAR (150);

-- ----------------------------------------------------------
--  alter table salutation
-- ----------------------------------------------------------
ALTER TABLE salutation ADD content_type VARCHAR (250);

-- ----------------------------------------------------------
--  alter table signature
-- ----------------------------------------------------------
ALTER TABLE signature ADD content_type VARCHAR (250);

-- ----------------------------------------------------------
--  alter table standard_response
-- ----------------------------------------------------------
ALTER TABLE standard_response ADD content_type VARCHAR (250);

-- ----------------------------------------------------------
--  alter table auto_response
-- ----------------------------------------------------------
ALTER TABLE auto_response ADD content_type VARCHAR (250);

-- ----------------------------------------------------------
--  alter table notifications
-- ----------------------------------------------------------
ALTER TABLE notifications ADD content_type VARCHAR (250);

-- ----------------------------------------------------------
--  alter table web_upload_cache
-- ----------------------------------------------------------
ALTER TABLE web_upload_cache ADD content_id VARCHAR (250);

ALTER TABLE notification_event ADD CONSTRAINT FK_notification_event_create_by_id FOREIGN KEY (create_by) REFERENCES users (id);

ALTER TABLE notification_event ADD CONSTRAINT FK_notification_event_change_by_id FOREIGN KEY (change_by) REFERENCES users (id);

ALTER TABLE notification_event ADD CONSTRAINT FK_notification_event_valid_id_id FOREIGN KEY (valid_id) REFERENCES valid (id);

ALTER TABLE notification_event_item ADD CONSTRAINT FK_notification_event_item_notification_id_id FOREIGN KEY (notification_id) REFERENCES notification_event (id);

ALTER TABLE service_preferences ADD CONSTRAINT FK_service_preferences_service_id_id FOREIGN KEY (service_id) REFERENCES service (id);

ALTER TABLE sla_preferences ADD CONSTRAINT FK_sla_preferences_sla_id_id FOREIGN KEY (sla_id) REFERENCES sla (id);
