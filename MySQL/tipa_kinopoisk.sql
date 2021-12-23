drop database if exists tipa_kinopoisk;
create database tipa_kinopoisk;

use tipa_kinopoisk;

drop table if exists directors;
create table directors (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  birthday DATE NOT NULL,
  birthplace VARCHAR(20) NOT NULL,
  family_status ENUM('Married', 'Divorced', 'Never married')
); -- 'Режиссеры, id начинаются с 9...'

drop table if exists actors;
create table actors(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  height FLOAT,
  birthday DATE NOT NULL,
  birthplace VARCHAR(20) NOT NULL,
  family_status ENUM('Married', 'Divorced', 'Never married', 'No info')
); -- 'Актеры, id начинаются с 7...'

drop table if exists movies;
create table movies(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(70) NOT NULL,
  director INT UNSIGNED NOT NULL,
  year INT UNSIGNED,
  FOREIGN KEY (director) REFERENCES directors(id)
); -- 'Главная информация о фильмах'

drop table if exists movie_page;
create table movie_page(
  movie_id INT UNSIGNED NOT NULL PRIMARY KEY,
  slogan TEXT,
  main_actor_1 INT UNSIGNED NOT NULL,
  main_actor_2 INT UNSIGNED NOT NULL,
  producer VARCHAR(50),
  composer VARCHAR (50),
  budget_usd INT UNSIGNED NOT NULL,
  box_office_us INT UNSIGNED,
  box_office_world INT UNSIGNED,
  restriction_rus ENUM ('0+', '6+', '12+', '16+', '18+'),
  MPAA ENUM ('G', 'PG', 'PG-13', 'R', 'NC-17'),
  duration_min INT UNSIGNED NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (main_actor_1) REFERENCES actors(id),
  FOREIGN KEY (main_actor_2) REFERENCES actors(id)
); -- 'Второстепенная информация о фильмах'

drop table if exists media_types;
create table media_types(
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  type VARCHAR(10) NOT NULL
); -- 'Типы медиа'

drop table if exists media;
create table media(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  movie_id INT UNSIGNED NOT NULL,
  filename VARCHAR(255) NOT NULL,
  type TINYINT UNSIGNED NOT NULL,
  path VARCHAR(255) NOT NULL,
  FOREIGN KEY (type) REFERENCES media_types(id),
  FOREIGN KEY (movie_id) REFERENCES movies(id)
); -- 'Хранилище медиа'

drop tables if exists grades;
create table grades(
  number TINYINT PRIMARY KEY
); -- 'Вспомогательная таблица для рейтингов'

drop table if exists users;
create table users(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  surname VARCHAR(20) NOT NULL,
  gender ENUM ('M', 'F'),
  birthday DATE NOT NULL,
  country VARCHAR(20) NOT NULL
); -- 'Пользователи'

drop tables if exists reviews;
create table reviews(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  from_user INT UNSIGNED NOT NULL,
  to_movie INT UNSIGNED NOT NULL,
  body TEXT,
  grade TINYINT,
  FOREIGN KEY (from_user) REFERENCES users(id),
  FOREIGN KEY (to_movie) REFERENCES movies(id),
  FOREIGN KEY (grade) REFERENCES grades(number)
); -- 'Пользовательские рецензии'

drop table if exists news;
create table news(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  movie_id INT UNSIGNED,
  body TEXT,
  FOREIGN KEY (movie_id) REFERENCES movies(id)
); -- 'Новости, статьи и обзоры редакции, id начинаются с 43...'

insert into directors values
  (9000, 'Robert Lee Zemekis', '1952-05-14', 'USA', 'Married'),
    (DEFAULT, 'George Walton Lucas, Jr.', '1944-05-14', 'USA', 'Married'),
    (DEFAULT, 'Denis Villeneuve', '1967-10-03', 'Canada', 'Married'),
    (DEFAULT, 'James Gunn', '1966-08-05', 'USA', 'Divorced'),
    (DEFAULT, 'Frank Darabont', '1959-01-28', 'France', 'Married'),
    (DEFAULT, 'Christopher Nolan', '1970-07-30', 'UK', 'Married'),
    (DEFAULT, 'Guy Ritchie', '1968-09-10', 'UK', 'Married'),
    (DEFAULT, 'Quentin Tarantino', '1963-03-27', 'USA', 'Married'),
    (DEFAULT, 'Martin Scorsese', '1942-11-17', 'USA', 'Married'),
    (DEFAULT, 'David Fincher', '1962-08-28', 'USA', 'Divorced');
    
insert into actors values
  (7000, 'Tom Hanks', 1.83, '1956-07-09', 'USA', 'Married'),
    (NULL, 'Brad Pitt', 1.8, '1963-12-18', 'USA', 'Divorced'),
    (NULL, 'Morgan Freeman', 1.88, '1937-06-01', 'USA', 'Divorced'),
    (NULL, 'Matthew McConaughey', 1.82, '1969-11-04', 'USA', 'Married'),
    (NULL, 'Leonardo DiCaprio', 1.83, '1974-11-11', 'USA', 'No info'),
    (NULL, 'Anne Hathaway', 1.73, '1982-11-12', 'USA', 'Married'),
    (NULL, 'Uma Thurman', 1.81, '1970-04-29', 'USA', 'Divorced'),
    (NULL, 'Keanu Reeves', 1.86, '1964-09-02', 'Lebanon', 'No info'),
    (NULL, 'Hugo Weaving', 1.9, '1960-04-04', 'Nigeria', 'Married'),
    (NULL, 'Scarlett Johansson', 1.6, '1984-11-22', 'USA', 'Married');

insert into grades values
  (0), (1), (2), (3), (4), (5),
    (6), (7), (8), (9), (10);

insert into movies values
  (NULL, 'Green Mile', 9004, 1999),
    (NULL, 'The Shawshank Redemption', 9004, 1994),
    (NULL, 'Forrest Gump', 9000, 1994),
    (NULL, 'Interstellar', 9005, 2014),
    (NULL, 'Lock, Stock and Two Smoking Barrels', 9006, 1998),
    (NULL, 'Pulp Fiction', 9007, 1994),
    (NULL, 'Inception', 9005, 2010),
    (NULL, 'Back to the Future', 9000, 1985),
    (NULL, 'Shutter Island', 9008, 2010),
    (NULL, 'Fight Club', 9009, 1999);

insert into media_types values
  (NULL, 'Teaser'), (NULL, 'Trailer'), (NULL, 'BTS'), 
  (NULL,'TV-Spot'), (NULL, 'Image');
  
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (1, 1, 'Non eos officia quia repellat.', 1, 'http://keebler.net/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (2, 2, 'Nisi tempore minus excepturi asperiores libero blanditiis.', 2, 'http://www.beer.com/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (3, 3, 'Quia magnam magnam iure nihil esse vel atque exercitationem.', 3, 'http://www.ritchiekilback.net/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (4, 4, 'Omnis fugiat dolores dolores enim alias placeat explicabo.', 4, 'http://eichmann.biz/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (5, 5, 'Dolor omnis est facere atque magnam voluptatem.', 5, 'http://emardflatley.com/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (6, 6, 'Laborum distinctio veritatis molestias laboriosam soluta quam odio.', 1, 'http://fritsch.biz/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (7, 7, 'Inventore cumque aliquid pariatur ut nemo est reprehenderit.', 2, 'http://www.denesikmills.com/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (8, 8, 'Sunt a ut at a sit voluptatem.', 3, 'http://conroy.biz/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (9, 9, 'Harum non cupiditate officiis quis maiores maxime consequuntur ipsam.', 4, 'http://gusikowski.info/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (10, 10, 'Quia suscipit assumenda dolores consequatur tempora asperiores voluptatem.', 5, 'http://lakin.info/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (11, 1, 'Non autem quibusdam odit qui earum enim velit.', 1, 'http://www.beattyrussel.com/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (12, 2, 'Ipsam amet ut sapiente illo blanditiis quibusdam.', 2, 'http://batz.info/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (13, 3, 'Et sit nam fuga voluptates omnis.', 3, 'http://hoeger.org/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (14, 4, 'Illum facere et accusamus corrupti.', 4, 'http://turner.com/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (15, 5, 'Qui eum modi ea.', 5, 'http://www.markskonopelski.com/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (16, 6, 'Sit quibusdam magni fuga ipsa et.', 1, 'http://cassin.biz/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (17, 7, 'Non minima perspiciatis ut maxime voluptatem.', 2, 'http://www.reichel.org/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (18, 8, 'Voluptatem repellat nihil iusto ullam eligendi.', 3, 'http://www.mayert.com/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (19, 9, 'Et dolor aut nam dignissimos.', 4, 'http://www.flatley.com/');
INSERT INTO `media` (`id`, `movie_id`, `filename`, `type`, `path`) VALUES (20, 10, 'Sed laborum odit harum sed ipsa.', 5, 'http://www.hackettgrady.com/');

INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (1, 'Soluta reprehenderit illo quidem aliquam.', 7000, 7000, 'Mrs. Jakayla McGlynn Sr.', 'Evalyn Crist', 32291, 46765387, 338450643, '12+', 'PG-13', 16);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (2, 'Delectus consectetur reprehenderit consequatur nostrum nihil incidunt.', 7001, 7001, 'Estel Howell', 'Quincy Sporer', 356443, 1656656, 6872, '16+', 'PG-13', 14);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (3, 'A dolores veniam earum laboriosam dolor iusto occaecati.', 7002, 7002, 'Marta O\'Kon V', 'Nicole Marvin', 13708, 103805, 7292612, '12+', 'NC-17', 20);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (4, 'Modi rerum aut accusamus reprehenderit perspiciatis vitae.', 7003, 7003, 'Miss Marilyne Cronin DVM', 'Ezra Littel', 5, 21731768, 5334523, '12+', 'G', 9);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (5, 'In ut esse praesentium aut esse.', 7004, 7004, 'Kennedy Harris', 'Prof. Alta Feest DDS', 0, 61, 7551592, '0+', 'PG', 23);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (6, 'Dolore qui sit ab maiores id expedita est.', 7005, 7005, 'Dr. Bertram Harber Jr.', 'Tremaine Fisher', 100, 89537719, 28, '18+', 'NC-17', 7);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (7, 'Reiciendis eius corporis omnis soluta.', 7006, 7006, 'Taylor Bernhard', 'Zion O\'Conner', 184, 0, 15, '0+', 'R', 0);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (8, 'Non corporis non possimus et.', 7007, 7007, 'Noah Homenick', 'Ms. Brigitte Hayes', 13, 800768, 245604, '6+', 'G', 10);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (9, 'Nemo et omnis ipsum est officia assumenda.', 7008, 7008, 'Mrs. Gerda Gaylord DDS', 'Agustin D\'Amore', 59159790, 2194853, 69, '0+', 'PG-13', 1);
INSERT INTO `movie_page` (`movie_id`, `slogan`, `main_actor_1`, `main_actor_2`, `producer`, `composer`, `budget_usd`, `box_office_us`, `box_office_world`, `restriction_rus`, `MPAA`, `duration_min`) VALUES (10, 'Doloribus id aut aut nam aut molestiae est.', 7009, 7009, 'Mrs. Emmy Bernier Jr.', 'Dr. Valerie Greenfelder V', 0, 0, 7204683, '6+', 'R', 15);

INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (1, 1, 'Temporibus amet sit similique. Quos ullam cupiditate repellat quos. Modi eos ea odio placeat nemo voluptatem. Provident et natus omnis totam sint id eligendi.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (2, 2, 'Vitae et iste deleniti qui. Unde consequatur molestiae itaque consequatur.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (3, 3, 'Quae rerum quia molestiae soluta consequatur quia. Delectus est magnam nemo repudiandae sit saepe labore.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (4, 4, 'Molestias dolorum nulla totam provident optio et tenetur illo. Non sapiente ratione voluptatibus pariatur. Rerum ipsam deleniti ut architecto.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (5, 5, 'Minus aspernatur tenetur magnam laboriosam at alias a. Magni vitae quisquam ea sint quia accusamus.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (6, 6, 'Ratione aut eum reiciendis dolores nam. Voluptas ut cum non a. Aut doloremque odio dolorem repellat placeat ea cumque. Commodi qui perspiciatis qui quaerat.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (7, 7, 'Voluptatem in est fugiat quia sapiente rerum ipsam molestiae. Voluptas aut repellendus ullam sint. Sapiente reiciendis voluptatem et repudiandae facilis debitis.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (8, 8, 'Adipisci porro error qui similique sed. Minus voluptas hic facilis distinctio ut. Vel et a officiis at nulla quos.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (9, 9, 'Ad eaque necessitatibus natus libero autem itaque soluta. Nostrum aut eaque iusto hic repudiandae. Dolorem cum quo quia et.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (10, 10, 'Molestiae eum dolore accusamus voluptatem quos eius. Voluptatum ipsum sit nisi iste perferendis. Excepturi quo quia qui dolorum fuga soluta dolorem. Ut nulla voluptatem sed esse quia.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (11, 1, 'Laboriosam qui sit sint et ipsa laborum nesciunt et. Fugit qui sint totam dicta velit. Voluptate ratione et eos quam eos.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (12, 2, 'Deleniti reiciendis aut quisquam nihil voluptate. Quos maxime voluptate provident quo. Officiis eum sint esse modi eligendi illo.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (13, 3, 'Natus maxime vitae ducimus soluta ut. Velit soluta dolores tenetur repellat sunt debitis ab. Omnis harum accusamus adipisci nesciunt aut aut officia. Non non est atque delectus.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (14, 4, 'Deleniti rerum accusantium iusto. Quia mollitia aperiam itaque voluptatibus ratione consequatur laborum. Sed ab saepe impedit non. Maxime earum eum ad cum quia qui.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (15, 5, 'Ad voluptates non dolorem sunt. Officiis quos animi harum temporibus aspernatur aut est. Consequuntur voluptate dolores quo ut beatae. Distinctio incidunt doloribus nihil fugit eos ex quasi.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (16, 6, 'Rerum et nulla non rerum. Ut nemo at et velit vitae est praesentium. Aliquam laudantium ut et autem. Suscipit velit autem repellat eveniet dolorem.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (17, 7, 'Est itaque et ducimus minus eaque doloremque voluptas. Qui molestias illo optio fugit at quidem quia. Magni enim saepe sed quaerat est adipisci temporibus.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (18, 8, 'Iusto earum similique aliquam qui eum sit debitis hic. Ut sed possimus perferendis vero asperiores quam. Est et id occaecati excepturi delectus vitae.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (19, 9, 'Soluta suscipit autem magni modi. Tempore ex vitae laborum culpa aspernatur sunt porro quidem. Aperiam voluptate harum voluptatem molestiae qui veniam perspiciatis. Natus inventore eos quo cumque.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (20, 10, 'Odio totam blanditiis perferendis quod quia voluptas quisquam qui. Sit ut et error animi velit non. Quae voluptas asperiores voluptates itaque voluptate dolore.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (21, 1, 'Deserunt ullam repudiandae nulla itaque nam est ut. Cupiditate minima perferendis in deleniti. Enim et aut deleniti architecto adipisci pariatur non.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (22, 2, 'Quidem consequatur architecto iste doloribus recusandae quis. Ea quaerat ut exercitationem dignissimos vel. Repellendus perferendis eveniet et exercitationem esse ut.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (23, 3, 'Pariatur quas reprehenderit id. Sit qui autem quas ratione. Ut quo quis doloribus explicabo aut perferendis enim. Perferendis ex tempore consectetur aliquid.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (24, 4, 'Nisi quam molestiae ad voluptate. Natus et mollitia eaque debitis laboriosam. Dolor harum corrupti cum a mollitia vero rerum.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (25, 5, 'Placeat praesentium aut et mollitia dolores. Nemo sint aliquid voluptatem delectus aliquam architecto adipisci. Temporibus sed et repellendus autem.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (26, 6, 'Velit quo dolores aut. Est aut quaerat veritatis repudiandae fuga quo officiis. Officiis eveniet praesentium aliquam animi ea. Deleniti expedita illum ut molestias aliquid enim alias nihil.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (27, 7, 'Fugiat quasi pariatur dolores voluptas architecto est. Cumque consequatur impedit odio dolores. Aut perferendis rerum veniam laboriosam blanditiis esse. Quia odio eos quod incidunt nam.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (28, 8, 'Quod aut soluta assumenda rerum aut id modi molestias. Eaque cum modi deserunt eum ab iusto. Nemo omnis itaque quia et quis nostrum dolore sint. Porro ipsa a nisi.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (29, 9, 'Atque voluptatem ipsum laudantium rerum. Eius vel mollitia rerum quidem. Nemo laboriosam sapiente sint sint et soluta quam rerum. Rerum vel in non ut dolore eum.');
INSERT INTO `news` (`id`, `movie_id`, `body`) VALUES (30, 10, 'Quisquam accusamus recusandae officia. Accusantium impedit perspiciatis quia ad. Velit earum dolorem sequi ut libero omnis consectetur qui.');

INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (1, 'Carlee', 'Ledner', 'M', '2003-05-17', 'Saint Helena');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (2, 'Jaden', 'Nikolaus', 'F', '1994-04-20', 'New Zealand');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (3, 'Einar', 'Harvey', 'M', '1997-11-20', 'South Africa');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (4, 'Shania', 'Leuschke', 'F', '1989-11-01', 'Guinea-Bissau');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (5, 'Tiana', 'Graham', 'F', '1988-07-24', 'Australia');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (6, 'Adeline', 'Paucek', 'M', '2005-03-17', 'Aruba');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (7, 'Queen', 'Batz', 'F', '1992-04-26', 'Poland');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (8, 'Garfield', 'Jakubowski', 'F', '1972-07-18', 'Argentina');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (9, 'Allan', 'Langosh', 'F', '1990-07-26', 'Slovakia (Slovak Rep');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (10, 'Andre', 'Pollich', 'M', '2003-01-09', 'Denmark');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (11, 'Rita', 'Kunze', 'F', '1983-11-07', 'Palau');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (12, 'Forrest', 'Jenkins', 'M', '2007-12-30', 'Western Sahara');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (13, 'Derick', 'Schroeder', 'F', '2002-05-27', 'Pakistan');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (14, 'Jovani', 'Price', 'F', '1994-09-14', 'Cyprus');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (15, 'Pinkie', 'Ruecker', 'M', '2007-03-08', 'Somalia');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (16, 'Vanessa', 'Williamson', 'M', '1972-10-18', 'Saudi Arabia');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (17, 'Meghan', 'Nikolaus', 'F', '1975-07-30', 'Montserrat');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (18, 'Randy', 'Schumm', 'F', '1985-02-11', 'India');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (19, 'Fritz', 'DuBuque', 'F', '2018-10-09', 'Pakistan');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (20, 'Ariel', 'Price', 'F', '1971-03-22', 'Timor-Leste');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (21, 'Ali', 'Hirthe', 'F', '1982-12-15', 'Antigua and Barbuda');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (22, 'Sarina', 'O\'Keefe', 'F', '2016-01-19', 'Micronesia');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (23, 'Willa', 'Botsford', 'M', '2007-08-02', 'Haiti');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (24, 'Elvera', 'Aufderhar', 'F', '1978-04-22', 'Tunisia');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (25, 'Gerda', 'Mann', 'F', '2020-05-11', 'Macedonia');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (26, 'Jada', 'Gerlach', 'F', '2010-09-02', 'Bahamas');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (27, 'Andres', 'Leuschke', 'M', '2009-04-20', 'Somalia');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (28, 'Dannie', 'Corkery', 'F', '2010-06-26', 'Western Sahara');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (29, 'Brandt', 'Stracke', 'F', '1996-12-05', 'Cook Islands');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (30, 'Elroy', 'Gerhold', 'F', '2000-07-01', 'Greece');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (31, 'Wilhelmine', 'Schmitt', 'F', '2009-08-05', 'Malta');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (32, 'Amparo', 'Beier', 'F', '1980-06-26', 'Uruguay');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (33, 'Burdette', 'Berge', 'M', '2001-06-29', 'Nepal');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (34, 'Christina', 'Satterfield', 'M', '1992-07-07', 'Malawi');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (35, 'Ricardo', 'O\'Reilly', 'F', '2012-01-31', 'Bermuda');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (36, 'Vicenta', 'Bradtke', 'M', '2010-12-18', 'Brunei Darussalam');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (37, 'Brendan', 'Parisian', 'F', '2021-06-07', 'Saint Barthelemy');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (38, 'Milo', 'Kris', 'F', '2021-05-23', 'Fiji');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (39, 'Brandt', 'Stracke', 'M', '1987-07-24', 'Uzbekistan');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (40, 'Kendrick', 'Schoen', 'F', '2008-03-17', 'Aruba');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (41, 'Justine', 'Abbott', 'M', '1979-11-29', 'Nepal');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (42, 'Estrella', 'Kub', 'M', '1970-05-17', 'Barbados');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (43, 'Mina', 'Russel', 'F', '1986-03-27', 'Andorra');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (44, 'Blaze', 'Renner', 'F', '1991-02-23', 'American Samoa');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (45, 'Bethany', 'Haag', 'F', '2017-02-14', 'Netherlands Antilles');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (46, 'Lavinia', 'Spencer', 'F', '1987-04-03', 'Costa Rica');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (47, 'Savannah', 'Fadel', 'M', '1985-12-20', 'Bhutan');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (48, 'Arielle', 'Harris', 'F', '2012-07-11', 'Egypt');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (49, 'Benton', 'Jaskolski', 'F', '1974-10-13', 'Tajikistan');
INSERT INTO `users` (`id`, `name`, `surname`, `gender`, `birthday`, `country`) VALUES (50, 'Charity', 'Durgan', 'M', '1997-10-25', 'Turkey');

INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (1, 1, 1, 'Consequatur nihil nobis qui veniam doloremque tenetur. Sed facilis illum in libero. Exercitationem earum suscipit ipsum aut maiores ut hic. Nemo sunt delectus nemo odit facere soluta et aut.', 5);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (2, 2, 2, 'Commodi aut quas id adipisci cupiditate nihil aut. Accusantium praesentium fuga asperiores voluptatem sit consequuntur dolor. Fuga repudiandae reiciendis voluptatibus enim non sint ea. Consequatur dignissimos iure mollitia sed provident quis voluptate.', 5);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (3, 3, 3, 'Natus nostrum dicta similique. Ut accusamus quaerat hic rem iusto corporis in ut. Corrupti provident voluptatem et atque at iste explicabo. Voluptatibus quia dolores placeat doloremque exercitationem dolor ad.', 6);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (4, 4, 4, 'Ratione quam temporibus commodi deserunt libero necessitatibus error. Magni rerum optio ut. Veritatis qui non consequuntur.', 8);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (5, 5, 5, 'Corporis eaque laborum magnam. Corporis quo laudantium incidunt ratione. Voluptatem excepturi reprehenderit repellendus ut temporibus iure.', 4);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (6, 6, 6, 'Et aut delectus voluptatum sed saepe consectetur. Quasi qui est aut. Est doloremque et laudantium minus laborum. Voluptatem saepe necessitatibus ducimus eum a.', 9);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (7, 7, 7, 'Quo eius quidem quos. Eos aut culpa ipsam quo rerum vel doloribus. Velit voluptate similique quis velit. Minus minima ab mollitia et.', 7);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (8, 8, 8, 'Veritatis rem et totam vel optio natus nobis. A quia similique non modi. Quod eos ad debitis et ut. Voluptas occaecati ullam sit aut minus cupiditate.', 3);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (9, 9, 9, 'Deleniti hic voluptatibus sit pariatur quia et quidem. Provident commodi doloremque repellendus laudantium.', 4);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (10, 10, 10, 'Et animi et tenetur illum deleniti veritatis qui. Omnis quia consequuntur nihil illum illum ullam. Deserunt perspiciatis corporis aut quia sed.', 7);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (11, 11, 1, 'Quis ut ut fuga officia earum. Voluptas quae incidunt excepturi quibusdam architecto ut beatae aliquam. Ut cumque deserunt nobis harum quae.', 6);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (12, 12, 2, 'Cumque quia placeat unde ut asperiores sapiente. Mollitia commodi et blanditiis laborum aliquam est velit. Consequatur neque nobis ipsam et.', 0);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (13, 13, 3, 'Perferendis laboriosam et enim vero earum est voluptates. Voluptas totam exercitationem voluptatum molestias quo sint. Consequatur voluptatem adipisci rerum perferendis. Exercitationem praesentium delectus temporibus qui omnis praesentium.', 3);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (14, 14, 4, 'Atque quis quo dolorem maxime adipisci. Mollitia tempore et consequatur fuga adipisci quia tempore in. Perferendis provident praesentium corporis laudantium.', 6);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (15, 15, 5, 'Voluptates quam distinctio reiciendis repellendus consectetur est quisquam quisquam. Ea amet aliquid molestiae aliquam molestiae. Eligendi dolorem ut et sint aperiam iusto ipsa. Eos enim placeat rerum eum.', 4);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (16, 16, 6, 'Voluptate ullam qui eveniet est dolores labore. Est voluptatibus dolor optio non.', 0);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (17, 17, 7, 'Veritatis ut sed corrupti ex. Non consequuntur provident reiciendis eius. Et quod ut consequatur eligendi. Est sapiente deserunt quia reiciendis error cum. Non voluptas et architecto quia beatae molestiae.', 5);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (18, 18, 8, 'Eum ex ut delectus quod. Nihil libero commodi voluptas quaerat laboriosam quis. Maiores quidem porro maxime voluptatem. Architecto sed rem et sed magni.', 8);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (19, 19, 9, 'Minus ea nam animi nesciunt aliquid. Temporibus rerum sit laudantium labore animi atque qui corrupti. Id aut hic perspiciatis quis. Sed adipisci quidem delectus voluptatem sed dolorem. Unde voluptate quibusdam velit aut accusantium impedit tempore.', 0);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (20, 20, 10, 'Cumque ut illo voluptatem numquam. Accusamus occaecati officiis natus. Eveniet accusantium est nobis non eaque et ducimus. Et perferendis dolorem et est est. Illo quis iusto nostrum explicabo.', 7);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (21, 21, 1, 'Esse sed totam est rem aut facere non. Ut dicta voluptate eaque sit illum necessitatibus. Maiores alias doloribus totam accusamus.', 3);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (22, 22, 2, 'Temporibus dignissimos neque sunt. A molestiae alias in nihil eos ipsum non. Doloribus est officiis in culpa. Esse incidunt doloremque dignissimos consequuntur sit. Et qui soluta accusamus praesentium.', 4);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (23, 23, 3, 'Quo consequatur beatae officiis exercitationem. Est eum at fugiat earum enim molestiae aliquam. Unde et vel pariatur consequatur.', 0);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (24, 24, 4, 'Qui sed quidem molestiae aperiam occaecati. Sed atque voluptates iusto incidunt consequuntur dolores. Similique sit sit ipsam quas explicabo.', 0);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (25, 25, 5, 'Sed error nesciunt repellat quas corporis fuga labore. Veritatis impedit in sunt qui architecto iure.', 9);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (26, 26, 6, 'Est voluptatum esse non numquam omnis. Odio eaque ad ut et consectetur cupiditate.', 4);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (27, 27, 7, 'Consequuntur reprehenderit sit ipsam ut omnis qui facere pariatur. Voluptatum voluptatem neque ducimus ex veniam debitis. Consectetur minima qui facere autem dolorem excepturi dolorem.', 8);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (28, 28, 8, 'Voluptas sed ut sequi voluptate explicabo. Labore est non sunt ut et aspernatur. Itaque impedit pariatur blanditiis vel.', 2);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (29, 29, 9, 'Ipsam ut in vel blanditiis sed velit id maxime. Ipsum qui vitae totam eius. Vero dolorem impedit nesciunt rerum.', 4);
INSERT INTO `reviews` (`id`, `from_user`, `to_movie`, `body`, `grade`) VALUES (30, 30, 10, 'In molestias expedita labore nemo qui ex amet. Dolores nisi fugit ut non ad illum rerum. Vero autem expedita ut dicta. Non fugit officia autem sint recusandae possimus quod.', 2);

