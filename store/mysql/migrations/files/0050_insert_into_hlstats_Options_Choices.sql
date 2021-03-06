-- name: insert-into-hlstats-Options_Choices

INSERT INTO hlstats_Options_Choices (keyname, value, text, isDefault)
VALUES ('rankingtype', 'skill', 'Skill', 1),
       ('rankingtype', 'kills', 'Kills', 0),
       ('bannerdisplay', '0', 'None', 1),
       ('bannerdisplay', '1', 'All Pages', 0),
       ('bannerdisplay', '2', 'Contents Page Only', 0),
       ('playerinfo_tabs', '1', 'New Style (hide sections by default)', 1),
       ('playerinfo_tabs', '0', 'Old Style (show all at once)', 0),
       ('nav_globalchat', '1', 'Show', 1),
       ('nav_globalchat', '0', 'Hide', 0),
       ('nav_cheaters', '0', 'Hide', 1),
       ('nav_cheaters', '1', 'Show', 0),
       ('show_weapon_target_flash', '1', 'Flash hitbox', 1),
       ('show_weapon_target_flash', '0', 'HTML Table', 0),
       ('show_server_load_image', '1', 'Show', 0),
       ('show_server_load_image', '0', 'Hide', 1),
       ('countrydata', '1', 'Show', 1),
       ('countrydata', '0', 'Hide', 0),
       ('gamehome_show_awards', '1', 'Show', 0),
       ('gamehome_show_awards', '0', 'Hide', 1),
       ('show_google_map', '0', 'Hide', 0),
       ('show_google_map', '1', 'Show', 1),
       ('google_map_region', 'EUROPE', 'Europe', 0),
       ('google_map_region', 'NORTH AMERICA', 'North America', 1),
       ('google_map_region', 'SOUTH AMERICA', 'South America', 0),
       ('google_map_region', 'NORTH AFRICA', 'North Africa', 0),
       ('google_map_region', 'SOUTH AFRICA', 'South Africa', 0),
       ('google_map_region', 'NORTH EUROPE', 'North Europe', 0),
       ('google_map_region', 'EAST EUROPE', 'East Europe', 0),
       ('google_map_region', 'GERMANY', 'Germany', 0),
       ('google_map_region', 'FRANCE', 'France', 0),
       ('google_map_region', 'SPAIN', 'Spain', 0),
       ('google_map_region', 'UNITED KINGDOM', 'United Kingdom', 0),
       ('google_map_region', 'DENMARK', 'Denmark', 0),
       ('google_map_region', 'SWEDEN', 'Sweden', 0),
       ('google_map_region', 'NORWAY', 'Norway', 0),
       ('google_map_region', 'FINLAND', 'Finland', 0),
       ('google_map_region', 'NETHERLANDS', 'Netherlands', 0),
       ('google_map_region', 'BELGIUM', 'Belgium', 0),
       ('google_map_region', 'POLAND', 'Poland', 0),
       ('google_map_region', 'SUISSE', 'Suisse', 0),
       ('google_map_region', 'AUSTRIA', 'Austria', 0),
       ('google_map_region', 'ITALY', 'Italy', 0),
       ('google_map_region', 'TURKEY', 'Turkey', 0),
       ('google_map_region', 'ROMANIA', 'Romania', 0),
       ('google_map_region', 'BRAZIL', 'Brazil', 0),
       ('google_map_region', 'ARGENTINA', 'Argentina', 0),
       ('google_map_region', 'RUSSIA', 'Russia', 0),
       ('google_map_region', 'ASIA', 'Asia', 0),
       ('google_map_region', 'CHINA', 'China', 0),
       ('google_map_region', 'JAPAN', 'Japan', 0),
       ('google_map_region', 'TAIWAN', 'Taiwan', 0),
       ('google_map_region', 'SOUTH KOREA', 'South Korea', 0),
       ('google_map_region', 'AUSTRALIA', 'Australia', 0),
       ('google_map_region', 'WORLD', 'World', 0),
       ('google_map_type', 'HYBRID', 'Hybrid', 1),
       ('google_map_type', 'SATELLITE', 'Satellite', 0),
       ('google_map_type', 'MAP', 'Normal', 0),
       ('google_map_type', 'PHYSICAL', 'Physical', 0),
       ('slider', '1', 'Enabled', 1),
       ('slider', '0', 'Disabled', 0),
       ('modrewrite', '1', 'Enabled', 0),
       ('modrewrite', '0', 'Disabled', 1),
       ('DNSResolveIP', '1', 'Yes', 1),
       ('DNSResolveIP', '0', 'No', 0),
       ('Rcon', '1', 'Yes', 1),
       ('Rcon', '0', 'No', 0),
       ('RconIgnoreSelf', '0', 'No', 1),
       ('RconIgnoreSelf', '1', 'Yes', 0),
       ('RconRecord', '0', 'No', 1),
       ('RconRecord', '1', 'Yes', 0),
       ('Mode', 'Normal', 'Steam ID (recommended)', 1),
       ('Mode', 'NameTrack', 'Player Name', 0),
       ('Mode', 'LAN', 'IP Address', 0),
       ('UseTimestamp', '0', 'No', 1),
       ('UseTimestamp', '1', 'Yes', 0),
       ('AllowOnlyConfigServers', '0', 'No', 0),
       ('AllowOnlyConfigServers', '1', 'Yes', 1),
       ('TrackStatsTrend', '0', 'No', 0),
       ('TrackStatsTrend', '1', 'Yes', 1),
       ('GlobalBanning', '0', 'No', 1),
       ('GlobalBanning', '1', 'Yes', 0),
       ('LogChat', '0', 'No', 0),
       ('LogChat', '1', 'Yes', 1),
       ('LogChatAdmins', '0', 'No', 0),
       ('LogChatAdmins', '1', 'Yes', 1),
       ('GlobalChat', '0', 'None', 1),
       ('GlobalChat', '1', 'Broadcast to all', 0),
       ('GlobalChat', '2', 'Broadcast to admins', 0),
       ('SkillRatioCap', '0', 'No', 1),
       ('SkillRatioCap', '1', 'Yes', 0),
       ('UseGeoIPBinary', '0', 'GeoIP lookup via database', 1),
       ('UseGeoIPBinary', '1', 'GeoIP lookup via binary file', 0),
       ('showqueries', '0', 'No', 1),
       ('showqueries', '1', 'Yes', 0),
       ('display_gamelist', '1', 'Yes', 1),
       ('display_gamelist', '0', 'No', 0),
       ('display_style_selector', '1', 'Yes', 0),
       ('display_style_selector', '0', 'No', 1);