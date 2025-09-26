-- Structure
DROP DATABASE IF EXISTS periodic_table;
CREATE DATABASE periodic_table;
\c periodic_table

CREATE TABLE elements (
  atomic_number INT PRIMARY KEY,
  symbol VARCHAR(2) NOT NULL UNIQUE,
  name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE types (
  type_id SERIAL PRIMARY KEY,
  type VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE properties (
  atomic_number INT PRIMARY KEY,
  atomic_mass REAL NOT NULL,
  melting_point_celsius REAL NOT NULL,
  boiling_point_celsius REAL NOT NULL,
  type_id INT NOT NULL,
  FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number),
  FOREIGN KEY (type_id) REFERENCES types(type_id)
);

-- Types
INSERT INTO types(type) VALUES ('metal'), ('nonmetal'), ('metalloid');

-- Elements
INSERT INTO elements VALUES
  (1, 'H', 'Hydrogen'),
  (2, 'He', 'Helium'),
  (3, 'Li', 'Lithium'),
  (4, 'Be', 'Beryllium'),
  (5, 'B', 'Boron'),
  (6, 'C', 'Carbon'),
  (7, 'N', 'Nitrogen'),
  (8, 'O', 'Oxygen'),
  (9, 'F', 'Fluorine'),
  (10, 'Ne', 'Neon');

-- Propriétés (type_id: 1=metal, 2=nonmetal, 3=metalloid)
INSERT INTO properties VALUES
  (1, 1.008, -259.1, -252.9, 2),
  (2, 4.0026, -272.2, -269, 2),
  (3, 6.94, 180.54, 1342, 1),
  (4, 9.0122, 1287, 2470, 1),
  (5, 10.81, 2075, 4000, 3),
  (6, 12.011, 3550, 4027, 2),
  (7, 14.007, -210.1, -195.8, 2),
  (8, 15.999, -218, -183, 2),
  (9, 18.998, -220, -188.1, 2),
  (10, 20.18, -248.6, -246.1, 2);
