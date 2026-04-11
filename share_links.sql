-- Run this in Supabase SQL Editor
CREATE TABLE IF NOT EXISTS share_links (
  id          VARCHAR(60) PRIMARY KEY,
  player_id   VARCHAR(60) UNIQUE REFERENCES players(id) ON DELETE CASCADE,
  token       VARCHAR(100) UNIQUE NOT NULL,
  expires_at  TIMESTAMPTZ NOT NULL,
  created_by  VARCHAR(60),
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_share_token ON share_links(token);
