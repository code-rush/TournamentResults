-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- players table that keeps track for player's name and assigns them a unique id
create table players(
	id serial primary key, 
	name text
	);

-- matches table that keeps track of the wins and lose of the players
create table matches(
	id serial primary key, 
	winner integer references players (id), 
	loser integer references players (id)
	);

-- view created to calculate number of wins of each player
create view number_of_wins as 
	select players.id, count(matches.winner) as wins 
	from players left join matches on players.id = matches.winner 
	group by players.id;

-- view created to calculate number of matches played by a player
create view matches_played as 
	select players.id, count(matches.id) as number_of_matches 
	from players left join matches on players.id = matches.winner or 
	players.id = matches.loser
	group by players.id;

-- view created to get the players matches and wins.
create view standings as 
	select players.id, players.name, number_of_wins.wins, 
	matches_played.number_of_matches
	from players 
	join number_of_wins on players.id = number_of_wins.id 
	join matches_played on players.id = matches_played.id 
	order by wins desc;