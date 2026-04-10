-- ── BTID ATHLETE MANAGEMENT SYSTEM — DATABASE SCHEMA ────────────
-- Run this in Supabase SQL Editor

-- ── USERS (Joshua + Scouts) ───────────────────────────────────────
CREATE TABLE IF NOT EXISTS users (
  id            VARCHAR(60)  PRIMARY KEY,
  username      VARCHAR(100) UNIQUE NOT NULL,
  password      VARCHAR(255) NOT NULL,
  name          VARCHAR(200) NOT NULL,
  role          VARCHAR(20)  DEFAULT 'scout',  -- admin | scout
  district      VARCHAR(200),
  active_until  TIMESTAMPTZ,                   -- NULL = permanent (Joshua)
  login_count   INTEGER      DEFAULT 0,
  last_login    TIMESTAMPTZ,
  created_at    TIMESTAMPTZ  DEFAULT NOW()
);

-- ── PLAYERS ───────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS players (
  id              VARCHAR(60)  PRIMARY KEY,
  -- Identity
  name            VARCHAR(200) NOT NULL,
  dob             DATE,
  age             INTEGER,
  class           VARCHAR(20),
  nationality     VARCHAR(100) DEFAULT 'Ugandan',
  gender          VARCHAR(5),
  -- Location
  district        VARCHAR(200),
  division        VARCHAR(200),
  -- School
  school          VARCHAR(300),
  school_contact  VARCHAR(200),
  -- Family
  parent1         VARCHAR(200),
  parent2         VARCHAR(200),
  household_id    VARCHAR(100),
  refugee_id      VARCHAR(100),
  -- Genetics
  dad_ht          DECIMAL(5,1),
  mom_ht          DECIMAL(5,1),
  gphp            DECIMAL(5,1),
  kr              VARCHAR(50),
  -- Scout info
  scout           VARCHAR(200),
  notes           TEXT,
  -- Tryout
  tier            VARCHAR(10),
  velo            DECIMAL(5,1),
  height_ft       VARCHAR(20),
  weight_lbs      DECIMAL(6,1),
  batch_id        VARCHAR(60),
  attended        BOOLEAN      DEFAULT false,
  outcome         VARCHAR(30),   -- admitted | eliminated | NULL
  elimination_reason TEXT,
  -- Post tryout
  academy         VARCHAR(200),
  coach_assigned  VARCHAR(200),
  next_checkin    DATE,
  guardian_consent BOOLEAN     DEFAULT false,
  dev_notes       TEXT,
  -- Media
  photo_url       TEXT,
  -- Meta
  created_at      TIMESTAMPTZ  DEFAULT NOW(),
  updated_at      TIMESTAMPTZ  DEFAULT NOW()
);

-- ── HOME VISITS ───────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS home_visits (
  id          VARCHAR(60) PRIMARY KEY,
  player_id   VARCHAR(60) UNIQUE REFERENCES players(id) ON DELETE CASCADE,
  notes       TEXT,
  visit_date  DATE,
  visited_by  VARCHAR(200),
  family_size INTEGER,
  consent     BOOLEAN DEFAULT false,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── HOME VISIT MEDIA ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS home_visit_media (
  id          VARCHAR(60) PRIMARY KEY,
  player_id   VARCHAR(60) REFERENCES players(id) ON DELETE CASCADE,
  url         TEXT NOT NULL,
  type        VARCHAR(20) DEFAULT 'image',  -- image | video | document
  filename    VARCHAR(500),
  filesize    BIGINT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── TRYOUT BATCHES ────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tryout_batches (
  id           VARCHAR(60)  PRIMARY KEY,
  name         VARCHAR(300) NOT NULL,
  district     VARCHAR(200),
  tryout_date  DATE,
  status       VARCHAR(30)  DEFAULT 'upcoming',  -- upcoming | active | completed
  notes        TEXT,
  created_at   TIMESTAMPTZ  DEFAULT NOW(),
  updated_at   TIMESTAMPTZ  DEFAULT NOW()
);

-- ── TRYOUT PLAYERS (linking table) ───────────────────────────────
CREATE TABLE IF NOT EXISTS tryout_players (
  batch_id    VARCHAR(60) REFERENCES tryout_batches(id) ON DELETE CASCADE,
  player_id   VARCHAR(60) REFERENCES players(id) ON DELETE CASCADE,
  attended    BOOLEAN     DEFAULT false,
  added_at    TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (batch_id, player_id)
);

-- ── TRYOUT RESULTS ────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tryout_results (
  id            VARCHAR(60) PRIMARY KEY,
  player_id     VARCHAR(60) UNIQUE REFERENCES players(id) ON DELETE CASCADE,
  batch_id      VARCHAR(60),
  -- Physical
  height_ft     VARCHAR(20),
  weight_lbs    DECIMAL(6,1),
  er            VARCHAR(50),
  -- 30 yard dash
  dash_1        DECIMAL(5,2),
  dash_2        DECIMAL(5,2),
  dash_avg      DECIMAL(5,2),
  -- Broad jump (inches)
  broad_1       DECIMAL(6,1),
  broad_2       DECIMAL(6,1),
  broad_3       DECIMAL(6,1),
  broad_avg     DECIMAL(6,1),
  -- Velocity standing
  velo_st_1     DECIMAL(5,1),
  velo_st_2     DECIMAL(5,1),
  velo_st_avg   DECIMAL(5,1),
  -- Velocity pitching down
  velo_pd_1     DECIMAL(5,1),
  velo_pd_2     DECIMAL(5,1),
  velo_pd_avg   DECIMAL(5,1),
  -- Assessment
  tier          VARCHAR(10),
  overall_grade DECIMAL(3,1),
  scout_notes   TEXT,
  created_at    TIMESTAMPTZ DEFAULT NOW(),
  updated_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ── COMMENTS ─────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS comments (
  id          VARCHAR(60) PRIMARY KEY,
  player_id   VARCHAR(60) REFERENCES players(id) ON DELETE CASCADE,
  author_id   VARCHAR(60),
  author_name VARCHAR(200),
  text        TEXT NOT NULL,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── LOGIN LOG ─────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS login_log (
  id          VARCHAR(60) PRIMARY KEY,
  user_id     VARCHAR(60),
  username    VARCHAR(100),
  name        VARCHAR(200),
  role        VARCHAR(20),
  ip          VARCHAR(60),
  user_agent  TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── REFLECTIONS ───────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS reflections (
  id          VARCHAR(60) PRIMARY KEY,
  title       VARCHAR(300) NOT NULL,
  body        TEXT,
  type        VARCHAR(30) DEFAULT 'writeup',  -- writeup | goal | doc
  author_id   VARCHAR(60),
  author_name VARCHAR(200),
  attachments TEXT DEFAULT '[]',  -- JSON array
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── PROGRAM GOALS ─────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS program_goals (
  id          VARCHAR(60) PRIMARY KEY,
  text        TEXT NOT NULL,
  done        BOOLEAN     DEFAULT false,
  author_id   VARCHAR(60),
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── INDEXES ───────────────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_players_district   ON players(district);
CREATE INDEX IF NOT EXISTS idx_players_tier        ON players(tier);
CREATE INDEX IF NOT EXISTS idx_players_outcome     ON players(outcome);
CREATE INDEX IF NOT EXISTS idx_players_batch       ON players(batch_id);
CREATE INDEX IF NOT EXISTS idx_players_name        ON players(name);
CREATE INDEX IF NOT EXISTS idx_hv_player           ON home_visits(player_id);
CREATE INDEX IF NOT EXISTS idx_media_player        ON home_visit_media(player_id);
CREATE INDEX IF NOT EXISTS idx_comments_player     ON comments(player_id);
CREATE INDEX IF NOT EXISTS idx_results_player      ON tryout_results(player_id);
CREATE INDEX IF NOT EXISTS idx_login_log_created   ON login_log(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_reflections_created ON reflections(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_goals_done          ON program_goals(done);
