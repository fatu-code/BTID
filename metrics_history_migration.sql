-- Player metrics history log
CREATE TABLE IF NOT EXISTS metrics_history (
  id          TEXT PRIMARY KEY DEFAULT gen_random_uuid()::text,
  player_id   TEXT NOT NULL REFERENCES players(id) ON DELETE CASCADE,
  velo        NUMERIC,
  height_ft   VARCHAR(20),
  weight_lbs  NUMERIC,
  broad       NUMERIC,
  dash        NUMERIC,
  kr          VARCHAR(20),
  noted_by    TEXT,
  created_at  TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
