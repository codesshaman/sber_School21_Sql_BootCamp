WITH info_pizza AS 
(SELECT * FROM menu WHERE pizza_name = 'mushroom pizza', 'pepperoni pizza'),
    info_menu AS
(SELECT name AS pizzeria_name, id FROM pizzeria)

SELECT pizza_name, pizzeria_name, price
FROM info_pizza
	JOIN
info_menu ON info_pizza.pizzeria_id = info_menu.id
ORDER BY pizza_name, pizzeria_name;
