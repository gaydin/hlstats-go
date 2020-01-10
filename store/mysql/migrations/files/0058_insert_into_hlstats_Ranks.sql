-- name: insert-into-hlstats-Ranks

INSERT INTO hlstats_Ranks (game, image, minKills, maxKills, rankName)
        (SELECT code, 'recruit', 0, 49, 'Recruit' FROM hlstats_Games)
UNION
(SELECT code, 'private', 50, 99, 'Private' FROM hlstats_Games)
UNION
(SELECT code, 'private-first-class', 100, 199, 'Private First Class' FROM hlstats_Games)
UNION
(SELECT code, 'lance-corporal', 200, 299, 'Lance Corporal' FROM hlstats_Games)
UNION
(SELECT code, 'corporal', 300, 399, 'Corporal' FROM hlstats_Games)
UNION
(SELECT code, 'sergeant', 400, 499, 'Sergeant' FROM hlstats_Games)
UNION
(SELECT code, 'staff-sergeant', 500, 599, 'Staff Sergeant' FROM hlstats_Games)
UNION
(SELECT code, 'gunnery-sergeant', 600, 699, 'Gunnery Sergeant' FROM hlstats_Games)
UNION
(SELECT code, 'master-sergeant', 700, 799, 'Master Sergeant' FROM hlstats_Games)
UNION
(SELECT code, 'first-sergeant', 800, 899, 'First Sergeant' FROM hlstats_Games)
UNION
(SELECT code, 'master-chief', 900, 999, 'Master Chief' FROM hlstats_Games)
UNION
(SELECT code, 'sergeant-major', 1000, 1199, 'Sergeant Major' FROM hlstats_Games)
UNION
(SELECT code, 'ensign', 1200, 1399, 'Ensign' FROM hlstats_Games)
UNION
(SELECT code, 'third-lieutenant', 1400, 1599, 'Third Lieutenant' FROM hlstats_Games)
UNION
(SELECT code, 'second-lieutenant', 1600, 1799, 'Second Lieutenant' FROM hlstats_Games)
UNION
(SELECT code, 'first-lieutenant', 1800, 1999, 'First Lieutenant' FROM hlstats_Games)
UNION
(SELECT code, 'captain', 2000, 2249, 'Captain' FROM hlstats_Games)
UNION
(SELECT code, 'group-captain', 2250, 2499, 'Group Captain' FROM hlstats_Games)
UNION
(SELECT code, 'senior-captain', 2500, 2749, 'Senior Captain' FROM hlstats_Games)
UNION
(SELECT code, 'lieutenant-major', 2750, 2999, 'Lieutenant Major' FROM hlstats_Games)
UNION
(SELECT code, 'major', 3000, 3499, 'Major' FROM hlstats_Games)
UNION
(SELECT code, 'group-major', 3500, 3999, 'Group Major' FROM hlstats_Games)
UNION
(SELECT code, 'lieutenant-commander', 4000, 4499, 'Lieutenant Commander' FROM hlstats_Games)
UNION
(SELECT code, 'commander', 4500, 4999, 'Commander' FROM hlstats_Games)
UNION
(SELECT code, 'group-commander', 5000, 5749, 'Group Commander' FROM hlstats_Games)
UNION
(SELECT code, 'lieutenant-colonel', 5750, 6499, 'Lieutenant Colonel' FROM hlstats_Games)
UNION
(SELECT code, 'colonel', 6500, 7249, 'Colonel' FROM hlstats_Games)
UNION
(SELECT code, 'brigadier', 7250, 7999, 'Brigadier' FROM hlstats_Games)
UNION
(SELECT code, 'brigadier-general', 8000, 8999, 'Brigadier General' FROM hlstats_Games)
UNION
(SELECT code, 'major-general', 9000, 9999, 'Major General' FROM hlstats_Games)
UNION
(SELECT code, 'lieutenant-general', 10000, 12499, 'Lieutenant General' FROM hlstats_Games)
UNION
(SELECT code, 'general', 12500, 14999, 'General' FROM hlstats_Games)
UNION
(SELECT code, 'commander-general', 15000, 17499, 'Commander General' FROM hlstats_Games)
UNION
(SELECT code, 'field-vice-marshal', 17500, 19999, 'Field Vice Marshal' FROM hlstats_Games)
UNION
(SELECT code, 'field-marshal', 20000, 22499, 'Field Marshal' FROM hlstats_Games)
UNION
(SELECT code, 'vice-commander-of-the-army', 22500, 24999, 'Vice Commander of the Army' FROM hlstats_Games)
UNION
(SELECT code, 'commander-of-the-army', 25000, 27499, 'Commander of the Army' FROM hlstats_Games)
UNION
(SELECT code, 'high-commander', 27500, 29999, 'High Commander' FROM hlstats_Games)
UNION
(SELECT code, 'supreme-commander', 30000, 34999, 'Supreme Commander' FROM hlstats_Games)
UNION
(SELECT code, 'terminator', 35000, 9999999, 'Terminator' FROM hlstats_Games);
