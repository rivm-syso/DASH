--BEGIN; SELECT setup.ae_load_table('receptors', '{data_folder}/public/receptors_20220810.txt', FALSE); COMMIT;
BEGIN; SELECT setup.ae_load_table('substances', '{data_folder}/public/substances_20221025.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('sectors', '{data_folder}/public/sectors_20220223.txt', TRUE); COMMIT;
--BEGIN; SELECT setup.ae_load_table('gcn_sectors', '{data_folder}/public/gcn_sectors_monitor_20220317.txt', FALSE); COMMIT;
BEGIN; SELECT setup.ae_load_table('natura2000_area', '{data_folder}/public/natura2000_area_20221025.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('hexagons_to_sensitive_habitat', '{data_folder}/public/hexagons_to_sensitive_habitat_20220621.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('sectorgroups', '{data_folder}/public/sectorgroups_20221025.txt', TRUE); COMMIT;
--BEGIN; SELECT setup.ae_load_table('receptors_to_natura2000_areas', '{data_folder}/public/receptors_to_natura2000_areas_20211206.txt', TRUE); COMMIT;
--BEGIN; SELECT setup.ae_load_table('normative_receptors', '{data_folder}/public/normative_receptors_20211203.txt', TRUE); COMMIT;
--BEGIN; SELECT setup.ae_load_table('depositions', '{data_folder}/public/depositions_20211206.txt', TRUE); COMMIT;

