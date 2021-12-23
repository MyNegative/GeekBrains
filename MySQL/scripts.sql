-- Скрипты характерных выборок
-- Посмотреть название фильма и имя режиссера
select movies.title, directors.name from movies join directors
	on movies.director = directors.id;
    
-- Посчитать общее количество фильмов у каждого режиссера
select directors.name, count(*)  
	from movies join directors 
    on movies.director = directors.id
    group by director;
    
-- Найти кино по режиссеру с помощью вложенного запроса
select title from movies
	where director = (select id from directors where name = 'Frank Darabont');

-- Хранимая процедура: рандомный фильм на вечер
drop procedure if exists smth_to_watch;
delimiter //
create procedure smth_to_watch()
begin
	select movies.title, directors.name, movies.year from movies join directors
		on movies.director = directors.id 
		order by rand() limit 1;
end//
delimiter ;

-- Создадим представление feedback, куда включим отзывы и оценки пользователей на те или иные фильмы
create or replace view feedback 
	as select concat(users.name, ' ', users.surname) as user, movies.title, reviews.body, reviews.grade 
		from reviews join users join movies
		on reviews.from_user = users.id
		and reviews.to_movie = movies.id;

-- Создадим представление rating, чтобы узнать пользовательский рейтинг фильмов
create or replace view rating
	as select movies.title, round(avg(reviews.grade), 2) as rating
		from movies join reviews
		on reviews.to_movie = movies.id
		group by movies.title
		order by rating desc;

/* В 2020-х по всему миру, в основном на Западе, стала набирать 
обороты так называемая "культура отмены". Так почему бы не сделать
триггер и не убирать отовсюду фильмы опальных режиссеров?*/
drop trigger if exists cancel;
delimiter //
create trigger cancel after delete on directors
for each row
begin
	delete from movies where director = old.id;
end//
delimiter ;
