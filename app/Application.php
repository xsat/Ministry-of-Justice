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
    public function getPersons()
    {
        return $this->pdo->query('
            SELECT p.id, p.first_name, p.last_name, 
              p.gender, p.birth_date, c.address, c.phone 
            FROM persons.person p
            INNER JOIN persons.contact c 
              ON c.person_id = p.id
        ')->fetchAll();
    }

    /**
     * @return array
     */
    public function getCrimes()
    {
        return $this->pdo->query('
            SELECT c.id, c.crime_type, c.crime_level, c.crime_date,
              c.victim_id, vp.first_name victim_first_name, vp.last_name victim_last_name,
              c.criminal_id, cp.first_name criminal_first_name, cp.last_name criminal_last_name
            FROM crimes.crime c
            INNER JOIN persons.person vp 
              ON c.victim_id = vp.id
            LEFT JOIN persons.person cp
              ON c.criminal_id = cp.id
        ')->fetchAll();
    }

    /**
     * @return array
     */
    public function getVisits()
    {
        return $this->pdo->query('
            SELECT v.id, v.prisoner_id, pp.first_name prisoner_first_name, pp.last_name prisoner_last_name,
              v.visitor_id, vp.first_name visitor_first_name, vp.last_name visitor_last_name, v.visit_date
            FROM prisons.visit v
            INNER JOIN persons.person vp 
              ON v.visitor_id = vp.id
            INNER JOIN prisons.prisoner p 
              ON v.prisoner_id = p.id
            INNER JOIN persons.person pp
              ON p.person_id = pp.id
        ')->fetchAll();
    }
}
