CREATE EXTENSION pglogical;
CREATE TABLE some_data (id serial primary key, data text);
SELECT pglogical.create_node(node_name := 'subscriber', dsn := 'host=127.0.0.1 port=5432 dbname=postgres user=postgres');
SELECT pglogical.create_subscription(subscription_name := 'subscription', provider_dsn := 'host=pgleader port=5432 dbname=postgres user=postgres password=password', replication_sets := '{default}'::text[] );

