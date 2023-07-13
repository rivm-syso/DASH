BEGIN; SELECT setup.ae_load_table('zl3_receptors', '{data_folder}/public/zl3_receptors_20220721.txt', TRUE); COMMIT;

BEGIN; SELECT setup.ae_load_table('source_locations_dash', '{data_folder}/public/source_locations_dash_20220520.txt', TRUE); COMMIT;

BEGIN; SELECT setup.ae_load_table('location_emissions_dash', '{data_folder}/public/location_emissions_dash_20230209.txt', TRUE); COMMIT;

BEGIN;
--	SELECT ae_raise_notice('Build: fill receptor_location_results substance 11 @ ' || timeofday());

	INSERT INTO receptor_location_results (location_id,receptor_id,substance_id) 
		select location_id, receptor_id, 11 as substance_id  from source_locations_dash ,  zl3_receptors;
COMMIT;

BEGIN;
--	SELECT ae_raise_notice('Build: fill receptor_location_results substance 17 @ ' || timeofday());

	INSERT INTO receptor_location_results (location_id,receptor_id,substance_id)
		select location_id, receptor_id, 17 as substance_id  from source_locations_dash ,  zl3_receptors;
COMMIT;

BEGIN;
CREATE OR REPLACE FUNCTION ae_update_receptor_location_results(table_name text) 
RETURNS void AS
$BODY$
DECLARE
	sql text;
BEGIN
	RAISE NOTICE 'update receptor_location_results_%', table_name || ' ' ||to_char(clock_timestamp(), 'DD-MM-YYYY HH24:MI:SS.MS');	
	
	sql := 'UPDATE public.receptor_location_results 
		SET deposition_' || table_name ||' = rlr.deposition FROM
			(SELECT * FROM  receptor_location_results_' || table_name ||') rlr
		WHERE receptor_location_results.location_id =rlr.location_id 
		and receptor_location_results.receptor_id= rlr.receptor_id
		and receptor_location_results.substance_id= rlr.substance_id';
		RAISE NOTICE '%', sql;
		EXECUTE sql;
		sql := 'DROP TABLE public.receptor_location_results_' || table_name;
		RAISE NOTICE '%', sql;
		EXECUTE sql;
	
END;
$BODY$
LANGUAGE plpgsql VOLATILE;
COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_industrie', '{data_folder}/public/receptor_location_results_industrie_20220704.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_industrie', '{data_folder}/public/receptor_location_results_industrie_20220711.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('industrie'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwbeweiding', '{data_folder}/public/receptor_location_results_landbouwbeweiding_20220525.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwbeweiding', '{data_folder}/public/receptor_location_results_landbouwbeweiding_20220712.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwbeweiding'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwglastuinbouw', '{data_folder}/public/receptor_location_results_landbouwglastuinbouw_20220524.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwglastuinbouw', '{data_folder}/public/receptor_location_results_landbouwglastuinbouw_20220711.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwglastuinbouw'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwmestaanwending', '{data_folder}/public/receptor_location_results_landbouwmestaanwending_20220525.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwmestaanwending', '{data_folder}/public/receptor_location_results_landbouwmestaanwending_20220712.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwmestaanwending'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwmestbeenverwerking', '{data_folder}/public/receptor_location_results_landbouwmestbeenverwerking_20220524.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwmestbeenverwerking', '{data_folder}/public/receptor_location_results_landbouwmestbeenverwerking_20220711.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwmestbeenverwerking'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwmestopslag', '{data_folder}/public/receptor_location_results_landbouwmestopslag_20221213.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwmestopslag'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwoverigelandbouw', '{data_folder}/public/receptor_location_results_landbouwoverigelandbouw_20220525.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwoverigelandbouw', '{data_folder}/public/receptor_location_results_landbouwoverigelandbouw_20220713.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwoverigelandbouw'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwstallenoverigvee', '{data_folder}/public/receptor_location_results_landbouwstallenoverigvee_20221211.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwstallenoverigvee'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwstallenpluimvee', '{data_folder}/public/receptor_location_results_landbouwstallenpluimvee_20221209.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwstallenpluimvee'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwstallenrundvee', '{data_folder}/public/receptor_location_results_landbouwstallenrundvee_20221211.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwstallenrundvee'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_landbouwstallenvarkens', '{data_folder}/public/receptor_location_results_landbouwstallenvarkens_20221209.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('landbouwstallenvarkens'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_overigesectoren', '{data_folder}/public/receptor_location_results_overigesectoren_20220525.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_overigesectoren', '{data_folder}/public/receptor_location_results_overigesectoren_20220712.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('overigesectoren'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_scheepvaart', '{data_folder}/public/receptor_location_results_scheepvaart_20220630.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_scheepvaart', '{data_folder}/public/receptor_location_results_scheepvaart_20220711.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('scheepvaart'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_vervoerenoverigverkeer', '{data_folder}/public/receptor_location_results_vervoerenoverigverkeer_20220525.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_vervoerenoverigverkeer', '{data_folder}/public/receptor_location_results_vervoerenoverigverkeer_20220712.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('vervoerenoverigverkeer'); COMMIT;

BEGIN; SELECT setup.ae_load_table('receptor_location_results_wegverkeer', '{data_folder}/public/receptor_location_results_wegverkeer_20220525.txt', TRUE); COMMIT;
BEGIN; SELECT setup.ae_load_table('receptor_location_results_wegverkeer', '{data_folder}/public/receptor_location_results_wegverkeer_20220714.txt', TRUE); COMMIT;
BEGIN; SELECT * FROM ae_update_receptor_location_results('wegverkeer'); COMMIT;


--select ae_update_receptor_location_results();

/*BEGIN;
	SELECT ae_raise_notice('Build: fill dash_receptors_zl3_n2k @ ' || timeofday());

	INSERT INTO dash_receptors_zl3_n2k(receptor_id, natura2000_area_id)
		SELECT distinct receptor_id, natura2000_area_id FROM hexagons_to_sensitive_habitat WHERE zoom_level=3 AND type='relevant_habitat';
COMMIT;*/



