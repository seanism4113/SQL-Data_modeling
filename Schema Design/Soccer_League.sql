DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE League_Schedule (
    id SERIAL PRIMARY KEY,
    season TEXT UNIQUE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
)

CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    team_name varchar(12) UNIQUE NOT NULL,
    player_count INTEGER,
    team_city TEXT,
    team_state TEXT,
    main_jersey_color TEXT NOT NULL,
    alt_jersey_color TEXT
);

CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    team_id INTEGER REFERENCES Teams(team_id)
);

CREATE TABLE Referees (
    ref_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    certified_date DATE
);

CREATE TABLE Stadiums (
    stadium_id SERIAL PRIMARY KEY,
    stadium_name VARCHAR(20) UNIQUE NOT NULL,
    location TEXT
);

CREATE TABLE Goals (
    goal_id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES Matches(match_id),
    player_id INTEGER REFERENCES Players(player_id),
)

CREATE TABLE Match_Outcome (
    outcome_id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES Teams(team_id),
    match_id INTEGER REFERENCES Matches(match_id),
    result TEXT NOT NULL,
)

CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES Teams(team_id),
    team2 INTEGER REFERENCES Teams(team_id),
    match_date DATE NOT NULL,
    start_time TIME NOT NULL,
    season_id INTEGER REFERENCES League_Schedule(id),
    stadium_id INTEGER REFERENCES Stadiums(stadium_id),
    center_ref1 INTEGER REFERENCES Referees(ref_id),
    line_ref1 INTEGER REFERENCES Referees(ref_id),
    line_ref2 INTEGER REFERENCES Referees(ref_id),
    CONSTRAINT different_teams CHECK (team1 <> team2)
);




