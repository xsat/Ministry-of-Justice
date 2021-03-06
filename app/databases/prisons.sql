DROP DATABASE IF EXISTS prisons;

CREATE SCHEMA prisons;

CREATE TABLE prisons.prison
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX prison_id_uindex ON prisons.prison (id);

CREATE TABLE prisons.staff
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  person_id INT(10) UNSIGNED NOT NULL,
  manager_id INT(10) UNSIGNED,
  prison_id INT(10) UNSIGNED NOT NULL,
  CONSTRAINT staff_manager_id_fk FOREIGN KEY (manager_id)
  REFERENCES prisons.staff (id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT staff_prison_id_fk FOREIGN KEY (prison_id)
  REFERENCES prisons.prison (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX staff_id_uindex ON prisons.staff (id);

CREATE TABLE prisons.cell
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  prison_id INT(10) UNSIGNED NOT NULL,
  CONSTRAINT cell_prison_id_fk FOREIGN KEY (prison_id)
  REFERENCES prisons.prison (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX cell_id_uindex ON prisons.cell (id);

CREATE TABLE prisons.prisoner
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  person_id INT(10) UNSIGNED NOT NULL,
  crime_id INT(10) UNSIGNED NOT NULL,
  cell_id INT(10) UNSIGNED NOT NULL,
  entry_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  release_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT prisoner_cell_id_fk FOREIGN KEY (cell_id)
  REFERENCES prisons.cell (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX prisoner_id_uindex ON prisons.prisoner (id);

CREATE TABLE prisons.visit
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  prisoner_id INT(10) UNSIGNED NOT NULL,
  visitor_id INT(10) UNSIGNED NOT NULL COMMENT 'Person ID',
  visit_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT visit_prisoner_id_fk FOREIGN KEY (prisoner_id)
  REFERENCES prisons.prisoner (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX visit_id_uindex ON prisons.visit (id);

INSERT INTO prisons.prison
VALUES
  (12345, 'Alcatraz'),
  (66666, 'San Quentin'),
  (23459, 'Bang Kwang'),
  (10067, 'La Sabaneta'),
  (37038, 'Tadmor');

INSERT INTO prisons.staff
VALUES
  (1, 67890, null, 12345),
  (2, 43291, null, 66666),
  (3, 70691, null, 23459),
  (4, 88823, null, 10067),
  (5, 54321, null, 37038),
  (6, 10106, 1, 12345),
  (7, 69685, 1, 12345),
  (8, 20346, 2, 66666),
  (9, 77777, 2, 66666),
  (10, 45001, 3, 23459),
  (11, 97021, 3, 23459),
  (12, 39602, 4, 10067),
  (13, 11902, 4, 10067),
  (14, 25810, 5, 37038),
  (15, 80734, 5, 37038);

INSERT INTO prisons.cell
VALUES
  (1, 12345),
  (2, 66666),
  (3, 23459),
  (4, 10067),
  (5, 37038);

INSERT INTO prisons.prisoner
VALUES
  (1, 35092, 10928, 1, '2015-05-13 03:32:04', '2040-05-13 03:32:04'),
  (2, 29853, 11182, 1, '2013-04-21 05:22:14', '2050-04-21 05:22:14'),
  (3, 97326, 29861, 2, '2008-12-03 13:33:54', '2025-12-03 13:33:54'),
  (4, 63752, 98621, 2, '2010-12-23 10:41:54', '2025-12-23 10:41:54'),
  (5, 19832, 87653, 3, '2012-10-03 23:02:12', '2057-10-03 23:02:12'),
  (6, 70862, 28628, 3, '2009-07-11 08:27:49', '2024-07-11 08:27:49'),
  (7, 29601, 78264, 4, '2000-03-03 17:28:27', '2070-03-03 17:28:27'),
  (8, 98629, 65371, 4, '2016-10-02 21:33:17', '2028-10-02 21:33:17'),
  (9, 76249, 49875, 5, '2010-03-24 12:42:22', '2020-03-24 12:42:22'),
  (10, 10083, 29761, 5, '2015-07-23 11:22:14', '2050-07-23 11:22:14');

INSERT INTO prisons.visit
VALUES
  (15150, 1, 49327,  '2016-01-23 15:30:45'),
  (25552, 2, 10938, '2014-05-26 18:24:57'),
  (39765, 3, 20183, '2015-08-30 12:35:21'),
  (86530, 4, 10098, '2011-04-03 10:20:44'),
  (75932, 5, 30853, '2016-12-23 18:30:45'),
  (80652, 6, 70948, '2010-03-13 15:24:16'),
  (30722, 7, 38651, '2001-09-11 18:30:00'),
  (68621, 8, 67291, '2017-02-21 12:23:12'),
  (55555, 9, 24872, '2012-11-03 13:20:54'),
  (69691, 10, 12108, '2016-04-06 14:15:37');
