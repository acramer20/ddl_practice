-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name text   NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name text   NOT NULL,
    team_id int   NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name text   NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1_id int   NOT NULL,
    team2_id int   NOT NULL,
    season_id int   NOT NULL,
    referee1_id int   NOT NULL,
    referee2_id int   NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id int   NOT NULL,
    player_id int   NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date text   NOT NULL,
    end_date text   NOT NULL
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id int   NOT NULL,
    match_id int   NOT NULL,
    win_or_loss text   NOT NULL
);

ALTER TABLE players ADD CONSTRAINT fk_players_team_id" FOREIGN KEY(team_id)
REFERENCES teams (id);

ALTER TABLE matches ADD CONSTRAINT fk_matches_season_id FOREIGN KEY(season_id)
REFERENCES seasons (id);

ALTER TABLE matches ADD CONSTRAINT fk_matches_referee1_id FOREIGN KEY(referee1_id)
REFERENCES referees (id);

ALTER TABLE matches ADD CONSTRAINT fk_matches_referee2_id FOREIGN KEY(referee2_id)
REFERENCES referees (id);

ALTER TABLE goals ADD CONSTRAINT fk_goals_match_id FOREIGN KEY(match_id)
REFERENCES matches (id);

ALTER TABLE goals ADD CONSTRAINT fk_goals_player_id FOREIGN KEY(player_id)
REFERENCES players (id);

ALTER TABLE results ADD CONSTRAINT fk_results_id FOREIGN KEY(id)
REFERENCES teams (id);

ALTER TABLE results ADD CONSTRAINT fk_results_team_id FOREIGN KEY(team_id)
REFERENCES teams (id);

ALTER TABLE results ADD CONSTRAINT fk_results_match_id FOREIGN KEY(match_id)
REFERENCES matches (id);

