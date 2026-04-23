-- ════════════════════════════════════════════════════════════════════
-- BTID - Replace em-dashes with hyphens across all user-facing text
-- ════════════════════════════════════════════════════════════════════
-- Em-dashes (—) in stored data make the app look AI-generated.
-- This replaces them with regular hyphens (-) across every table
-- where humans have typed free text.
--
-- Safe to re-run. Uses REPLACE which is a no-op if the string isn't found.
-- Wrap in a transaction so everything commits together or not at all.
-- ════════════════════════════════════════════════════════════════════

BEGIN;

-- PREVIEW: what will change
SELECT 'tryouts'            AS tbl, id, name AS text FROM tryouts        WHERE name LIKE '%—%'
UNION ALL SELECT 'players (name)',        id, name        FROM players    WHERE name LIKE '%—%'
UNION ALL SELECT 'players (school)',      id, school      FROM players    WHERE school LIKE '%—%'
UNION ALL SELECT 'players (notes)',       id, LEFT(notes, 80) FROM players WHERE notes LIKE '%—%'
UNION ALL SELECT 'players (dev_notes)',   id, LEFT(dev_notes, 80) FROM players WHERE dev_notes LIKE '%—%';

-- ══════════ TRYOUTS ══════════
UPDATE tryouts SET name = REPLACE(REPLACE(name, ' — ', ' - '), '—', '-') WHERE name LIKE '%—%';

-- ══════════ PLAYERS ══════════
UPDATE players SET name         = REPLACE(REPLACE(name,         ' — ', ' - '), '—', '-') WHERE name LIKE '%—%';
UPDATE players SET school       = REPLACE(REPLACE(school,       ' — ', ' - '), '—', '-') WHERE school LIKE '%—%';
UPDATE players SET notes        = REPLACE(REPLACE(notes,        ' — ', ' - '), '—', '-') WHERE notes LIKE '%—%';
UPDATE players SET dev_notes    = REPLACE(REPLACE(dev_notes,    ' — ', ' - '), '—', '-') WHERE dev_notes LIKE '%—%';
UPDATE players SET coach_assigned = REPLACE(REPLACE(coach_assigned, ' — ', ' - '), '—', '-') WHERE coach_assigned LIKE '%—%';
UPDATE players SET academy      = REPLACE(REPLACE(academy,      ' — ', ' - '), '—', '-') WHERE academy LIKE '%—%';
UPDATE players SET scout        = REPLACE(REPLACE(scout,        ' — ', ' - '), '—', '-') WHERE scout LIKE '%—%';

-- ══════════ HOME VISITS ══════════
UPDATE home_visits SET notes      = REPLACE(REPLACE(notes,      ' — ', ' - '), '—', '-') WHERE notes LIKE '%—%';
UPDATE home_visits SET visited_by = REPLACE(REPLACE(visited_by, ' — ', ' - '), '—', '-') WHERE visited_by LIKE '%—%';

-- ══════════ REFLECTIONS / REPORTS / COMMENTS / DEV NOTES LOG ══════════
UPDATE reflections SET title = REPLACE(REPLACE(title, ' — ', ' - '), '—', '-') WHERE title LIKE '%—%';
UPDATE reflections SET body  = REPLACE(REPLACE(body,  ' — ', ' - '), '—', '-') WHERE body LIKE '%—%';

UPDATE player_reports SET title = REPLACE(REPLACE(title, ' — ', ' - '), '—', '-') WHERE title LIKE '%—%';
UPDATE player_reports SET body  = REPLACE(REPLACE(body,  ' — ', ' - '), '—', '-') WHERE body LIKE '%—%';

UPDATE comments SET text = REPLACE(REPLACE(text, ' — ', ' - '), '—', '-') WHERE text LIKE '%—%';

UPDATE dev_notes_log SET note = REPLACE(REPLACE(note, ' — ', ' - '), '—', '-') WHERE note LIKE '%—%';

-- ══════════ VERIFY - all should return zero rows ══════════
SELECT 'tryouts'           AS tbl, COUNT(*) AS remaining FROM tryouts        WHERE name LIKE '%—%'
UNION ALL SELECT 'players',                 COUNT(*) FROM players WHERE name LIKE '%—%' OR school LIKE '%—%' OR notes LIKE '%—%' OR dev_notes LIKE '%—%' OR academy LIKE '%—%' OR scout LIKE '%—%' OR coach_assigned LIKE '%—%'
UNION ALL SELECT 'home_visits',             COUNT(*) FROM home_visits WHERE notes LIKE '%—%' OR visited_by LIKE '%—%'
UNION ALL SELECT 'reflections',             COUNT(*) FROM reflections WHERE title LIKE '%—%' OR body LIKE '%—%'
UNION ALL SELECT 'player_reports',          COUNT(*) FROM player_reports WHERE title LIKE '%—%' OR body LIKE '%—%'
UNION ALL SELECT 'comments',                COUNT(*) FROM comments WHERE text LIKE '%—%'
UNION ALL SELECT 'dev_notes_log',           COUNT(*) FROM dev_notes_log WHERE note LIKE '%—%';

COMMIT;
