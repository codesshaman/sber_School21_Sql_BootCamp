SELECT table1.action_date, table2.name, person.name AS person_name
FROM (
    (SELECT order_date AS action_date, person_id FROM person_order
    	INTERSECT
    SELECT visit_date, person_id FROM person_visits) AS table1
    	JOIN
    (SELECT name, id FROM person) AS table2 ON table1.person_id = table2.id)
ORDER BY action_date ASC, person_name DESC;
