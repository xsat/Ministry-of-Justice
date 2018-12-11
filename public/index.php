<?php

$pdo = new PDO(
    'mysql:host=127.0.0.1;dbname=crimes;charset=utf8',
    'root',
    '',
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]
);

$personsWithContacts = $pdo->query('
  SELECT p.id, p.first_name, p.last_name, 
      p.gender, p.birth_date, c.address, c.phone 
  FROM persons.person p
  INNER JOIN persons.contact c 
    ON c.person_id = p.id
')->fetchAll();

var_dump($personsWithContacts);

