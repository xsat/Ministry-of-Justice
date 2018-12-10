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
  prisoner_id INT(10) UNSIGNED NOT NULL,
  person_id INT(10) UNSIGNED NOT NULL,
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
