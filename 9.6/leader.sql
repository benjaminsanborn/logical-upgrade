CREATE TABLE some_data (id serial primary key, data text);
INSERT INTO some_data SELECT generate_series(1, 1000), md5(random()::text);

CREATE EXTENSION pglogical;

SELECT pglogical.create_node(
  node_name := 'provider',
  dsn := 'host=pgleader port=5432 dbname=postgres'
);

SELECT pglogical.replication_set_add_all_tables('default', ARRAY['public']);

