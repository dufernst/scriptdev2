-- Frozen halls (3 small instances) additions
-- Forge of souls
-- UPDATE `creature_template` SET `ScriptName`='mob_soul_storm', `AIName` ='' WHERE `entry`=; 

UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_FSintro' WHERE `entry` IN (37597, 37596);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_FSextro' WHERE `entry` IN (38160, 38161);
UPDATE `creature_template` SET `scale` = 0.8 WHERE `entry` IN (37221, 36955, 36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `npcflag`='3' WHERE `entry` IN (38160, 38161);
UPDATE `creature_template` SET `equipment_id` = 1290 WHERE `entry` = 37554;

-- Pit of saron
-- Used main SD2 (Xfurry) version)
UPDATE creature_template SET ScriptName='boss_krick' WHERE entry=36477;
UPDATE creature_template SET ScriptName='boss_ick' WHERE entry=36476;
UPDATE creature_template SET ScriptName='npc_exploding_orb' WHERE entry=36610;

UPDATE creature_template SET ScriptName='npc_ymirjar_deathbringer' WHERE entry=36892;
DELETE FROM scripted_areatrigger WHERE entry=5578;
INSERT INTO scripted_areatrigger VALUES (5578,'at_pit_of_saron');

UPDATE creature_template SET ScriptName='npc_collapsing_icicle' WHERE entry=36847;

UPDATE creature_template SET ScriptName='boss_tyrannus' WHERE entry=36658;
UPDATE creature_template SET ScriptName='boss_rimefang_pos' WHERE entry=36661;


-- [2833]
-- cleanup
DELETE FROM creature WHERE guid IN (132969,131748,131751);
-- Ick and Krick related
DELETE FROM creature_template_addon WHERE entry=36477;
INSERT INTO creature_template_addon (entry, b2_0_sheath) VALUES (36477, 1);
-- Pursuit whisper
DELETE FROM db_script_string WHERE entry IN (2000005524);
INSERT INTO db_script_string (entry, content_default) VALUES
(2000005524, '%s is chasing you!');
DELETE FROM dbscripts_on_spell WHERE id IN (68987);
INSERT INTO dbscripts_on_spell (id, command, datalong, dataint, comments) VALUES
(68987, 0, 5, 2000005524, 'ick - boss whisper pursuit');
-- Tyrannus intro mount
DELETE FROM vehicle_accessory WHERE vehicle_entry = 36794;
INSERT INTO vehicle_accessory (vehicle_entry, seat, accessory_entry, comment) VALUES
(36794, 0, 36658, 'Scourgelord Tyrannus - intro');
-- Misc mobs
DELETE FROM vehicle_accessory WHERE vehicle_entry = 36891;
INSERT INTO vehicle_accessory (vehicle_entry, seat, accessory_entry, comment) VALUES
(36891, 0, 31260, 'Iceborn Proto-Drake');

DELETE FROM achievement_criteria_requirement WHERE criteria_id=12993 AND type IN (11, 18);
INSERT INTO achievement_criteria_requirement VALUES
(12993, 18, 0, 0);

-- [2834]
-- YTDB only
DELETE FROM creature WHERE id=36477;
INSERT INTO creature (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType) VALUES
(36477, 658, 1, 1, 0, 0, 852.927, 123.522, 517.759, 3.26377, 86400, 0, 0, 40320, 220350, 0, 0);
DELETE FROM vehicle_accessory WHERE accessory_entry = 36477;

-- [2837]
DELETE FROM creature WHERE guid IN (132969,131748,131751,132972,133034,133818);
DELETE FROM creature WHERE guid BETWEEN 132954 AND 132960;
DELETE FROM creature WHERE guid BETWEEN 132945 AND 132953;
DELETE FROM creature WHERE guid IN (131752,131778,133860,133863,133867,133868,132115,132116,132117,132118);
DELETE FROM creature WHERE guid IN (133941,133942,133943, 133944,133934,133916,133915,133936,133902,133937,133935,133938);

-- [2840]
DELETE FROM spell_script_target WHERE targetEntry IN (37581,37577,37578,37579) and entry = 70521;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES
(70521, 1, 37581),
(70521, 1, 37577),
(70521, 1, 37578),
(70521, 1, 37579);
DELETE FROM spell_script_target WHERE entry IN (70639, 70525);
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES
(70639, 1, 38189),
(70525, 1, 38188);

-- [2841]
INSERT INTO `creature` (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType) VALUES
(24110, 658, 3, 1, 0, 0, 1055.25, 118.575, 628.239, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1067.85, 116.958, 628.533, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1071.36, 120.257, 628.724, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1063.1, 114.241, 628.708, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 976.311, 132.307, 628.239, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1050.06, 101.253, 627.7, 5.32325, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1058.31, 114.917, 628.343, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1068.9, 110.769, 627.813, 0.20944, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1061.19, 107.003, 628.356, 4.50295, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1048.12, 114.71, 628.239, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1055.84, 103.245, 627.967, 4.36332, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1056.52, 104.839, 627.799, 5.55015, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1054.93, 110.227, 628.463, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1063.5, 106.653, 628.382, 5.89921, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1058.11, 104.684, 628.161, 2.05949, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1071.46, 111.082, 627.31, 5.61996, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1051.11, 107.135, 628.47, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1053.4, 102.91, 626.892, 3.9968, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1041.71, 108.151, 628.761, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1051.98, 101.297, 627.227, 3.28122, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1063.42, 118.09, 628.239, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1047.19, 110.868, 628.272, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1051.03, 111.191, 628.26, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1065.6, 120.53, 628.239, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1059.41, 118.373, 628.239, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1067.32, 109.613, 627.319, 5.16617, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1046.62, 106.71, 628.922, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1060.4, 104.566, 627.904, 5.46288, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1054.21, 114.205, 628.239, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1058.2, 111.524, 628.632, 0, 14400, 0, 0, 42, 0, 0, 0),
(24110, 658, 3, 1, 0, 0, 1065.12, 108.306, 627.514, 4.29351, 14400, 0, 0, 42, 0, 0, 0);

DELETE FROM creature WHERE id=36658;
INSERT INTO creature (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType) VALUES
(36658, 658, 3, 1, 0, 0, 1018.38, 167.25, 651.871, 5.2709, 86400, 0, 0, 653828, 0, 0, 0);
DELETE FROM vehicle_accessory WHERE accessory_entry = 36658;

-- [2842]
DELETE FROM scripted_areatrigger WHERE entry IN (5581);
INSERT INTO scripted_areatrigger VALUES
(5581,'at_pit_of_saron');

--
-- Halls of reflection
UPDATE `instance_template` SET `ScriptName` = 'instance_halls_of_reflection' WHERE map=668;

UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` IN (197341, 202302, 201385, 201596);

UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='2.0' WHERE `entry` IN (36954, 37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` IN (37221, 37223);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry` IN (38112);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry` IN (38113);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_intro_hor' WHERE `entry` IN (36954);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hr' WHERE `entry` IN (37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_undead_hor' WHERE `entry` IN (36940,36941,37069);
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (37221, 36955);
UPDATE `creature_template` SET `equipment_id` = 1290 WHERE `entry` = 37554;
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=36954;
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `unit_flags`='768', `type_flags`='268435564' WHERE `entry` IN (38177, 38176, 38173, 38172, 38567, 38175);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_spiritual_reflection' WHERE `entry`=37068;

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(70464, 1, 36881),
(69708, 1, 37226),
(70194, 1, 37226);

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(70224, 1, 37014),
(70225, 1, 37014);

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(69431, 1, 37497),
(69431, 1, 37496),
(69431, 1, 37588),
(69431, 1, 37584),
(69431, 1, 37587);

REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(135341, 38112, 668, 3, 1, 0, 0, 5276.81, 2037.45, 709.32, 5.58779, 604800, 0, 0, 377468, 0, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(135342, 38113, 668, 3, 1, 0, 0, 5341.72, 1975.74, 709.32, 2.40694, 604800, 0, 0, 539240, 0, 0, 0);

REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(14531739, 201596, 668, 1, 128, 5275.28, 1694.23, 786.147, 0.981225, 0, 0, 0.471166, 0.882044, 25, 0, 1);

DELETE from `creature` WHERE `id`=36955;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(151040, 36955, 668, 3, 128, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

DELETE from `creature` WHERE `id`=37554;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(151041, 37554, 668, 3, 64, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

UPDATE `creature` SET `position_x` = 5551.29, `position_y` = 2261.33, `position_z` = 733.012, `orientation` = 4.0452 WHERE `id` = 37226;

UPDATE `creature_template` SET `modelid_1` = 11686, `modelid_2` = 11686, `modelid_3` = 11686, `modelid_4` = 11686 WHERE `entry` IN (37014,37704);

DELETE FROM `gameobject` WHERE `id` IN (201385,201596,202079);

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (197341,197342,197343);
UPDATE `gameobject` SET `state` = 1 WHERE `id` IN (197342,197343);

-- offlike way for icewalls operation
DELETE from `creature` WHERE `id`=37014;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_queldelar_hor' WHERE `entry` IN (37158);
DELETE from `creature` WHERE `map` = 668 AND `id` IN (37221,37223,37554,36955);

-- Captains chest (override)
DELETE FROM `gameobject` WHERE `id` IN (202212,201710,202337,202336);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(972562, 202212, 668, 1, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972563, 201710, 668, 1, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972564, 202337, 668, 2, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972565, 202336, 668, 2, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1);
-- Dalaran portal (override)
UPDATE `gameobject` SET `phaseMask` = 65535, `orientation` = 0, `rotation2` = 0, `rotation3` = 0, `spawntimesecs` = -604800, `animprogress` = 100 WHERE `id` = 202079 AND `map` = 668;

/* Original Icewalls from YTDB
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(3485, 201385, 668, 3, 1, 5540.39, 2086.48, 731.066, 1.00057, 0, 0, 0.479677, 0.877445, 604800, 100, 1),
(3438, 201385, 668, 3, 1, 5494.3, 1978.27, 736.689, 1.0885, 0, 0, 0.517777, 0.855516, 604800, 100, 1),
(3386, 201385, 668, 3, 1, 5434.27, 1881.12, 751.303, 0.923328, 0, 0, 0.445439, 0.895312, 604800, 100, 1),
(3383, 201385, 668, 3, 1, 5323.61, 1755.85, 770.305, 0.784186, 0, 0, 0.382124, 0.924111, 604800, 100, 1);
*/

