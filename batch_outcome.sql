-- Run in Supabase SQL Editor

-- Add outcome and elimination_reason to tryout_players
ALTER TABLE tryout_players ADD COLUMN IF NOT EXISTS outcome           VARCHAR(30);
ALTER TABLE tryout_players ADD COLUMN IF NOT EXISTS elimination_reason TEXT;
ALTER TABLE tryout_players ADD COLUMN IF NOT EXISTS assessed_at       TIMESTAMPTZ;

-- Index for fast batch outcome queries
CREATE INDEX IF NOT EXISTS idx_tp_outcome ON tryout_players(batch_id, outcome);
