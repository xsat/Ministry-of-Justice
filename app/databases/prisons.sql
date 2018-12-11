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

CREATE TABLE prisons.prisoner
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  person_id INT(10) UNSIGNED NOT NULL,
  crime_id INT(10) UNSIGNED NOT NULL,
  prison_id INT(10) UNSIGNED NOT NULL,
  entry_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  release_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT prisoner_prison_id_fk FOREIGN KEY (prison_id)
  REFERENCES prisons.prison (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX prisoner_id_uindex ON prisons.prisoner (id);

CREATE TABLE prisons.visit
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  prisoner_id INT(10) UNSIGNED NOT NULL ,
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

INSERT INTO prisons.staff (id, person_id, manager_id, prison_id)
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
