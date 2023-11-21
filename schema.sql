CREATE TABLE Item (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
);

CREATE TABLE MusicAlbum (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INTEGER,
  on_spotify BOOLEAN,
  publish_date DATE,
  FOREIGN KEY(item_id) REFERENCES Item(id)
);

CREATE TABLE Genre (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(150),
  item_id INTEGER,
  FOREIGN KEY(item_id) REFERENCES Item(id)
);
CREATE INDEX index_music_album_item_id ON MusicAlbum(item_id);
CREATE INDEX index_genre_item_id ON Genre(item_id);


CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  item_id INTEGER,
  publisher VARCHAR(255),
  publish_date DATE,
  cover_state VARCHAR(255),
  archived BOOLEAN,
    FOREIGN KEY (item_id) REFERENCES Item(id)
);

CREATE INDEX idx_books_item_id ON books(item_id);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  item_id INTEGER,
  title VARCHAR(255),
  color VARCHAR(100),
  FOREIGN KEY (item_id) REFERENCES Item(id)
);

CREATE INDEX idx_labels_item_id ON labels(item_id);

-- Create Author Table
CREATE TABLE
  authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    FOREIGN KEY (item_id) REFERENCES Item(id)
  );

CREATE INDEX idx_authors_item_id ON authors(item_id);


-- Create Game Table
CREATE TABLE
  games (
    id INT GENERATED ALWAYS AS IDENTITY,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE,
    author_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (item_id) REFERENCES Item(id)
  );

  CREATE INDEX idx_games_item_id ON games(item_id);