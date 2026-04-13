-- ── BTID 2025 SEASON DATA — 20 MALE PLAYERS ─────────────────────
-- Run in Supabase SQL Editor AFTER the 2026 data
-- These players test the global year filter

-- ── 2025 TRYOUT BATCHES ───────────────────────────────────────────
INSERT INTO tryout_batches (id, name, district, tryout_date, status, notes, season) VALUES
  ('TRY-2025-01', 'Kampala Season Opener — Mar 2025', 'Kampala', '2025-03-10', 'completed', 'First batch of Season 2025. 60 players screened.', 2025),
  ('TRY-2025-02', 'Gulu First Visit — Apr 2025',      'Gulu',    '2025-04-15', 'completed', 'First time scouting Northern Uganda. Groundbreaking batch.', 2025),
  ('TRY-2025-03', 'Jinja Eastern — May 2025',         'Jinja',   '2025-05-20', 'completed', 'Eastern Uganda first visit.', 2025)
ON CONFLICT (id) DO NOTHING;

-- ── 20 PLAYERS — SEASON 2025 ──────────────────────────────────────
INSERT INTO players (
  id, name, dob, class, nationality, gender,
  district, division, school, school_contact,
  parent1, parent2, household_id,
  dad_ht, mom_ht, gphp,
  scout, tier, velo, height_ft, weight_lbs,
  batch_id, attended, outcome,
  notes, season, created_at
) VALUES

-- ── CENTRAL ───────────────────────────────────────────────────────
('PLY-2025-C01', 'Kayiira Samuel',    '2011-02-14', 'P6', 'Ugandan', 'M',
 'Kampala', 'Central', 'Nakasero PS', '+256 701 201 001',
 '+256 701 201 001', '+256 702 201 002', 'HH-2025-C01',
 181, 164, 185.5, 'Joshua M.', '1', 83, '5"9', 141,
 'TRY-2025-01', true, 'admitted',
 'Top player of Season 2025. Incredible arm and instincts. Now in academy development.', 2025, '2025-03-10 09:00:00'),

('PLY-2025-C02', 'Sserugo Phillip',   '2012-05-30', 'P5', 'Ugandan', 'M',
 'Wakiso', 'Central', 'Wakiso PS', '+256 701 201 003',
 '+256 701 201 003', NULL, 'HH-2025-C02',
 178, 161, 182.5, 'Joshua M.', '1.5', 76, '5"7', 132,
 'TRY-2025-01', true, 'admitted',
 'Good all-round athlete. Admitted to Season 2025 development track.', 2025, '2025-03-10 10:00:00'),

('PLY-2025-C03', 'Kateregga Denis',   '2011-09-18', 'P6', 'Ugandan', 'M',
 'Kampala', 'Central', 'Old Kampala PS', '+256 701 201 005',
 '+256 701 201 005', '+256 702 201 006', 'HH-2025-C03',
 179, 162, 183.5, 'Joshua M.', '1.5', 77, '5"8', 135,
 'TRY-2025-01', true, 'admitted',
 'Consistent performer in 2025 cohort. Strong mechanics.', 2025, '2025-03-11 09:00:00'),

('PLY-2025-C04', 'Mulindwa Robert',   '2012-07-22', 'P5', 'Ugandan', 'M',
 'Mukono', 'Central', 'Mukono PS', '+256 701 201 007',
 '+256 701 201 007', NULL, 'HH-2025-C04',
 176, 160, 181.0, 'Joshua M.', '2', 66, '5"5', 119,
 'TRY-2025-01', true, 'eliminated',
 'Good attitude. Physical development not ready in 2025. Invited back for 2026 season.', 2025, '2025-03-11 10:00:00'),

('PLY-2025-C05', 'Kizito Arnold',     '2011-11-05', 'P6', 'Ugandan', 'M',
 'Kampala', 'Central', 'Mengo PS', '+256 701 201 009',
 '+256 701 201 009', '+256 702 201 010', 'HH-2025-C05',
 180, 163, 184.5, 'Joshua M.', '2', 69, '5"6', 124,
 'TRY-2025-01', true, 'eliminated',
 'Average across all tests in 2025. Did not meet threshold.', 2025, '2025-03-12 09:00:00'),

('PLY-2025-C06', 'Nkurunziza Aaron',  '2012-03-15', 'P5', 'Ugandan', 'M',
 'Wakiso', 'Central', 'Bweyogerere PS', '+256 701 201 011',
 '+256 701 201 011', NULL, 'HH-2025-C06',
 177, 161, 182.5, 'Joshua M.', '3', 57, '5"3', 110,
 'TRY-2025-01', true, 'eliminated',
 'Below threshold. Grassroots program recommended.', 2025, '2025-03-12 10:00:00'),

('PLY-2025-C07', 'Sserwanga Calvin',  '2011-06-28', 'S1', 'Ugandan', 'M',
 'Kampala', 'Central', 'Kampala Parents PS', '+256 701 201 013',
 '+256 701 201 013', '+256 702 201 014', 'HH-2025-C07',
 182, 165, 186.5, 'Joshua M.', '1', 85, '5"10', 146,
 'TRY-2025-01', true, 'admitted',
 'Second best player in 2025 Kampala batch. Strong velocity and explosive movement. Now in academy.', 2025, '2025-03-13 09:00:00'),

-- ── NORTHERN ──────────────────────────────────────────────────────
('PLY-2025-N01', 'Otim Lawrence',     '2011-04-09', 'P6', 'Ugandan', 'M',
 'Gulu', 'Northern', 'St. Joseph PS Gulu', '+256 701 202 001',
 '+256 701 202 001', '+256 702 202 002', 'HH-2025-N01',
 183, 165, 187.0, 'Joshua M.', '1', 88, '5"10', 149,
 'TRY-2025-02', true, 'admitted',
 'Best player from first ever Northern Uganda visit. Velocity of 88mph shocked everyone. In academy 2025.', 2025, '2025-04-15 09:00:00'),

('PLY-2025-N02', 'Achola Martin',     '2012-08-17', 'P5', 'Ugandan', 'M',
 'Gulu', 'Northern', 'Gulu PS', '+256 701 202 003',
 '+256 701 202 003', NULL, 'HH-2025-N02',
 180, 163, 184.5, 'Joshua M.', '1.5', 78, '5"8', 137,
 'TRY-2025-02', true, 'admitted',
 'Strong Northern prospect. Admitted to 2025 development cohort.', 2025, '2025-04-15 10:00:00'),

('PLY-2025-N03', 'Komakech Vincent',  '2011-12-03', 'P6', 'Ugandan', 'M',
 'Kitgum', 'Northern', 'Kitgum PS', '+256 701 202 005',
 '+256 701 202 005', '+256 702 202 006', 'HH-2025-N03',
 179, 162, 183.5, 'Joshua M.', '1.5', 75, '5"7', 131,
 'TRY-2025-02', true, 'admitted',
 'Great broad jump in 2025 batch — 79 inch average. Kitgum is a region to watch.', 2025, '2025-04-16 09:00:00'),

('PLY-2025-N04', 'Odora Henry',       '2012-06-14', 'P5', 'Ugandan', 'M',
 'Lira', 'Northern', 'Lira Model PS', '+256 701 202 007',
 '+256 701 202 007', NULL, 'HH-2025-N04',
 177, 160, 181.5, 'Joshua M.', '2', 67, '5"5', 120,
 'TRY-2025-02', true, 'eliminated',
 'Athletic but raw in 2025. Recommended for 2026 season re-evaluation.', 2025, '2025-04-16 10:00:00'),

('PLY-2025-N05', 'Atim Geoffrey',     '2012-10-25', 'P5', 'Ugandan', 'M',
 'Pader', 'Northern', 'Pader PS', '+256 701 202 009',
 '+256 701 202 009', '+256 702 202 010', 'HH-2025-N05',
 175, 159, 180.5, 'Joshua M.', '3', 54, '5"2', 108,
 'TRY-2025-02', true, 'eliminated',
 'Not ready in 2025. Young and raw. Grassroots entry recommended.', 2025, '2025-04-17 09:00:00'),

-- ── EASTERN ───────────────────────────────────────────────────────
('PLY-2025-E01', 'Nabirye Moses',     '2011-03-21', 'P6', 'Ugandan', 'M',
 'Jinja', 'Eastern', 'Jinja PS', '+256 701 203 001',
 '+256 701 203 001', '+256 702 203 002', 'HH-2025-E01',
 181, 164, 185.5, 'Joshua M.', '1', 82, '5"9', 140,
 'TRY-2025-03', true, 'admitted',
 'First elite player from Eastern Uganda. Admitted 2025. Strong arm and great baseball awareness.', 2025, '2025-05-20 09:00:00'),

('PLY-2025-E02', 'Owor Michael',      '2012-02-08', 'P5', 'Ugandan', 'M',
 'Iganga', 'Eastern', 'Iganga PS', '+256 701 203 003',
 '+256 701 203 003', NULL, 'HH-2025-E02',
 178, 162, 183.0, 'Joshua M.', '1.5', 74, '5"7', 129,
 'TRY-2025-03', true, 'admitted',
 'Solid 2025 Eastern prospect. Good dash time and clean mechanics.', 2025, '2025-05-20 10:00:00'),

('PLY-2025-E03', 'Wabulya Isaac',     '2012-09-12', 'P5', 'Ugandan', 'M',
 'Mayuge', 'Eastern', 'Mayuge PS', '+256 701 203 005',
 '+256 701 203 005', '+256 702 203 006', 'HH-2025-E03',
 176, 160, 181.0, 'Joshua M.', '2', 65, '5"5', 118,
 'TRY-2025-03', true, 'eliminated',
 'Below threshold in 2025. Average across all tests. Revisit in 2026.', 2025, '2025-05-21 09:00:00'),

('PLY-2025-E04', 'Nkosi Emmanuel',    '2011-07-30', 'S1', 'Ugandan', 'M',
 'Jinja', 'Eastern', 'Jinja Central PS', '+256 701 203 007',
 '+256 701 203 007', NULL, 'HH-2025-E04',
 180, 163, 184.5, 'Joshua M.', '1.5', 79, '5"8', 138,
 'TRY-2025-03', true, 'admitted',
 'Strong all-round athlete. Outfield candidate. Good 2025 showing.', 2025, '2025-05-21 10:00:00'),

('PLY-2025-E05', 'Kato Felix',        '2012-11-19', 'P5', 'Ugandan', 'M',
 'Kamuli', 'Eastern', 'Kamuli PS', '+256 701 203 009',
 '+256 701 203 009', '+256 702 203 010', 'HH-2025-E05',
 175, 159, 180.5, 'Joshua M.', '3', 55, '5"2', 107,
 'TRY-2025-03', true, 'eliminated',
 'Very raw. No prior athletic background. Grassroots program.', 2025, '2025-05-22 09:00:00'),

('PLY-2025-E06', 'Buyinza Ronald',    '2011-05-07', 'P6', 'Ugandan', 'M',
 'Soroti', 'Eastern', 'Soroti PS', '+256 701 203 011',
 '+256 701 203 011', NULL, 'HH-2025-E06',
 179, 162, 183.5, 'Joshua M.', '2', 68, '5"6', 122,
 'TRY-2025-03', true, 'eliminated',
 'Good attitude but numbers not there in 2025. Told him to come back in 2026.', 2025, '2025-05-22 10:00:00'),

('PLY-2025-E07', 'Wamala Geoffrey',   '2012-04-16', 'P5', 'Ugandan', 'M',
 'Mbale', 'Eastern', 'Mbale PS', '+256 701 203 013',
 '+256 701 203 013', '+256 702 203 014', 'HH-2025-E07',
 177, 161, 182.5, 'Joshua M.', '1.5', 76, '5"7', 131,
 'TRY-2025-03', true, 'admitted',
 'Mountain region player. Strong legs and good jump numbers. 2025 development cohort.', 2025, '2025-05-23 09:00:00'),

('PLY-2025-N06', 'Lagony Bernard',    '2011-08-22', 'P6', 'Ugandan', 'M',
 'Gulu', 'Northern', 'Lacor PS', '+256 701 202 011',
 '+256 701 202 011', NULL, 'HH-2025-N06',
 182, 165, 186.5, 'Joshua M.', '1.5', 80, '5"9', 142,
 'TRY-2025-02', true, 'admitted',
 'Physically mature for his age in 2025. Outfield arm is strong. Part of 2025 Northern cohort.', 2025, '2025-04-17 10:00:00')

ON CONFLICT (id) DO NOTHING;

-- ── LINK TO BATCHES ───────────────────────────────────────────────
INSERT INTO tryout_players (batch_id, player_id, attended) VALUES
('TRY-2025-01','PLY-2025-C01',true),('TRY-2025-01','PLY-2025-C02',true),
('TRY-2025-01','PLY-2025-C03',true),('TRY-2025-01','PLY-2025-C04',true),
('TRY-2025-01','PLY-2025-C05',true),('TRY-2025-01','PLY-2025-C06',true),
('TRY-2025-01','PLY-2025-C07',true),
('TRY-2025-02','PLY-2025-N01',true),('TRY-2025-02','PLY-2025-N02',true),
('TRY-2025-02','PLY-2025-N03',true),('TRY-2025-02','PLY-2025-N04',true),
('TRY-2025-02','PLY-2025-N05',true),('TRY-2025-02','PLY-2025-N06',true),
('TRY-2025-03','PLY-2025-E01',true),('TRY-2025-03','PLY-2025-E02',true),
('TRY-2025-03','PLY-2025-E03',true),('TRY-2025-03','PLY-2025-E04',true),
('TRY-2025-03','PLY-2025-E05',true),('TRY-2025-03','PLY-2025-E06',true),
('TRY-2025-03','PLY-2025-E07',true)
ON CONFLICT DO NOTHING;

-- ── 2025 TRYOUT RESULTS ───────────────────────────────────────────
INSERT INTO tryout_results (id, player_id, batch_id, height_ft, weight_lbs, er,
  dash_1, dash_2, dash_avg, broad_1, broad_2, broad_3, broad_avg,
  velo_st_1, velo_st_2, velo_st_avg, velo_pd_1, velo_pd_2, velo_pd_avg,
  tier, overall_grade, scout_notes) VALUES
('TRS-2025-C01','PLY-2025-C01','TRY-2025-01','5"9',141,'8.5',4.11,4.08,4.10,78,80,79,79.0,81,83,82.0,85,86,85.5,'1',8.5,'Top 2025 Kampala player. Strong arm. Now in academy.'),
('TRS-2025-C07','PLY-2025-C07','TRY-2025-01','5"10',146,'9.0',4.09,4.06,4.08,79,81,80,80.0,83,85,84.0,87,88,87.5,'1',9.0,'Second best 2025 player. Velocity of 85mph excellent.'),
('TRS-2025-N01','PLY-2025-N02','TRY-2025-02','5"10',149,'9.5',4.02,3.99,4.01,82,84,83,83.0,86,88,87.0,90,91,90.5,'1',9.5,'Best player Season 2025. 88mph. First Northern star.'),
('TRS-2025-N02','PLY-2025-N03','TRY-2025-02','5"8',137,'7.5',4.22,4.19,4.21,77,79,78,78.0,76,78,77.0,80,81,80.5,'1.5',7.5,'Strong broad jump. Kitgum prospect.'),
('TRS-2025-E01','PLY-2025-E01','TRY-2025-03','5"9',140,'8.5',4.14,4.11,4.13,77,79,78,78.0,80,82,81.0,84,85,84.5,'1',8.5,'First elite Eastern player. Strong baseball awareness.'),
('TRS-2025-E04','PLY-2025-E04','TRY-2025-03','5"8',138,'7.5',4.19,4.16,4.18,74,76,75,75.0,77,79,78.0,81,82,81.5,'1.5',7.5,'Good outfield arm. 2025 Eastern cohort.')
ON CONFLICT (id) DO NOTHING;
