DROP TABLE IF EXISTS pokemons;

CREATE TABLE pokemons (
  id SERIAL PRIMARY KEY,
  name text,
  cp integer,
  poke_type text,
  img_url text
);
