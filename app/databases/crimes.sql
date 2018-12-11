DROP DATABASE IF EXISTS crimes;

CREATE SCHEMA crimes;

CREATE TABLE crimes.crime
(
  id INT(10) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  victim_id INT(10) UNSIGNED COMMENT 'Person ID',
  criminal_id INT(10) UNSIGNED COMMENT 'Person ID',
  crime_type VARCHAR(255) NOT NULL,
  crime_level TINYINT(1) UNSIGNED DEFAULT 0 NOT NULL,
  crime_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX crime_id_uindex ON crimes.crime (id);

INSERT INTO crimes.crime
VALUES
  (10928, 25258, 35092, 'Homocide', 3, '2015-05-11 12:22:44'),
  (11182, 10279, 29853, 'Rape and Homocide', 4, '2013-04-20 12:02:44'),
  (29861, 13082, 97326, 'Homocide', 2, '2008-12-01 03:24:24'),
  (98621, 75093, 63752, 'Robbery', 2, '2010-12-20 11:01:27'),
  (87653, 67930, 19832, 'Homocide', 4, '2012-10-02 20:12:34'),
  (28628, 97814, 70862, 'Rape', 3, '2009-07-09 07:26:10'),
  (78264, 30928, 29601, 'Drug Trafficking', 5, '2000-03-02 20:13:28'),
  (65371, 85904, 98629, 'Stalking', 1, '2016-10-02 17:24:07'),
  (49875, 84321, 76249, 'Sexual Harassment', 1, '2010-03-22 01:23:02'),
  (29761, 59372, 10083, 'Robbery and Homicide', 3, '2015-07-20 23:20:45');
