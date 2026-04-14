-- Run in Supabase SQL Editor
CREATE TABLE IF NOT EXISTS dev_notes_log (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  player_id   VARCHAR(50) REFERENCES players(id) ON DELETE CASCADE,
  note        TEXT NOT NULL,
  author_id   VARCHAR(100),
  author_name VARCHAR(100),
  created_at  TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_dnl_player ON dev_notes_log(player_id);
