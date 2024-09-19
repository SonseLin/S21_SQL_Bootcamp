SELECT p.name AS name, COUNT(pv.id) AS count_of_visits
FROM person p LEFT JOIN person_visits pv ON pv.person_id = p.id
GROUP BY p.id
HAVING COUNT(pv.id) > 3
ORDER BY count_of_visits DESC, p.id ASC;