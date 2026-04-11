-- Run in Supabase SQL Editor

-- Add 2FA columns to users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS totp_secret  VARCHAR(100);
ALTER TABLE users ADD COLUMN IF NOT EXISTS totp_enabled BOOLEAN DEFAULT false;

-- Add season/year column to players and tryout_batches
ALTER TABLE players        ADD COLUMN IF NOT EXISTS season INTEGER DEFAULT 2026;
ALTER TABLE tryout_batches ADD COLUMN IF NOT EXISTS season INTEGER DEFAULT 2026;

-- Update existing data with correct seasons
UPDATE players        SET season = EXTRACT(YEAR FROM created_at)::INTEGER WHERE season IS NULL;
UPDATE tryout_batches SET season = EXTRACT(YEAR FROM COALESCE(tryout_date, created_at))::INTEGER WHERE season IS NULL;

-- Index for fast season filtering
CREATE INDEX IF NOT EXISTS idx_players_season  ON players(season);
CREATE INDEX IF NOT EXISTS idx_batches_season  ON tryout_batches(season);
