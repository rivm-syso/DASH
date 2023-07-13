
/* source_locations_dash
 * ---------------------
 * locaties waar de emissies op geaggregeerd zijn. Vierkanten 1x1 of 5x5 km 
 * op basis van de vk5vk1 van emissieregistratie
 */
 CREATE TABLE source_locations_dash (
 vk_ai_code varchar NOT NULL , 
 location_id integer NOT NULL,
 province_id integer, 
 geom geometry ,
 CONSTRAINT source_locations_dash_pkey PRIMARY KEY (location_id),
 CONSTRAINT source_location_dash_ukey UNIQUE (vk_ai_code)
 ) ;
 
/* zl3_receptors
 * -------------
 * Zoomlevel 3 receptors voor gebruik in de dash
 * hexagons toegevoegd, obv functies
 */
 CREATE TABLE zl3_receptors (
  receptor_id integer NOT NULL,
  geom  geometry,
  geometry_hex geometry,
  constraint zl3_receptors_pkey PRIMARY KEY(receptor_id)
  );
  
 
 /* sectorsgroups
  * -------------
  * sectorgroups dash, gedefinieerd door sectorgroups  + landbouw uitgesplitst per aerius sector 
  * 
  */
 CREATE TABLE sectorgroups (
 sectorgroup varchar NOT NULL , 
 sectorgroup_id integer NOT NULL,
 name varchar NOT NULL, 

 CONSTRAINT sectorgroups_pkey PRIMARY KEY (sectorgroup_id),
 CONSTRAINT sectorgroups_ukey UNIQUE (sectorgroup)
 ) ;
 
/*
 * location_emissions_dash
 * -----------------------
 * Tabel met daarin de sector-emissie per (stof en) locatie.
 */
CREATE TABLE location_emissions_dash (
	location_id integer NOT NULL,
	sectorgroup_id smallint NOT NULL,
	substance_id smallint NOT NULL,
	emission real NOT NULL
	
--	CONSTRAINT location_emissions_dash_pkey PRIMARY KEY (location_id, sectorgroup_id, substance_id),
--	CONSTRAINT location_emissions_dash_fkey_source_locations_dash FOREIGN KEY (location_id) REFERENCES source_locations_dash,
--	CONSTRAINT location_emissions_dash_fkey_sectorgroup FOREIGN KEY (sectorgroup_id) REFERENCES sectorgroups,
--	CONSTRAINT location_emissions_dash_fkey_substances FOREIGN KEY (substance_id) REFERENCES substances
);
 
CREATE  TABLE  receptor_location_results (
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL, 
    deposition_industrie  real,   
    deposition_landbouwbeweiding  real,   
    deposition_landbouwglastuinbouw  real,   
    deposition_landbouwmestaanwending  real,   
    deposition_landbouwmestbeenverwerking  real,   
    deposition_landbouwmestopslag  real,   
    deposition_landbouwoverigelandbouw  real,   
    deposition_landbouwstallenoverigvee  real,   
    deposition_landbouwstallenpluimvee  real,   
    deposition_landbouwstallenrundvee  real,   
    deposition_landbouwstallenvarkens  real,   
    deposition_overigesectoren  real,   
    deposition_scheepvaart  real,   
    deposition_vervoerenoverigverkeer  real,   
    deposition_wegverkeer  real, 
    deposition_all real
	);	

 CREATE  TABLE  receptor_location_results_industrie  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_industrie_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_industrie_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_industrie_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_industrie_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwbeweiding  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwbeweiding_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwbeweiding_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwbeweiding_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwbeweiding_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwglastuinbouw  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwglastuinbouw_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwglastuinbouw_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwglastuinbouw_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwglastuinbouw_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwmestaanwending  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwmestaanwending_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwmestaanwending_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwmestaanwending_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwmestaanwending_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwmestbeenverwerking  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwmestbeenverwerking_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwmestbeenverwerking_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwmestbeenverwerking_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwmestbeenverwerking_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwmestopslag  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwmestopslag_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwmestopslag_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwmestopslag_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwmestopslag_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwoverigelandbouw  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwoverigelandbouw_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwoverigelandbouw_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwoverigelandbouw_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwoverigelandbouw_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwstallenoverigvee  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwstallenoverigvee_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwstallenoverigvee_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwstallenoverigvee_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwstallenoverigvee_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwstallenpluimvee  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwstallenpluimvee_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwstallenpluimvee_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwstallenpluimvee_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwstallenpluimvee_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwstallenrundvee  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwstallenrundvee_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwstallenrundvee_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwstallenrundvee_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwstallenrundvee_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_landbouwstallenvarkens  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_landbouwstallenvarkens_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_landbouwstallenvarkens_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_landbouwstallenvarkens_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_landbouwstallenvarkens_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_overigesectoren  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_overigesectoren_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_overigesectoren_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_overigesectoren_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_overigesectoren_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_scheepvaart  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_scheepvaart_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_scheepvaart_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_scheepvaart_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_scheepvaart_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_vervoerenoverigverkeer  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_vervoerenoverigverkeer_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_vervoerenoverigverkeer_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_vervoerenoverigverkeer_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_vervoerenoverigverkeer_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 
 CREATE  TABLE  receptor_location_results_wegverkeer  (
	
	location_id  integer  NOT  NULL,
	receptor_id  integer  NOT  NULL,
	substance_id  smallint  NOT  NULL,
	deposition  real  NOT  NULL--,

	--CONSTRAINT  receptor_location_results_wegverkeer_pkey  PRIMARY  KEY  (receptor_id,  substance_id,    location_id),
	--CONSTRAINT  receptor_location_results_wegverkeer_fkey_receptors  FOREIGN  KEY  (receptor_id)  REFERENCES  receptors,
	--CONSTRAINT  receptor_location_results_wegverkeer_fkey_source_locations_dash  FOREIGN  KEY  (location_id)  REFERENCES  source_locations_dash,
	--CONSTRAINT  receptor_location_results_wegverkeer_fkey_substances  FOREIGN  KEY  (substance_id)  REFERENCES  substances
); 

CREATE TABLE IF NOT EXISTS public.dash_receptors_zl3_n2k
(
	receptor_id integer,
	natura2000_area_id integer
);

CREATE TABLE dash_deposition_per_location
(
	natura2000_area_id integer,
	location_id integer,
	receptor_id integer,
	total_deposition_industrie real,
	total_deposition_landbouwbeweiding real,
	total_deposition_landbouwglastuinbouw real,
	total_deposition_landbouwmestaanwending real,
	total_deposition_landbouwmestbeenverwerking real,
	total_deposition_landbouwmestopslag real,
	total_deposition_landbouwoverigelandbouw real,
	total_deposition_landbouwstallenoverigvee real,
	total_deposition_landbouwstallenpluimvee real,
	total_deposition_landbouwstallenrundvee real,
	total_deposition_landbouwstallenvarkens real,
	total_deposition_overigesectoren real,
	total_deposition_scheepvaart real,
	total_deposition_vervoerenoverigverkeer real,
	total_deposition_wegverkeer real,
	total_deposition_all real
);

CREATE TABLE dash_hexagons_to_sensitive_habitat_selection
(
	receptor_id integer,
	natura2000_area_id integer,
	habitat_type_id integer,
	cartographic_surface double precision
);

CREATE TABLE dash_all_deposition_per_location_n2k_ht
(
	natura2000_area_id integer,
	habitat_type_id integer,
	location_id integer,
	deposition_industrie_sum double precision,
	deposition_landbouwbeweiding_sum double precision,
	deposition_landbouwglastuinbouw_sum double precision,
	deposition_landbouwmestaanwending_sum double precision,
	deposition_landbouwmestbeenverwerking_sum double precision,
	deposition_landbouwmestopslag_sum double precision,
	deposition_landbouwoverigelandbouw_sum double precision,
	deposition_landbouwstallenoverigvee_sum double precision,
	deposition_landbouwstallenpluimvee_sum double precision,
	deposition_landbouwstallenrundvee_sum double precision,
	deposition_landbouwstallenvarkens_sum double precision,
	deposition_overigesectoren_sum double precision,
	deposition_scheepvaart_sum double precision,
	deposition_vervoerenoverigverkeer_sum double precision,
	deposition_wegverkeer_sum double precision,
	deposition_industrie_avg double precision,
	deposition_landbouwbeweiding_avg double precision,
	deposition_landbouwglastuinbouw_avg double precision,
	deposition_landbouwmestaanwending_avg double precision,
	deposition_landbouwmestbeenverwerking_avg double precision,
	deposition_landbouwmestopslag_avg double precision,
	deposition_landbouwoverigelandbouw_avg double precision,
	deposition_landbouwstallenoverigvee_avg double precision,
	deposition_landbouwstallenpluimvee_avg double precision,
	deposition_landbouwstallenrundvee_avg double precision,
	deposition_landbouwstallenvarkens_avg double precision,
	deposition_overigesectoren_avg double precision,
	deposition_scheepvaart_avg double precision,
	deposition_vervoerenoverigverkeer_avg double precision,
	deposition_wegverkeer_avg double precision,
	deposition_industrie_max real,
	deposition_landbouwbeweiding_max real,
	deposition_landbouwglastuinbouw_max real,
	deposition_landbouwmestaanwending_max real,
	deposition_landbouwmestbeenverwerking_max real,
	deposition_landbouwmestopslag_max real,
	deposition_landbouwoverigelandbouw_max real,
	deposition_landbouwstallenoverigvee_max real,
	deposition_landbouwstallenpluimvee_max real,
	deposition_landbouwstallenrundvee_max real,
	deposition_landbouwstallenvarkens_max real,
	deposition_overigesectoren_max real,
	deposition_scheepvaart_max real,
	deposition_vervoerenoverigverkeer_max real,
	deposition_wegverkeer_max real,
	deposition_industrie_min real,
	deposition_landbouwbeweiding_min real,
	deposition_landbouwglastuinbouw_min real,
	deposition_landbouwmestaanwending_min real,
	deposition_landbouwmestbeenverwerking_min real,
	deposition_landbouwmestopslag_min real,
	deposition_landbouwoverigelandbouw_min real,
	deposition_landbouwstallenoverigvee_min real,
	deposition_landbouwstallenpluimvee_min real,
	deposition_landbouwstallenrundvee_min real,
	deposition_landbouwstallenvarkens_min real,
	deposition_overigesectoren_min real,
	deposition_scheepvaart_min real,
	deposition_vervoerenoverigverkeer_min real,
	deposition_wegverkeer_min real,
	deposition_all_sum double precision,
	deposition_all_avg double precision,
	deposition_all_min real,
	deposition_all_max real
);

CREATE TABLE IF NOT EXISTS public.dash_deposition_per_location_n2k
(
	natura2000_area_id integer,
	location_id integer,
	industrie_sum double precision,
	landbouwbeweiding_sum double precision,
	landbouwglastuinbouw_sum double precision,
	landbouwmestaanwending_sum double precision,
	landbouwmestbeenverwerking_sum double precision,
	landbouwmestopslag_sum double precision,
	landbouwoverigelandbouw_sum double precision,
	landbouwstallenoverigvee_sum double precision,
	landbouwstallenpluimvee_sum double precision,
	landbouwstallenrundvee_sum double precision,
	landbouwstallenvarkens_sum double precision,
	overigesectoren_sum double precision,
	scheepvaart_sum double precision,
	vervoerenoverigverkeer_sum double precision,
	wegverkeer_sum double precision,
	industrie_avg double precision,
	landbouwbeweiding_avg double precision,
	landbouwglastuinbouw_avg double precision,
	landbouwmestaanwending_avg double precision,
	landbouwmestbeenverwerking_avg double precision,
	landbouwmestopslag_avg double precision,
	landbouwoverigelandbouw_avg double precision,
	landbouwstallenoverigvee_avg double precision,
	landbouwstallenpluimvee_avg double precision,
	landbouwstallenrundvee_avg double precision,
	landbouwstallenvarkens_avg double precision,
	overigesectoren_avg double precision,
	scheepvaart_avg double precision,
	vervoerenoverigverkeer_avg double precision,
	wegverkeer_avg double precision,
	industrie_max real,
	landbouwbeweiding_max real,
	landbouwglastuinbouw_max real,
	landbouwmestaanwending_max real,
	landbouwmestbeenverwerking_max real,
	landbouwmestopslag_max real,
	landbouwoverigelandbouw_max real,
	landbouwstallenoverigvee_max real,
	landbouwstallenpluimvee_max real,
	landbouwstallenrundvee_max real,
	landbouwstallenvarkens_max real,
	overigesectoren_max real,
	scheepvaart_max real,
	vervoerenoverigverkeer_max real,
	wegverkeer_max real,
	industrie_min real,
	landbouwbeweiding_min real,
	landbouwglastuinbouw_min real,
	landbouwmestaanwending_min real,
	landbouwmestbeenverwerking_min real,
	landbouwmestopslag_min real,
	landbouwoverigelandbouw_min real,
	landbouwstallenoverigvee_min real,
	landbouwstallenpluimvee_min real,
	landbouwstallenrundvee_min real,
	landbouwstallenvarkens_min real,
	overigesectoren_min real,
	scheepvaart_min real,
	vervoerenoverigverkeer_min real,
	wegverkeer_min real,
	deposition_all_sum double precision,
	deposition_all_avg double precision,
	deposition_all_min real,
	deposition_all_max real
)
