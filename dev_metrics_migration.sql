-- Development & Initial Tryout metrics columns
ALTER TABLE players ADD COLUMN IF NOT EXISTS dev_velo       NUMERIC;
ALTER TABLE players ADD COLUMN IF NOT EXISTS dev_height_ft  VARCHAR(20);
ALTER TABLE players ADD COLUMN IF NOT EXISTS dev_weight_lbs NUMERIC;
ALTER TABLE players ADD COLUMN IF NOT EXISTS dev_broad      NUMERIC;
ALTER TABLE players ADD COLUMN IF NOT EXISTS dev_dash       NUMERIC;
ALTER TABLE players ADD COLUMN IF NOT EXISTS dev_kr         VARCHAR(20);
ALTER TABLE players ADD COLUMN IF NOT EXISTS init_velo      NUMERIC;
ALTER TABLE players ADD COLUMN IF NOT EXISTS init_height_ft VARCHAR(20);
ALTER TABLE players ADD COLUMN IF NOT EXISTS init_notes     TEXT;
