DROP DATABASE IF EXISTS persons;

CREATE SCHEMA persons;

CREATE TABLE persons.person
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  ssn INT(10) UNSIGNED NOT NULL COMMENT 'Social security number',
  last_name VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  gender ENUM('male', 'female') NOT NULL,
  address TEXT NOT NULL,
  phone VARCHAR(255),
  birth_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX person_id_uindex ON persons.person (id);
