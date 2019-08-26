--- Test data

create table test_data_types (
   serial_field integer PRIMARY KEY,
   bool_field boolean,
   char_field char(40),
   varchar_field varchar(100),
   text_field text,
   smallint_field smallint,
   int_field integer,
   float_field float,
   real_field real,
   numeric_field numeric,
   date_field date,
   timestamp_field timestamp
);

insert into test_data_types(serial_field, bool_field, char_field, varchar_field, text_field, smallint_field, int_field, float_field, real_field, numeric_field, date_field, timestamp_field)
values(1, True, 'char!', 'varchar!', 'text!', 1, 299792458, 6.626, 1.280649, 6.02214076, '2019-08-13', '2019-08-13 17:40:00-07');

create table test_field_names (
   id integer PRIMARY KEY,
   low_case integer,
   UPCASE integer,
   CamelCase integer,
   "Table" integer,
   "array" integer,
   "SELECT" integer
);

insert into test_field_names(id, low_case, upcase, camelcase, "Table", "array", "SELECT")
values(1, 0,0,0,0,0,0);

create table test_index (
   id integer NOT NULL PRIMARY KEY,
   name varchar(100) NOT NULL UNIQUE
);

insert into test_index(id, name)
values
(1, 'Sunday'),
(2, 'Monday'),
(3, 'Tuesday'),
(4, 'Wednesday'),
(5, 'Thursday'),
(6, 'Friday'),
(7, 'Saturday');

create table test_index_ref (
   id integer PRIMARY KEY,
   index_id integer REFERENCES test_index(id)
);

insert into test_index_ref(id, index_id)
values
(1, 1),
(2, 5);
