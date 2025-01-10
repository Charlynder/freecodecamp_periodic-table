drop database periodic_table;

create database periodic_table;

\connect periodic_table;

alter database periodic_table owner to freecodecamp;

-- create tables
create table elements (
    atomic_number int primary key,
    symbol char(2) not null unique,
    name varchar(40) not null unique
);

alter table elements owner to freecodecamp;

create table types (
    type_id int primary key,
    type varchar(20) not null
);

alter table types owner to freecodecamp;

create table properties (
    atomic_number int not null unique,
    atomic_mass numeric(10, 4) not null,
    melting_point_celsius numeric(10, 2) not null,
    boiling_point_celsius numeric(10, 2) not null,
    type_id int not null references types(type_id),
    foreign key (atomic_number) references elements(atomic_number)
);

alter table properties owner to freecodecamp;

-- insert into
insert into elements(atomic_number, symbol, name) values (1, 'H', 'Hydrogen'), (2, 'He', 'Helium'), (3, 'Li', 'Lithium'), (4, 'Be', 'Beryllium'), (5, 'B', 'Boron'), (6, 'C', 'Carbon'), (7, 'N', 'Nitrogen'), (8, 'O', 'Oxygen'), (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');

insert into types(type_id, type) values (1, 'metal'), (2, 'metalloid'), (3, 'nonmetal');

insert into properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) values (4, 9.0122, 1287, 2470, 1), (3, 6.94, 180.54, 1342, 1), (5, 10.81, 2075, 4000, 2), (10, 20.18, -248.6, -246.1, 3), (9, 18.998, -220, -188.1, 3), (8, 15.999, -218, -183, 3), (7, 14.007, -210.1, -195.8, 3), (6, 12.011, 3550, 4027, 3), (2, 4.0026, -272.2, -269, 3), (1, 1.008, -259.1, -252.9, 3);
