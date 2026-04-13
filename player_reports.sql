-- Run in Supabase SQL Editor

-- Player reports table
CREATE TABLE IF NOT EXISTS player_reports (
  id          VARCHAR(60) PRIMARY KEY,
  player_id   VARCHAR(60) REFERENCES players(id) ON DELETE CASCADE,
  title       VARCHAR(300) NOT NULL,
  body        TEXT,
  author_id   VARCHAR(60),
  author_name VARCHAR(200),
  attachments TEXT DEFAULT '[]',
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_player_reports_player ON player_reports(player_id);
CREATE INDEX IF NOT EXISTS idx_player_reports_created ON player_reports(created_at DESC);

-- Add media_tab column to home_visit_media to distinguish tabs
ALTER TABLE home_visit_media ADD COLUMN IF NOT EXISTS media_tab VARCHAR(30) DEFAULT 'homevisit';

-- Update existing media to homevisit tab
UPDATE home_visit_media SET media_tab = 'homevisit' WHERE media_tab IS NULL;
