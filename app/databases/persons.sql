DROP DATABASE IF EXISTS persons;

CREATE SCHEMA persons;

CREATE TABLE persons.person
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  gender ENUM('male', 'female') NOT NULL,
  birth_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX person_id_uindex ON persons.person (id);

CREATE TABLE persons.contact
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  person_id INT(10) UNSIGNED NOT NULL,
  address TEXT,
  phone VARCHAR(255),
  CONSTRAINT contact_person_id_fk FOREIGN KEY (person_id)
  REFERENCES persons.person (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX contact_id_uindex ON persons.contact (id);

INSERT INTO persons.person (id, last_name, first_name, gender, birth_date)
VALUES
  (25258, 'Antawn', 'Jamison', 'male', '1994-01-23 10:11:34'),
  (10279, 'Stephen', 'Jackson', 'male', '1960-03-14 11:23:19'),
  (13082, 'Johnny', 'Cage', 'male', '1953-06-06 07:45:29'),
  (75093, 'Kate', 'Winslett', 'female', '1947-10-29 08:37:51'),
  (67930, 'Carlos', 'Rojo', 'male', '1997-05-26 18:36:22'),
  (97814, 'Alice', 'Tetch', 'female', '2005-04-13 19:27:05'),
  (85904, 'Paul', 'White', 'male', '1996-09-30 12:59:31'),
  (30928, 'James', 'Franco', 'male', '1987-06-12 10:11:03'),
  (84321, 'Stephanie', 'Baker', 'female', '1984-08-27 08:09:30'),
  (59372, 'Hannah', 'Smith', 'female', '1991-12-19 02:01:38'),
  (49327, 'Theresa', 'White', 'female', '1953-09-12 03:45:12'),
  (10938, 'Mike', 'Brown', 'male', '1984-10-21 12:25:19'),
  (20183, 'Devin', 'Booker', 'male', '1996-12-22 09:05:17'),
  (10098, 'Julia', 'Parker', 'female', '1990-06-02 07:15:02'),
  (30853, 'Gwen', 'Walker', 'female', '1992-10-30 13:27:28'),
  (70948, 'Demi', 'Moore', 'female', '1973-08-21 09:56:32'),
  (38651, 'Joseph', 'Thevenin', 'male', '1963-02-06 10:28:20'),
  (67291, 'Blake', 'Jordan', 'male', '1960-11-09 11:01:22'),
  (24872, 'Sophie', 'Smart', 'female', '1997-04-29 12:08:42'),
  (12108, 'Christina', 'Bloom', 'female', '1994-07-22 23:55:02'),
  (35092, 'Edward', 'Nygma', 'male', '1985-09-13 12:34:42'),
  (29853, 'Oswald', 'Cobblepot', 'male', '1986-11-03 10:21:32'),
  (97326, 'Fish', 'Mooney', 'male', '1961-02-23 10:04:21'),
  (63752, 'Barbara', 'Kean', 'female', '1990-04-03 11:20:34'),
  (19832, 'Jerome', 'Valeska', 'male', '1991-01-28 03:04:56'),
  (70862, 'Theo', 'Galavan', 'male', '1965-03-23 19:31:02'),
  (29601, 'Hugo', 'Strange', 'male', '1969-04-12 07:25:38'),
  (98629, 'Victor', 'Fries', 'male', '1975-12-27 06:21:00'),
  (76249, 'Butch', 'Gilzean', 'male', '1970-05-11 06:21:37'),
  (10083, 'Salvador', 'Maroni', 'male', '1960-01-01 20:24:22'),
  (67890, 'James', 'Gordon', 'male', '1972-05-13 15:30:27'),
  (43291, 'Lucius', 'Fox', 'male', '1969-11-05 08:45:07'),
  (70691, 'Tom', 'Benson', 'male', '1961-04-23 12:15:13'),
  (88823, 'Morty', 'Sanchez', 'male', '1974-03-11 09:35:17'),
  (54321, 'Isabella', 'White', 'female', '1962-12-27 04:54:27'),
  (10106, 'Ricardo', 'Herrera', 'male', '1984-11-15 21:28:13'),
  (69685, 'John', 'LayField',  'male', '1983-07-11 09:12:23'),
  (20346, 'Michael', 'McNamara', 'male', '1979-9-11 12:48:55'),
  (77777, 'Jude', 'Black', 'female', '1989-04-14 03:23:19'),
  (45001, 'Tony', 'Stark', 'male', '1984-02-21 22:04:12'),
  (97021, 'Wardell', 'Curry',  'male', '1972-01-01 05:27:48'),
  (39602, 'Carla', 'Kutsher', 'female', '1990-11-01 23:51:41'),
  (11902, 'Bob', 'Petit', 'male', '1980-09-15 17:41:28'),
  (25810, 'Patrick', 'Star', 'male', '1971-10-18 19:34:10'),
  (80734, 'Willie', 'Stein', 'male', '1986-05-27 20:12:01');

INSERT INTO persons.contact (person_id, address, phone)
VALUES
  (35092, 'New York City', '90946643'),
  (29853, 'Los Angeles', '90948632'),
  (97326, 'San Fransisco', '90945712'),
  (63752, 'La Fayette', '90951843'),
  (19832, 'West Virginia', '90974245'),
  (70862, 'Washington DC', '90952143'),
  (29601, 'Motor City', '90967620'),
  (98629, 'Salt Lake City', '90900614'),
  (76249, 'Indianapolis', '90900513'),
  (10083, 'New York City', '90965611'),
  (67890, 'Gotham City', null),
  (43291, 'New York City', null),
  (70691, 'New Orleans', null),
  (88823, 'Los Angeles', null),
  (54321, 'Portland', null),
  (10106, 'Mexico City', null),
  (69685, 'New Jersey', null),
  (20346, 'Salt Lake City', null),
  (77777, 'Washington DC', null),
  (45001, 'Windy City', null),
  (97021, 'North Carolina', null),
  (39602, 'South Dakota', null),
  (11902, 'West Virginia', null),
  (25810, 'Baton Rouge', null),
  (80734, 'Motor City', null);
