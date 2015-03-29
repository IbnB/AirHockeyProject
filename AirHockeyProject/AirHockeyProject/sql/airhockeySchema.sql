PRAGMA foreign_keys = ON;
.open airhockey.sqlite3
-- Creates our air hockey schema

DROP TABLE IF EXISTS stats;
CREATE TABLE stats (
	id INTEGER PRIMARY KEY,
	games_completed INTEGER,
	games_exited INTEGER,
	games_won INTEGER,
	games_lost INTEGER,
	games_tied INTEGER,
	time_played INTEGER, 
	goals_scored INTEGER,
	goals_against INTEGER

);

DROP TABLE IF EXISTS settings;
CREATE TABLE settings (
	id INTEGER PRIMARY KEY,
	friction REAL, 
	p1_paddle_radius REAL,
	p2_paddle_radius REAL,
	puck_radius REAL,
	time INTEGER,
	goals INTEGER,
	ai_difficulty INTEGER
);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	username TEXT PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	setting_id INTEGER,
	stats_id INTEGER,
	last_login INTEGER,
	FOREIGN KEY(stats_id) REFERENCES stats(id),
	FOREIGN KEY(setting_id) REFERENCES settings(id)
);