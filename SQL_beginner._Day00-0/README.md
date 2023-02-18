# День 00 - Интенсив SQL

## _Реляционная модель данных и SQL_

Резюме: Сегодня вы увидите, как работает реляционная модель и как получить необходимые данные на основе базовых конструкций SQL.

## Содержание

1. [Глава I](#chapter-i) \
    1.1. [Преамбула](#preamble)
2. [Глава II](#chapter-ii) \
    2.1. [Основные правила](#general-rules)
3. [Глава III](#chapter-iii) \
    3.1. [Правила дня ](#rules-of-the-day)  
4. [Глава IV](#chapter-iv) \
    4.1. [Упражнение 00 - Первые шаги в мир SQL](#exercise-00-first-steps-into-sql-world)  
5. [Глава V](#chapter-v) \
    5.1. [Упражнение 01 - Первые шаги в мир SQL](#exercise-01-first-steps-into-sql-world)  
6. [Глава VI](#chapter-vi) \
    6.1. [Упражнение 02 - Первые шаги в мир SQL](#exercise-02-first-steps-into-sql-world)  
7. [Глава VII](#chapter-vii) \
    7.1. [Упражнение 03 - Первые шаги в мир SQL](#exercise-03-first-steps-into-sql-world)  
8. [Глава VIII](#chapter-viii) \
    8.1. [Упражнение 04 - Первые шаги в мир SQL](#exercise-04-first-steps-into-sql-world)
9. [Глава IX](#chapter-ix) \
    9.1. [Упражнение 05 - Первые шаги в мир SQL](#exercise-05-first-steps-into-sql-world)
10. [Глава X](#chapter-x) \
    10.1. [Упражнение 06 - Первые шаги в мир SQL](#exercise-06-first-steps-into-sql-world)
11. [Глава XI](#chapter-xi) \
    11.1. [Упражнение 07 - Первые шаги в мир SQL](#exercise-07-first-steps-into-sql-world)
12. [Глава XII](#chapter-xii) \
    12.1. [Упражнение 08 - Первые шаги в мир SQL](#exercise-08-first-steps-into-sql-world)
13. [Глава XIII](#chapter-xiii) \
    13.1. [Упражнение 09 - Первые шаги в мир SQL](#exercise-09-first-steps-into-sql-world)

## Глава I
## Преамбула

![D01_01](misc/images/D01_01.png)

Стандарты повсюду, и реляционные базы данных тоже под контролем :-). Честно говоря, более ограниченные стандарты SQL были в начале 2000-х годов. На самом деле, когда родился паттерн «Большие данные», у реляционных баз данных был свой способ реализации этого паттерна, и поэтому стандарты сейчас более… легковесны. 

![D01_02](misc/images/D01_02.png)

Ознакомьтесь с приведенными ниже стандартами SQL и подумайте о будущем реляционных баз данных.

|  |  |
| ------ | ------ |
| ![D01_03](misc/images/D01_03.png) | ![D01_04](misc/images/D01_04.png) |
| ![D01_05](misc/images/D01_05.png) | ![D01_06](misc/images/D01_06.png) |
| ![D01_07](misc/images/D01_07.png) | ![D01_08](misc/images/D01_08.png) |

## Глава II
## Основные правила

- Используйте эту страницу как единственную инструкцию. Не слушайте никаких слухов и домыслов о том, как подготовить своё решение.
- Пожалуйста, убедитесь, что вы используете последнюю версию PostgreSQL.
- Это совершенно нормально, если вы используете IDE для написания исходного кода (он же SQL-скрипт).
- Для оценки ваше решение должно находиться в вашем репозитории GIT.
- Ваши решения будут оценены вашими товарищами по интенсиву.
- Вы не должны оставлять в своем каталоге никаких других файлов, кроме тех, которые явно указаны в инструкциях к упражнению. Рекомендуется изменить ваш .gitignoreчтобы избежать случайностей.
- У вас есть вопрос? Спросите у соседа справа. Если не помогло - попробуйте с соседом слева.
- Ваш справочник: товарищи/интернет/гугл.
- Внимательно прочитайте примеры. Они могут понять вещи, которые иначе не указаны в задании. 
- И да прибудет с вами сила SQL!
- Абсолютно все можно представить в SQL! Давайте начнем и получайте удовольствие!

## Глава III
## Правила дня

- Убедитесь, что у вас есть собственная база данных и доступ к ней в вашем кластере PostgreSQL.
- Загрузите скрипт с моделью базы данных здесь и примените его к своей базе данных (вы можете использовать командную строку с psql или просто запустить его через любую IDE, например DataGrip от JetBrains или pgAdmin от сообщества PostgreSQL).
- Все задачи содержат список разрешенных и запрещенных разделов с перечисленными параметрами базы данных, типами баз данных, конструкциями SQL и т. д. Пожалуйста, ознакомьтесь с разделом перед началом.
- Пожалуйста, взгляните на логическое представление нашей модели базы данных.

![schema](misc/images/schema.png)


1. Таблица **pizzeria** (Таблица-словарь с доступными пиццериями)
- поле ``id`` - первичный ключ (primary key)
- поле ``name`` - название пиццерии
- поле ``rating`` - средний рейтинг пиццерии (от 0 до 5 баллов)
2. Таблица **person** (Таблица-словарь с людьми, которые любят пиццу)
- поле ``id`` - первичный ключ (primary key)
- поле ``name`` - имя человека
- поле ``age`` - возраст человека
- поле ``gender`` - пол человека
- поле ``address`` - адрес человека
3. Таблица **menu** (Таблица-словарь с доступным меню и ценой на конкретную пиццу)
- поле ``id`` - первичный ключ (primary key)
- поле ``pizzeria_id`` - внешний ключ к пиццерии
- поле ``pizza_name`` - название пиццы в пиццерии
- поле ``price`` - цена конкретной пиццы
4. Таблица **person_visits** (Операционная таблица с информацией о посещениях пиццерии)
- поле ``id`` - первичный ключ (primary key)
- поле ``person_id`` - внешний ключ к человеку
- поле ``pizzeria_id`` - внешний ключ к пиццерии
- поле ``visit_date`` - дата (например 2022-01-01) посещения пиццерии человеком
5. Таблица **person_order** (операционная таблица с информацией о заказах людей)
- поле ``id`` - первичный ключ (primary key)
- поле ``person_id`` - внешний ключ к человеку
- поле ``menu_id`` - внешний ключ к меню
- поле ``order_date`` - дата (например 2022-01-01) заказа человека

Посещение (visit_date) и заказ (order_date) - это разные сущности, и нет никакой корреляции между их данными. Например, клиент может находиться в одном месте (просто просматривая меню) и в это время сделать заказ в другом по телефону или с помощью мобильного приложения. Или позвонить из дома с заказом без каких-либо визитов.

## Глава IV
## Упражнение 00 - Первые шаги в мир SQL

| Упражнение 00: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                    | ex00                                                                                                                     |
| Файлы для сдачи                      | `day00_ex00.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |

Let’s make our first task. 
Please make a select statement which returns all person's names and person's ages from the city ‘Kazan’.


## Глава V
## Упражнение 01 - Первые шаги в мир SQL

| Упражнение 01: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex01                                                                                                                     |
| Файлы для сдачи                      | `day00_ex01.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |

Please make a select statement which returns names , ages for all womens from the city ‘Kazan’. Yep, and please sort result by name.

## Глава VI
## Упражнение 02 - Первые шаги в мир SQL

| Упражнение 02: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex02                                                                                                                     |
| Файлы для сдачи                      | `day00_ex02.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |

Please make 2 syntax different select statements which return a list of pizzerias (pizzeria name and rating) with rating between 3.5 and 5 points (including limit points) and ordered by pizzeria rating.
- the 1st select statement must contain comparison signs  (<=, >=)
- the 2nd select statement must contain `BETWEEN` keyword

## Глава VII
## Упражнение 03 - Первые шаги в мир SQL

| Упражнение 03: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex03                                                                                                                     |
| Файлы для сдачи                      | `day00_ex03.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |

Please make a select statement which returns the person's identifiers (without duplication) which visited pizzerias in a period from 6th of January 2022 to 9th of January 2022 (including all days) or visited pizzeria with identifier 2. Also include ordering clause by person identifier in descending mode.

## Глава VIII
## Упражнение 04 - Первые шаги в мир SQL


| Упражнение 04: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex04                                                                                                                     |
| Файлы для сдачи                      | `day00_ex04.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |

Please make a select statement which returns one calculated field with name ‘person_information’ in one string like described in the next sample:

`Anna (age:16,gender:'female',address:'Moscow')`

Finally , please add the ordering clause by calculated column in ascending mode.
Please pay attention to quote symbols in your formula!

## Глава IX
## Упражнение 05 - Первые шаги в мир SQL


| Упражнение 05: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex05                                                                                                                     |
| Файлы для сдачи                      | `day00_ex05.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |
| **Запрещено**                               |                                           
| Синтаксические конструкции SQL                        | `IN`, any types of `JOINs`                                                                                              |

Please make a select statement which returns person's names (based on internal query in `SELECT` clause) which made orders for the menu with identifiers 13 , 14 and 18 and date of orders should equal 7th of January 2022. Please be aware with "Denied Section" before your work.

Please take a look at the pattern of internal query.

    SELECT 
	    (SELECT ... ) AS NAME  -- this is an internal query in a main SELECT clause
    FROM ...
    WHERE ...

## Глава X
## Упражнение 06 - Первые шаги в мир SQL


| Упражнение 06: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex06                                                                                                                     |
| Файлы для сдачи                      | `day00_ex06.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |
| **Запрещено**                               |                                           
| Синтаксические конструкции SQL                       | `IN`, any types of `JOINs`                                                                                              |

Please use SQL construction from Exercise 05 and add a new calculated column (use column's name ‘check_name’) with a check statement (a pseudo code for this check is presented below) in the `SELECT` clause.

    if (person_name == 'Denis') then return true
        else return false

## Глава XI
## Упражнение 07 - Первые шаги в мир SQL


| Упражнение 07: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex07                                                                                                                     |
| Файлы для сдачи                      | `day00_ex07.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |

Let’s apply data intervals for the `person` table. 
Please make a SQL statement which returns a person's identifiers, person's names and interval of person’s ages (set a name of a new calculated column as ‘interval_info’) based on pseudo code below. 

    if (age >= 10 and age <= 20) then return 'interval #1'
    else if (age > 20 and age < 24) then return 'interval #2'
    else return 'interval #3'

and yes...please sort a result by ‘interval_info’ column in ascending mode.

## Глава XII
## Упражнение 08 - Первые шаги в мир SQL


| Упражнение 08: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex08                                                                                                                     |
| Файлы для сдачи                      | `day00_ex08.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |

Please make a SQL statement which returns all columns from the `person_order` table with rows whose identifier is an even number. The result have to order by returned identifier.

## Глава XIII
## Упражнение 09 - Первые шаги в мир SQL


| Упражнение 09: Первые шаги в мир SQL |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Каталог для сдачи                     | ex09                                                                                                                     |
| Файлы для сдачи                     | `day00_ex09.sql`                                                                                 |
| **Разрешено**                               |                                                                                                                          |
| Язык                        | ANSI SQL                                                                                              |
| **Запрещено**                               |                                           
| Синтаксические конструкции SQL                       | any types of `JOINs`                                                                                              |


Please make a select statement that returns person names and pizzeria names based on the `person_visit` table with date of visit in a period from 07th of January to 09th of January 2022 (including all days) (based on internal query in `FROM` clause) .


Please take a look at the pattern of the final query.

    SELECT (...) AS person_name ,  -- this is an internal query in a main SELECT clause
            (...) AS pizzeria_name  -- this is an internal query in a main SELECT clause
    FROM (SELECT … FROM person_visits WHERE …) AS pv -- this is an internal query in a main FROM clause
    ORDER BY ...

Please add a ordering clause by person name in ascending mode and by pizzeria name in descending mode

