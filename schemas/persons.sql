DROP DATABASE IF EXISTS persons;

CREATE SCHEMA persons;

CREATE TABLE persons.person
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  ssn INT(10) UNSIGNED COMMENT 'Social security number',
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
