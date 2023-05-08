INSERT INTO games (name, description, release_date) VALUES
  ('The Last of Us Part II', 'Un juego de acción y aventura post-apocalíptico.', '2020-06-19'),
  ('Ghost of Tsushima', 'Un juego de mundo abierto basado en el Japón feudal.', '2020-07-17'),
  ('God of War', 'Una reinvención de la saga de God of War con una nueva ambientación nórdica.', '2018-04-20'),
  ('Spider-Man', 'Un juego de acción basado en el popular superhéroe.', '2018-09-07'),
  ('Red Dead Redemption II', 'Un juego de mundo abierto ambientado en el viejo oeste.', '2018-10-26'),
  ('FIFA 21', 'Un juego de fútbol con licencia oficial de la FIFA.', '2020-10-09'),
  ('Assassin\'s Creed Odyssey', 'Un juego de acción y aventura ambientado en la antigua Grecia.', '2018-10-05'),
  ('Horizon Zero Dawn', 'Un juego de acción y aventura en un mundo post-apocalíptico habitado por máquinas.', '2017-02-28'),
  ('Minecraft', 'Un juego de construcción y aventura.', '2014-09-04'),
  ('Call of Duty: Modern Warfare', 'Un juego de disparos en primera persona ambientado en un conflicto moderno.', '2019-10-25'),
  ('NBA 2K21', 'Un juego de baloncesto con licencia oficial de la NBA.', '2020-09-04'),
  ('Uncharted 4: A Thief\'s End', 'Un juego de acción y aventura con el cazador de tesoros Nathan Drake.', '2016-05-10'),
  ('Final Fantasy VII Remake', 'Una reimaginación del clásico juego de rol de PlayStation.', '2020-04-10'),
  ('Resident Evil 2 Remake', 'Un remake del clásico juego de survival horror.', '2019-01-25'),
  ('Marvel\'s Avengers', 'Un juego de acción basado en los superhéroes de Marvel.', '2020-09-04'),
  ('Persona 5', 'Un juego de rol con una mezcla de vida estudiantil y combate de fantasía.', '2016-09-15'),
  ('The Witcher 3: Wild Hunt', 'Un juego de rol de mundo abierto basado en la serie de libros de The Witcher.', '2015-05-19'),
  ('Bloodborne', 'Un juego de rol y acción con temática de terror gótico.', '2015-03-24'),
  ('Grand Theft Auto V', 'Un juego de mundo abierto lleno de acción y aventura.', '2013-09-17'),
  ('The Elder Scrolls V: Skyrim', 'Un juego de rol de mundo abierto con un vasto mundo para explorar.', '2011-11-11'),
  ('Destiny 2', 'Un juego de disparos en primera persona con elementos de juego en línea.', '2017-09-06'),
  ('Uncharted: The Nathan Drake Collection', 'Una colección remasterizada de los primeros tres juegos de Uncharted.', '2015-10-09'),
  ('Ratchet & Clank', 'Un juego de plataformas y disparos lleno de acción y humor.', '2016-04-12'),
  ('Borderlands 3', 'Un juego de disparos en primera persona con un estilo de cómic y un vasto arsenal de armas.', '2019-09-13'),
  ('The Last Guardian', 'Un juego de aventuras y puzzles con una relación entre un niño y una criatura gigante.', '2016-12-06'),
  ('Fallout 4', 'Un juego de rol de mundo abierto ambientado en un mundo post-apocalíptico.', '2015-11-10'),
  ('Mortal Kombat 11', 'Un juego de lucha con una amplia selección de personajes y movimientos especiales.', '2019-04-23'),
  ('Resident Evil 7: Biohazard', 'Un juego de survival horror en primera persona con elementos de exploración y combate.', '2017-01-24'),
  ('Doom', 'Un juego de disparos en primera persona lleno de acción y demonios.', '2016-05-13'),
  ('Crash Bandicoot N. Sane Trilogy', 'Una colección remasterizada de los tres juegos clásicos de Crash Bandicoot.', '2017-06-30'),
  ('Watch Dogs 2', 'Un juego de mundo abierto de acción y aventura en un entorno urbano.', '2016-11-15'),
  ('The Division 2', 'Un juego de disparos en tercera persona con elementos de juego en línea.', '2019-03-15'),
  ('Sekiro: Shadows Die Twice', 'Un desafiante juego de acción y aventura ambientado en el Japón feudal.', '2019-03-22');
  
  INSERT INTO stock (idgame, stock, platform, price)
SELECT idgame, 100, 'Play Station 4', 3000
FROM games
WHERE idgame BETWEEN 33 AND 66;