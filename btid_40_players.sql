-- ── BTID DEMO DATA — 40 MALE PLAYERS ───────────────────────────
-- Real Ugandan names, balanced regions, rich data
-- Run in Supabase SQL Editor

-- ── CLEAR OLD DEMO DATA (optional) ───────────────────────────────
DELETE FROM tryout_players WHERE player_id LIKE 'PLY-%';
DELETE FROM tryout_results  WHERE player_id LIKE 'PLY-%';
DELETE FROM home_visits     WHERE player_id LIKE 'PLY-%';
DELETE FROM comments        WHERE player_id LIKE 'PLY-%';
DELETE FROM players         WHERE id        LIKE 'PLY-%';
DELETE FROM tryout_batches  WHERE id        LIKE 'TRY-%';

DELETE FROM program_goals WHERE id LIKE 'GOL-%';
DELETE FROM reflections   WHERE id LIKE 'REF-%';

-- ── TRYOUT BATCHES ────────────────────────────────────────────────
INSERT INTO tryout_batches (id, name, district, tryout_date, status, notes, season) VALUES
  ('TRY-001', 'Kampala Central — Feb 2026',  'Kampala',  '2026-02-14', 'completed', 'Largest batch of the season. 80 players screened, 18 invited to tryout.', 2026),
  ('TRY-002', 'Gulu Northern Outreach — Feb 2026', 'Gulu', '2026-02-21', 'completed', 'First time scouting deep Northern Uganda. Exceptional raw talent.', 2026),
  ('TRY-003', 'Wakiso & Mukono — Mar 2026',  'Wakiso',   '2026-03-07', 'completed', 'Central region second wave. Focus on schools not covered in Feb.', 2026),
  ('TRY-004', 'Jinja & Eastern — Mar 2026',  'Jinja',    '2026-03-21', 'completed', 'Eastern corridor. Covered Jinja, Iganga, Mayuge and Kamuli.', 2026),
  ('TRY-005', 'Mbarara Western — Apr 2026',  'Mbarara',  '2026-04-05', 'active',    'First western Uganda batch. Strong early numbers from Mbarara district.', 2026),
  ('TRY-006', 'Lira & Kitgum — Apr 2026',    'Lira',     '2026-04-19', 'upcoming',  'Follow-up Northern Uganda. Targeting Lira, Kitgum and Pader districts.', 2026)
ON CONFLICT (id) DO NOTHING;

-- ── 40 MALE PLAYERS ───────────────────────────────────────────────
INSERT INTO players (
  id, name, dob, class, nationality, gender,
  district, division, school, school_contact,
  parent1, parent2, household_id,
  dad_ht, mom_ht, gphp,
  scout, tier, velo, height_ft, weight_lbs,
  batch_id, attended, outcome,
  notes, season, created_at
) VALUES

-- ── CENTRAL / BUGANDA ─────────────────────────────────────────────

('PLY-C01', 'Mukasa Ivan',       '2012-03-08', 'P5', 'Ugandan', 'M',
 'Kampala', 'Central', 'Old Kampala PS', '+256 701 112 001',
 '+256 701 112 001', '+256 702 112 002', 'HH-2026-C01',
 183, 165, 181.0,
 'Joshua M.', '1', 87, '5"10', 147,
 'TRY-001', true, 'admitted',
 'Outstanding arm. Best velocity in the Kampala batch. Father played football professionally — elite genetics. Very coachable.', 2026, NOW() - INTERVAL '55 days'),

('PLY-C02', 'Ssemakula Daniel',  '2011-11-22', 'P6', 'Ugandan', 'M',
 'Kampala', 'Central', 'Nakasero PS', '+256 701 112 003',
 '+256 701 112 003', NULL, 'HH-2026-C02',
 180, 163, 184.5,
 'Joshua M.', '1.5', 79, '5"8', 139,
 'TRY-001', true, 'admitted',
 'Consistent performer. Great broad jump — 78 inches average. Needs velocity work but mechanics are clean.', 2026, NOW() - INTERVAL '54 days'),

('PLY-C03', 'Kiggundu Emmanuel', '2012-07-14', 'P5', 'Ugandan', 'M',
 'Kampala', 'Central', 'Mengo PS', '+256 701 112 005',
 '+256 701 112 005', '+256 702 112 006', 'HH-2026-C03',
 178, 161, 182.5,
 'Joshua M.', '1.5', 76, '5"7', 134,
 'TRY-001', true, 'admitted',
 'Smart baseball IQ. Reads the ball well off the bat. Leadership in the field. Switch hitter potential.', 2026, NOW() - INTERVAL '54 days'),

('PLY-C04', 'Nsubuga Hassan',    '2013-01-30', 'P4', 'Ugandan', 'M',
 'Wakiso', 'Central', 'Nansana PS', '+256 701 112 007',
 '+256 701 112 007', '+256 702 112 008', 'HH-2026-C04',
 176, 160, 181.0,
 'Joshua M.', '2', 68, '5"5', 121,
 'TRY-003', true, 'admitted',
 'Young for his class. Athletic but raw. Velocity needs 6 months development. Explosive first step.', 2026, NOW() - INTERVAL '38 days'),

('PLY-C05', 'Kawuki Caleb',      '2012-05-19', 'P5', 'Ugandan', 'M',
 'Wakiso', 'Central', 'Bweyogerere PS', '+256 701 112 009',
 '+256 701 112 009', NULL, 'HH-2026-C05',
 175, 159, 180.5,
 'Joshua M.', '2', 65, '5"5', 118,
 'TRY-003', true, 'eliminated',
 'Good attitude throughout. Physical development not ready. Recommend revisiting next season.', 2026, NOW() - INTERVAL '37 days'),

('PLY-C06', 'Ssebuliba Michael', '2011-09-03', 'S1', 'Ugandan', 'M',
 'Mukono', 'Central', 'Mukono PS', '+256 701 112 011',
 '+256 701 112 011', '+256 702 112 012', 'HH-2026-C06',
 179, 162, 183.5,
 'Joshua M.', '1.5', 78, '5"8', 136,
 'TRY-003', true, 'admitted',
 'Late developer. Numbers jumped significantly when he relaxed. Strong pitching mechanics already forming.', 2026, NOW() - INTERVAL '37 days'),

('PLY-C07', 'Mutesasira Andrew', '2013-04-11', 'P4', 'Ugandan', 'M',
 'Kampala', 'Central', 'Kibuli PS', '+256 701 112 013',
 '+256 701 112 013', '+256 702 112 014', 'HH-2026-C07',
 174, 158, 179.0,
 'Joshua M.', '2', 63, '5"4', 114,
 'TRY-001', true, 'eliminated',
 'Too young and underdeveloped for this cohort. Revisit in 12 months — good attitude and family support.', 2026, NOW() - INTERVAL '55 days'),

('PLY-C08', 'Ssentongo Brian',   '2012-08-27', 'P5', 'Ugandan', 'M',
 'Kampala', 'Central', 'Kampala Parents PS', '+256 701 112 015',
 '+256 701 112 015', NULL, 'HH-2026-C08',
 177, 161, 182.5,
 'Joshua M.', '3', 58, '5"3', 112,
 'TRY-001', true, 'eliminated',
 'Below average across all metrics. No prior exposure to baseball. Recommend grassroots entry program.', 2026, NOW() - INTERVAL '55 days'),

-- ── NORTHERN / ACHOLI & LANGI ─────────────────────────────────────

('PLY-N01', 'Okello Timothy',    '2012-02-14', 'P5', 'Ugandan', 'M',
 'Gulu', 'Northern', 'St. Joseph PS Gulu', '+256 701 113 001',
 '+256 701 113 001', '+256 702 113 002', 'HH-2026-N01',
 184, 167, 188.5,
 'Joshua M.', '1', 91, '5"11', 154,
 'TRY-002', true, 'admitted',
 'Best player in the entire Northern batch. Velocity reading of 91mph is exceptional for his age. High GPHP — will grow significantly. Fast track to academy.', 2026, NOW() - INTERVAL '48 days'),

('PLY-N02', 'Oryem Stephen',     '2011-12-05', 'P6', 'Ugandan', 'M',
 'Gulu', 'Northern', 'Gulu PS', '+256 701 113 003',
 '+256 701 113 003', NULL, 'HH-2026-N02',
 181, 164, 185.5,
 'Joshua M.', '1', 85, '5"9', 144,
 'TRY-002', true, 'admitted',
 'Powerful arm. Pitching delivery already fluid and natural. Reminds me of how Shewali looked two years ago.', 2026, NOW() - INTERVAL '48 days'),

('PLY-N03', 'Opoka Francis',     '2012-06-20', 'P5', 'Ugandan', 'M',
 'Kitgum', 'Northern', 'Kitgum PS', '+256 701 113 005',
 '+256 701 113 005', '+256 702 113 006', 'HH-2026-N03',
 180, 163, 184.5,
 'Joshua M.', '1.5', 77, '5"8', 138,
 'TRY-002', true, 'admitted',
 'Came highly recommended by local school teacher. Broad jump numbers are among the best this season — 81 inch average.', 2026, NOW() - INTERVAL '47 days'),

('PLY-N04', 'Olweny Victor',     '2013-03-17', 'P4', 'Ugandan', 'M',
 'Gulu', 'Northern', 'Lacor PS', '+256 701 113 007',
 '+256 701 113 007', NULL, 'HH-2026-N04',
 178, 162, 183.0,
 'Joshua M.', '2', 69, '5"6', 124,
 'TRY-002', true, 'admitted',
 'Young for this batch. Raw but explosive. Father is 5ft11 — expect significant growth. Monitor closely over next 8 months.', 2026, NOW() - INTERVAL '47 days'),

('PLY-N05', 'Akena Joseph',      '2012-10-09', 'P5', 'Ugandan', 'M',
 'Pader', 'Northern', 'Pader Central PS', '+256 701 113 009',
 '+256 701 113 009', '+256 702 113 010', 'HH-2026-N05',
 176, 160, 181.0,
 'Joshua M.', '2', 66, '5"5', 120,
 'TRY-002', true, 'eliminated',
 'Athletic frame but velocity reads low. Needs structured training environment before next evaluation.', 2026, NOW() - INTERVAL '47 days'),

('PLY-N06', 'Ojok Samuel',       '2011-07-28', 'S1', 'Ugandan', 'M',
 'Lira', 'Northern', 'Lira Model PS', '+256 701 113 011',
 '+256 701 113 011', '+256 702 113 012', 'HH-2026-N06',
 179, 162, 183.5,
 'Joshua M.', '1.5', 80, '5"9', 141,
 'TRY-002', true, 'admitted',
 'Strong all-around athlete. Plays football and was a sprinter. Transition to baseball natural. Outfield prospect.', 2026, NOW() - INTERVAL '47 days'),

('PLY-N07', 'Ocen Peter',        '2012-04-14', 'P5', 'Ugandan', 'M',
 'Lira', 'Northern', 'St. Mary PS Lira', '+256 701 113 013',
 '+256 701 113 013', NULL, 'HH-2026-N07',
 177, 161, 182.5,
 'Joshua M.', '2', 67, '5"6', 122,
 'TRY-002', false, NULL,
 'Did not attend tryout. Scout visited home — family interested. Rescheduling for TRY-006.', 2026, NOW() - INTERVAL '47 days'),

('PLY-N08', 'Odong James',       '2013-08-03', 'P4', 'Ugandan', 'M',
 'Kitgum', 'Northern', 'Kitgum Central PS', '+256 701 113 015',
 '+256 701 113 015', '+256 702 113 016', 'HH-2026-N08',
 175, 159, 180.5,
 'Joshua M.', '3', 55, '5"2', 108,
 'TRY-002', true, 'eliminated',
 'Too early in development. Very young. Grassroots program recommended before formal tryout.', 2026, NOW() - INTERVAL '47 days'),

('PLY-N09', 'Ouma Patrick',      '2011-05-16', 'P6', 'Ugandan', 'M',
 'Gulu', 'Northern', 'Gulu Mixed PS', '+256 701 113 017',
 '+256 701 113 017', '+256 702 113 018', 'HH-2026-N09',
 182, 165, 186.5,
 'Joshua M.', '1.5', 81, '5"9', 143,
 'TRY-002', true, 'admitted',
 'Physically advanced for his age. Best broad jump in Gulu batch — 83 inches. Solid arm. Pitcher-infielder hybrid.', 2026, NOW() - INTERVAL '47 days'),

('PLY-N10', 'Onen David',        '2012-09-21', 'P5', 'Ugandan', 'M',
 'Pader', 'Northern', 'Pader PS', '+256 701 113 019',
 '+256 701 113 019', NULL, 'HH-2026-N10',
 174, 158, 179.0,
 'Joshua M.', '3', 57, '5"3', 111,
 'TRY-002', true, 'eliminated',
 'Low numbers across the board. Not ready. Kind young man with good attitude — no baseball background.', 2026, NOW() - INTERVAL '47 days'),

-- ── EASTERN / BASOGA & BAGISU ─────────────────────────────────────

('PLY-E01', 'Waiswa Solomon',    '2012-01-18', 'P5', 'Ugandan', 'M',
 'Jinja', 'Eastern', 'Jinja PS', '+256 701 114 001',
 '+256 701 114 001', '+256 702 114 002', 'HH-2026-E01',
 180, 163, 184.5,
 'Joshua M.', '1.5', 78, '5"8', 137,
 'TRY-004', true, 'admitted',
 'Strong and coordinated. Best dash time in Eastern batch — 4.18 seconds average. Excellent first impression.', 2026, NOW() - INTERVAL '24 days'),

('PLY-E02', 'Mugoya Joshua',     '2011-10-07', 'P6', 'Ugandan', 'M',
 'Iganga', 'Eastern', 'Iganga PS', '+256 701 114 003',
 '+256 701 114 003', NULL, 'HH-2026-E02',
 179, 162, 183.5,
 'Joshua M.', '1', 84, '5"9', 142,
 'TRY-004', true, 'admitted',
 'Quietly impressive. Did not stand out physically but every metric was elite. High baseball instincts — best KR reading this month.', 2026, NOW() - INTERVAL '24 days'),

('PLY-E03', 'Wandera Nicholas',  '2012-11-25', 'P5', 'Ugandan', 'M',
 'Mayuge', 'Eastern', 'Mayuge PS', '+256 701 114 005',
 '+256 701 114 005', '+256 702 114 006', 'HH-2026-E03',
 177, 161, 182.5,
 'Joshua M.', '2', 70, '5"6', 125,
 'TRY-004', true, 'admitted',
 'Consistent but not elite. Good broad jump compensates for average velocity. Development track.', 2026, NOW() - INTERVAL '23 days'),

('PLY-E04', 'Wafula Richard',    '2013-02-09', 'P4', 'Ugandan', 'M',
 'Mbale', 'Eastern', 'Mbale PS', '+256 701 114 007',
 '+256 701 114 007', '+256 702 114 008', 'HH-2026-E04',
 178, 162, 183.0,
 'Joshua M.', '1.5', 75, '5"7', 130,
 'TRY-004', true, 'admitted',
 'Strong kid from the mountain region. Physically powerful for his age. Velocity should climb quickly with training.', 2026, NOW() - INTERVAL '23 days'),

('PLY-E05', 'Masaba Collins',    '2012-06-30', 'P5', 'Ugandan', 'M',
 'Sironko', 'Eastern', 'Sironko PS', '+256 701 114 009',
 '+256 701 114 009', NULL, 'HH-2026-E05',
 176, 160, 181.0,
 'Joshua M.', '2', 64, '5"5', 117,
 'TRY-004', true, 'eliminated',
 'Average across all tests. Did not show the athletic profile needed. Recommend reassessment in 12 months.', 2026, NOW() - INTERVAL '23 days'),

('PLY-E06', 'Mafabi George',     '2011-08-14', 'S1', 'Ugandan', 'M',
 'Mbale', 'Eastern', 'Mbale Boys SS', '+256 701 114 011',
 '+256 701 114 011', '+256 702 114 012', 'HH-2026-E06',
 181, 164, 185.5,
 'Joshua M.', '1.5', 80, '5"9', 140,
 'TRY-004', true, 'admitted',
 'Physically the most mature in the Eastern batch. Has been doing athletics — shows in his sprint numbers. Pitcher candidate.', 2026, NOW() - INTERVAL '23 days'),

('PLY-E07', 'Nangoli Abdul',     '2012-04-22', 'P5', 'Ugandan', 'M',
 'Tororo', 'Eastern', 'Tororo PS', '+256 701 114 013',
 '+256 701 114 013', NULL, 'HH-2026-E07',
 175, 159, 180.5,
 'Joshua M.', '3', 56, '5"3', 110,
 'TRY-004', true, 'eliminated',
 'Very low numbers. No athletic background in throwing or running. Needs full development program first.', 2026, NOW() - INTERVAL '23 days'),

('PLY-E08', 'Wamono Felix',      '2013-05-11', 'P4', 'Ugandan', 'M',
 'Kamuli', 'Eastern', 'Kamuli PS', '+256 701 114 015',
 '+256 701 114 015', '+256 702 114 016', 'HH-2026-E08',
 174, 158, 179.0,
 'Joshua M.', '2', 62, '5"4', 113,
 'TRY-004', false, NULL,
 'Arrived late to tryout. Only completed half the tests. Schedule full evaluation for TRY-006.', 2026, NOW() - INTERVAL '23 days'),

('PLY-E09', 'Kagoda Robert',     '2011-12-19', 'S1', 'Ugandan', 'M',
 'Jinja', 'Eastern', 'Jinja Central PS', '+256 701 114 017',
 '+256 701 114 017', '+256 702 114 018', 'HH-2026-E09',
 180, 163, 184.5,
 'Joshua M.', '1.5', 77, '5"8', 135,
 'TRY-004', true, 'admitted',
 'Steady and reliable. Never the loudest in the room but every metric was above average. Strong candidate for infield.', 2026, NOW() - INTERVAL '24 days'),

-- ── WESTERN / BANYANKOLE & BAKIGA ─────────────────────────────────

('PLY-W01', 'Tumwine Joel',      '2012-03-25', 'P5', 'Ugandan', 'M',
 'Mbarara', 'Western', 'Mbarara PS', '+256 701 115 001',
 '+256 701 115 001', '+256 702 115 002', 'HH-2026-W01',
 182, 166, 187.0,
 'Joshua M.', '1', 86, '5"10', 148,
 'TRY-005', true, 'admitted',
 'Best player in the Western batch. Great arm strength and incredible GPHP — will be a big athlete. High upside.', 2026, NOW() - INTERVAL '9 days'),

('PLY-W02', 'Byarugaba Mark',    '2011-11-08', 'P6', 'Ugandan', 'M',
 'Mbarara', 'Western', 'St. Peters PS Mbarara', '+256 701 115 003',
 '+256 701 115 003', NULL, 'HH-2026-W02',
 180, 163, 184.5,
 'Joshua M.', '1.5', 79, '5"8', 138,
 'TRY-005', true, 'admitted',
 'Strong dash time and broad jump. Plays basketball and rugby — great all-round athlete base. Transition should be fast.', 2026, NOW() - INTERVAL '9 days'),

('PLY-W03', 'Muhwezi Isaac',     '2012-07-01', 'P5', 'Ugandan', 'M',
 'Ntungamo', 'Western', 'Ntungamo PS', '+256 701 115 005',
 '+256 701 115 005', '+256 702 115 006', 'HH-2026-W03',
 179, 162, 183.5,
 'Joshua M.', '2', 71, '5"6', 126,
 'TRY-005', true, NULL,
 'Active batch. Results pending full evaluation. First impression — athletic but needs coaching exposure.', 2026, NOW() - INTERVAL '9 days'),

('PLY-W04', 'Atuhaire Daniel',   '2013-01-15', 'P4', 'Ugandan', 'M',
 'Bushenyi', 'Western', 'Bushenyi PS', '+256 701 115 007',
 '+256 701 115 007', '+256 702 115 008', 'HH-2026-W04',
 178, 161, 182.5,
 'Joshua M.', '2', 67, '5"5', 120,
 'TRY-005', true, NULL,
 'Young in this batch. Promising frame. Father is a farmer — very physically active lifestyle shows in his explosiveness.', 2026, NOW() - INTERVAL '9 days'),

('PLY-W05', 'Ntegyereize Frank', '2012-09-04', 'P5', 'Ugandan', 'M',
 'Kabale', 'Western', 'Kabale PS', '+256 701 115 009',
 '+256 701 115 009', NULL, 'HH-2026-W05',
 177, 160, 181.5,
 'Joshua M.', '1.5', 76, '5"7', 132,
 'TRY-005', true, NULL,
 'Came from Kabale — significant travel. Motivated kid. Strong arm and solid mechanics for someone with zero formal training.', 2026, NOW() - INTERVAL '9 days'),

('PLY-W06', 'Rwamirama Alex',    '2011-06-17', 'S1', 'Ugandan', 'M',
 'Mbarara', 'Western', 'Mbarara High SS', '+256 701 115 011',
 '+256 701 115 011', '+256 702 115 012', 'HH-2026-W06',
 181, 164, 185.5,
 'Joshua M.', '1.5', 81, '5"9', 143,
 'TRY-005', true, 'admitted',
 'Oldest in the Western batch. Already has physical maturity. Will develop fast with coaching. Outfield arm is exceptional.', 2026, NOW() - INTERVAL '9 days'),

('PLY-W07', 'Biryabarema Chris', '2012-12-28', 'P5', 'Ugandan', 'M',
 'Rukungiri', 'Western', 'Rukungiri PS', '+256 701 115 013',
 '+256 701 115 013', NULL, 'HH-2026-W07',
 175, 159, 180.5,
 'Joshua M.', '3', 59, '5"3', 112,
 'TRY-005', true, NULL,
 'Below average today but showed flashes of athleticism in warm-up. Attitude was excellent. Monitor.', 2026, NOW() - INTERVAL '9 days'),

('PLY-W08', 'Tusiime Kevin',     '2013-04-06', 'P4', 'Ugandan', 'M',
 'Ibanda', 'Western', 'Ibanda PS', '+256 701 115 015',
 '+256 701 115 015', '+256 702 115 016', 'HH-2026-W08',
 174, 158, 179.0,
 'Joshua M.', '3', 55, '5"2', 107,
 'TRY-005', true, NULL,
 'Too early. Come back in 18 months. Young boy with good energy.', 2026, NOW() - INTERVAL '9 days'),

('PLY-W09', 'Mugisha Emmanuel',  '2012-02-10', 'P5', 'Ugandan', 'M',
 'Mbarara', 'Western', 'RAKA PS Mbarara', '+256 701 115 017',
 '+256 701 115 017', '+256 702 115 018', 'HH-2026-W09',
 180, 162, 184.0,
 'Joshua M.', '2', 70, '5"6', 124,
 'TRY-005', true, NULL,
 'Solid all-round athlete. Good speed and arm. Needs to work on mechanics but potential is there for Tier 1.5 with development.', 2026, NOW() - INTERVAL '9 days'),

-- ── MIXED REGIONS — EXTRA PLAYERS ────────────────────────────────

('PLY-X01', 'Ssali Derrick',     '2012-05-05', 'P5', 'Ugandan', 'M',
 'Kampala', 'Central', 'Nakawa PS', '+256 701 116 001',
 '+256 701 116 001', NULL, 'HH-2026-X01',
 181, 164, 185.5,
 'Joshua M.', '1.5', 78, '5"8', 136,
 'TRY-001', true, 'admitted',
 'Technically sound. Best throwing mechanics in the Kampala batch without any coaching. Natural.', 2026, NOW() - INTERVAL '55 days'),

('PLY-X02', 'Okiror Moses',      '2011-03-19', 'P6', 'Ugandan', 'M',
 'Soroti', 'Eastern', 'Soroti PS', '+256 701 116 003',
 '+256 701 116 003', '+256 702 116 004', 'HH-2026-X02',
 179, 162, 183.5,
 'Joshua M.', '1.5', 77, '5"8', 135,
 'TRY-004', true, 'admitted',
 'From the Teso sub-region. Long levers and great reach. Infield prospect with strong positional awareness.', 2026, NOW() - INTERVAL '23 days'),

('PLY-X03', 'Ahimbisibwe Paul',  '2012-08-08', 'P5', 'Ugandan', 'M',
 'Kasese', 'Western', 'Kasese PS', '+256 701 116 005',
 '+256 701 116 005', NULL, 'HH-2026-X03',
 178, 161, 182.5,
 'Joshua M.', '2', 66, '5"5', 119,
 'TRY-005', true, NULL,
 'From the foothills region. Strong legs — great jumping numbers. Arm needs development. Watch this space.', 2026, NOW() - INTERVAL '9 days'),

('PLY-X04', 'Lutaaya Benjamin',  '2011-10-30', 'S1', 'Ugandan', 'M',
 'Masaka', 'Central', 'Masaka PS', '+256 701 116 007',
 '+256 701 116 007', '+256 702 116 008', 'HH-2026-X04',
 182, 165, 186.5,
 'Joshua M.', '1', 88, '5"10', 150,
 'TRY-003', true, 'admitted',
 'Top 3 player this season. Velocity of 88mph at S1. Excellent GPHP. Family fully committed. Fast track.', 2026, NOW() - INTERVAL '37 days'),

('PLY-X05', 'Ecweru Philip',     '2012-11-11', 'P5', 'Ugandan', 'M',
 'Lira', 'Northern', 'Lira PS', '+256 701 116 009',
 '+256 701 116 009', NULL, 'HH-2026-X05',
 177, 160, 181.5,
 'Joshua M.', '2', 68, '5"5', 121,
 'TRY-002', true, 'eliminated',
 'Struggled on the day. Might have been nervous. Worth a second look at TRY-006 if he applies again.', 2026, NOW() - INTERVAL '47 days')

ON CONFLICT (id) DO NOTHING;

-- ── LINK PLAYERS TO TRYOUT BATCHES ───────────────────────────────
INSERT INTO tryout_players (batch_id, player_id, attended) VALUES
-- TRY-001 Kampala
('TRY-001','PLY-C01',true),('TRY-001','PLY-C02',true),('TRY-001','PLY-C03',true),
('TRY-001','PLY-C07',true),('TRY-001','PLY-C08',true),('TRY-001','PLY-X01',true),
-- TRY-002 Gulu
('TRY-002','PLY-N01',true),('TRY-002','PLY-N02',true),('TRY-002','PLY-N03',true),
('TRY-002','PLY-N04',true),('TRY-002','PLY-N05',true),('TRY-002','PLY-N06',true),
('TRY-002','PLY-N07',false),('TRY-002','PLY-N08',true),('TRY-002','PLY-N09',true),
('TRY-002','PLY-N10',true),('TRY-002','PLY-X05',true),
-- TRY-003 Wakiso
('TRY-003','PLY-C04',true),('TRY-003','PLY-C05',true),('TRY-003','PLY-C06',true),
('TRY-003','PLY-X04',true),
-- TRY-004 Jinja
('TRY-004','PLY-E01',true),('TRY-004','PLY-E02',true),('TRY-004','PLY-E03',true),
('TRY-004','PLY-E04',true),('TRY-004','PLY-E05',true),('TRY-004','PLY-E06',true),
('TRY-004','PLY-E07',true),('TRY-004','PLY-E08',false),('TRY-004','PLY-E09',true),
('TRY-004','PLY-X02',true),
-- TRY-005 Mbarara
('TRY-005','PLY-W01',true),('TRY-005','PLY-W02',true),('TRY-005','PLY-W03',true),
('TRY-005','PLY-W04',true),('TRY-005','PLY-W05',true),('TRY-005','PLY-W06',true),
('TRY-005','PLY-W07',true),('TRY-005','PLY-W08',true),('TRY-005','PLY-W09',true),
('TRY-005','PLY-X03',true)
ON CONFLICT DO NOTHING;

-- ── TRYOUT RESULTS (for admitted players) ────────────────────────
INSERT INTO tryout_results (id, player_id, batch_id, height_ft, weight_lbs, er,
  dash_1, dash_2, dash_avg, broad_1, broad_2, broad_3, broad_avg,
  velo_st_1, velo_st_2, velo_st_avg, velo_pd_1, velo_pd_2, velo_pd_avg,
  tier, overall_grade, scout_notes) VALUES
('TRS-C01','PLY-C01','TRY-001','5"10',147,'9.0',4.08,4.05,4.07,79,81,80,80.0,85,87,86.0,89,91,90.0,'1',9.0,'Elite arm. Best Kampala player. Ready now.'),
('TRS-C02','PLY-C02','TRY-001','5"8', 139,'8.0',4.21,4.18,4.20,76,78,79,77.7,77,79,78.0,81,82,81.5,'1.5',7.5,'Consistent. Broad jump star. Work on velo.'),
('TRS-C03','PLY-C03','TRY-001','5"7', 134,'7.5',4.31,4.28,4.30,73,75,74,74.0,74,76,75.0,78,79,78.5,'1.5',7.5,'Smart IQ. Switch hitter potential.'),
('TRS-C06','PLY-C06','TRY-003','5"8', 136,'8.0',4.25,4.22,4.24,74,76,75,75.0,76,78,77.0,80,81,80.5,'1.5',7.5,'Late developer. Clean mechanics. Pitcher.'),
('TRS-N01','PLY-N01','TRY-002','5"11',154,'9.5',3.95,3.92,3.94,83,85,84,84.0,89,91,90.0,93,95,94.0,'1',9.5,'Best player this season. Exceptional.'),
('TRS-N02','PLY-N02','TRY-002','5"9', 144,'9.0',4.10,4.07,4.09,80,82,81,81.0,83,85,84.0,87,88,87.5,'1',9.0,'Fluid delivery. High ceiling. Pitcher.'),
('TRS-N03','PLY-N03','TRY-002','5"8', 138,'8.0',4.22,4.19,4.21,79,81,82,80.7,75,77,76.0,79,80,79.5,'1.5',8.0,'Best broad jump Northern batch.'),
('TRS-N06','PLY-N06','TRY-002','5"9', 141,'8.0',4.18,4.15,4.17,76,78,77,77.0,78,80,79.0,82,83,82.5,'1.5',7.5,'All-round athlete. Outfield prospect.'),
('TRS-N09','PLY-N09','TRY-002','5"9', 143,'8.5',4.15,4.12,4.14,81,83,82,82.0,79,81,80.0,83,84,83.5,'1.5',8.0,'Physically advanced. Pitcher-infield hybrid.'),
('TRS-E01','PLY-E01','TRY-004','5"8', 137,'8.0',4.18,4.15,4.17,75,77,76,76.0,76,78,77.0,80,81,80.5,'1.5',7.5,'Best dash Eastern batch. Fast.'),
('TRS-E02','PLY-E02','TRY-004','5"9', 142,'9.0',4.12,4.09,4.11,78,80,79,79.0,82,84,83.0,86,87,86.5,'1',9.0,'Quiet star. Elite KR. High instincts.'),
('TRS-E04','PLY-E04','TRY-004','5"7', 130,'7.5',4.28,4.25,4.27,72,74,73,73.0,73,75,74.0,77,78,77.5,'1.5',7.5,'Mountain power. Velocity will climb.'),
('TRS-E06','PLY-E06','TRY-004','5"9', 140,'8.0',4.19,4.16,4.18,76,78,77,77.0,78,80,79.0,82,83,82.5,'1.5',7.5,'Athletic maturity. Sprint base. Pitcher.'),
('TRS-E09','PLY-E09','TRY-004','5"8', 135,'7.5',4.24,4.21,4.23,73,75,74,74.0,75,77,76.0,79,80,79.5,'1.5',7.5,'Steady and reliable. Infield candidate.'),
('TRS-W01','PLY-W01','TRY-005','5"10',148,'9.0',4.09,4.06,4.08,80,82,81,81.0,84,86,85.0,88,89,88.5,'1',9.0,'Best Western player. High GPHP. Future star.'),
('TRS-W02','PLY-W02','TRY-005','5"8', 138,'8.0',4.19,4.16,4.18,75,77,76,76.0,77,79,78.0,81,82,81.5,'1.5',7.5,'Multi-sport base. Fast transition expected.'),
('TRS-W06','PLY-W06','TRY-005','5"9', 143,'8.0',4.17,4.14,4.16,77,79,78,78.0,79,81,80.0,83,84,83.5,'1.5',7.5,'Exceptional outfield arm. Mature.'),
('TRS-X01','PLY-X01','TRY-001','5"8', 136,'8.0',4.22,4.19,4.21,74,76,75,75.0,76,78,77.0,80,81,80.5,'1.5',7.5,'Best mechanics without coaching. Natural.'),
('TRS-X02','PLY-X02','TRY-004','5"8', 135,'7.5',4.25,4.22,4.24,73,75,74,74.0,75,77,76.0,79,80,79.5,'1.5',7.5,'Long levers. Infield prospect. Teso region.'),
('TRS-X04','PLY-X04','TRY-003','5"10',150,'9.5',4.05,4.02,4.04,81,83,82,82.0,86,88,87.0,90,92,91.0,'1',9.5,'Top 3 player this season. Fast track.')
ON CONFLICT (id) DO NOTHING;

-- ── HOME VISITS (top players) ─────────────────────────────────────
INSERT INTO home_visits (id, player_id, notes, visit_date, visited_by, family_size, consent) VALUES
('HV-N01','PLY-N01','Father is 6ft2 and former football player. Timothy has been throwing rocks and mangoes since age 5 — literally. Mother is a primary school teacher, very supportive of education alongside baseball. Family lives in a modest but clean home. Full consent given without hesitation. This kid is special.','2026-01-30','Joshua Muwanguzi',5,true),
('HV-C01','PLY-C01','Ivan lives near Old Kampala with his parents and two older sisters. Father played football at SC Villa reserve level — confirmed elite athletic genetics. Mother is a nurse. Family fully understands the opportunity. Ivan trains every day using a plastic bottle stuffed with paper as a ball.','2026-01-25','Joshua Muwanguzi',4,true),
('HV-X04','PLY-X04','Benjamin is from Masaka — his uncle drove him 3 hours to the tryout. Family is committed. Father is tall and athletic — 6ft2. Home is supportive. Grandmother prayed over the visit. Full consent. This one we cannot lose.','2026-02-20','Joshua Muwanguzi',6,true),
('HV-E02','PLY-E02','Joshua lives with his mother and grandmother in Iganga. Father is absent. Mother works as a market vendor — tough life but Joshua is disciplined and focused. School teacher says he is the most athletic kid in the school. Consent given. We will support transport costs.','2026-03-10','Joshua Muwanguzi',3,true),
('HV-W01','PLY-W01','Joel is from a cattle-keeping family in Mbarara. Very strong physically — carries jerricans and helps on the farm daily. Father is 6ft1. Mother is tall as well. High GPHP confirmed. Family is proud and fully supportive. This is our best Western prospect.','2026-03-28','Joshua Muwanguzi',7,true)
ON CONFLICT (id) DO NOTHING;

-- ── COMMENTS ─────────────────────────────────────────────────────
INSERT INTO comments (id, player_id, author_id, author_name, text, created_at) VALUES
('CMT-N01','PLY-N01','usr-joshua-001','Joshua Muwanguzi','Timothy is the best player I have seen all season. 91mph at 14 years old in Gulu with zero formal training. I genuinely believe this kid can make it.', NOW() - INTERVAL '45 days'),
('CMT-N01B','PLY-N01','usr-joshua-001','Joshua Muwanguzi','Follow up after home visit — family is fully committed. Father played football at high level. Genetics are elite. Fast tracking to academy intake.', NOW() - INTERVAL '40 days'),
('CMT-X04','PLY-X04','usr-joshua-001','Joshua Muwanguzi','Benjamin is my third top pick this season after Timothy and Okello Timothy. 88mph with natural mechanics. Masaka region has been underrated.', NOW() - INTERVAL '35 days'),
('CMT-E02','PLY-E02','usr-joshua-001','Joshua Muwanguzi','Joshua Mugoya has the highest baseball IQ I have seen this season. Quiet kid but reads every situation perfectly. Elite KR score.', NOW() - INTERVAL '22 days'),
('CMT-W01','PLY-W01','usr-joshua-001','Joshua Muwanguzi','Joel Tumwine is our best Western prospect. 86mph with the frame to hit 95mph. The cattle farming background has built real functional strength.', NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO NOTHING;

-- ── PROGRAM GOALS ─────────────────────────────────────────────────
INSERT INTO program_goals (id, text, done, author_id, created_at) VALUES
('GOL-001','Scout at least 5 districts across all 4 regions of Uganda in Season 2026',true,'usr-joshua-001',NOW() - INTERVAL '60 days'),
('GOL-002','Identify minimum 8 Tier 1 players for academy consideration',false,'usr-joshua-001',NOW() - INTERVAL '60 days'),
('GOL-003','Complete home visits for all Tier 1 prospects',false,'usr-joshua-001',NOW() - INTERVAL '55 days'),
('GOL-004','Reach 90mph velocity reading from at least 2 players',true,'usr-joshua-001',NOW() - INTERVAL '50 days'),
('GOL-005','Expand Northern Uganda scouting to Kitgum and Pader districts',true,'usr-joshua-001',NOW() - INTERVAL '45 days'),
('GOL-006','Complete Western Uganda first batch by April 2026',true,'usr-joshua-001',NOW() - INTERVAL '30 days'),
('GOL-007','Submit Season 2026 mid-year report to Will Nolden by June 1',false,'usr-joshua-001',NOW() - INTERVAL '20 days'),
('GOL-008','Build scout network in Eastern Uganda — recruit 2 local scouts',false,'usr-joshua-001',NOW() - INTERVAL '15 days'),
('GOL-009','Source 3 female prospects for female development track',false,'usr-joshua-001',NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO NOTHING;

-- ── REFLECTIONS ───────────────────────────────────────────────────
INSERT INTO reflections (id, title, body, type, author_id, author_name, attachments, created_at) VALUES
('REF-001','Season 2026 — Opening Observations',
'<p>Four batches completed, one active, one upcoming. The talent pool across Uganda continues to surprise me every season.</p><p><strong>Key finding:</strong> Northern Uganda is producing the highest raw velocity numbers consistently. I believe this is tied to the physical demands of daily life in that region — farming, long walks, manual work. The body conditioning is already there before we see them.</p><p>Western Uganda exceeded all expectations in the first batch. Joel Tumwine alone justifies the whole western expansion.</p><p>Eastern Uganda — Jinja corridor specifically — has untapped potential. Joshua Mugoya from Iganga is my sleeper pick of the season.</p>',
'writeup','usr-joshua-001','Joshua Muwanguzi','[]', NOW() - INTERVAL '10 days'),
('REF-002','Velocity Patterns by Region — Season 2026',
'<p>After analysing all tryout data so far, a clear pattern is emerging:</p><ul><li><strong>Northern Uganda</strong> — Highest average velocity. Best arm strength. Most raw power.</li><li><strong>Central Uganda</strong> — Most baseball exposure but slightly lower raw numbers. Technique compensates.</li><li><strong>Eastern Uganda</strong> — Best dash times. Fastest players. Speed is the eastern tool.</li><li><strong>Western Uganda</strong> — First impression only but physically the most developed. Farming lifestyle creating functional strength.</li></ul><p>This should directly inform our scouting resource allocation in Season 2027.</p>',
'writeup','usr-joshua-001','Joshua Muwanguzi','[]', NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO NOTHING;
