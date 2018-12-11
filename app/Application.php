<?php

/**
 * Class Application
 */
class Application
{
    /**
     * @var PDO
     */
    private $pdo;

    /**
     * Application constructor.
     */
    public function __construct()
    {
        $this->pdo = new PDO(
            'mysql:host=127.0.0.1;dbname=prisons;charset=utf8',
            'root',
            '',
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]
        );
    }

    /**
     * @return array
     */
    public function getPersonsWithContacts()
    {
        return $this->pdo->query('
            SELECT p.id, p.first_name, p.last_name, 
              p.gender, p.birth_date, c.address, c.phone 
            FROM persons.person p
            INNER JOIN persons.contact c 
              ON c.person_id = p.id
        ')->fetchAll();
    }
}
