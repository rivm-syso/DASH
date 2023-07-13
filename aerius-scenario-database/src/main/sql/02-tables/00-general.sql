/*
 * receptors
 * ---------
 * De receptoren en hun geometry.
 * Het gaat hier om alle receptoren die vallen in een natura2000 gebied.
 */
CREATE TABLE receptors (
	receptor_id integer NOT NULL,
	geometry geometry(Point),

	CONSTRAINT receptors_pkey PRIMARY KEY (receptor_id)
);

CREATE INDEX idx_receptors_geometry_gist ON receptors USING GIST (geometry);

/*
 * normative_receptors
 * -------------------
 * De maatgevende receptor subset.
 
CREATE TABLE normative_receptors (
	receptor_id integer NOT NULL,

	CONSTRAINT normative_receptors_pkey PRIMARY KEY (receptor_id),
	CONSTRAINT normative_receptors_fkey_receptors FOREIGN KEY (receptor_id) REFERENCES receptors
);
*/

/*
 * hexagons
 * --------
 * De hexagonen en hun geometry per zoom_level.
 * Op zoom level 1 is de oppervlakte van een hexagon een hectare.
 */
CREATE TABLE hexagons (
	receptor_id integer NOT NULL,
	zoom_level smallint NOT NULL,
	geometry geometry(Polygon),

	CONSTRAINT hexagons_pkey PRIMARY KEY (receptor_id, zoom_level)--,
	--CONSTRAINT hexagons_fkey_receptors FOREIGN KEY (receptor_id) REFERENCES receptors -- bevat landsdekkend de zoom_level 4 hexagonen
);

CREATE INDEX idx_hexagons_geometry_gist ON hexagons USING GIST (geometry);
CREATE INDEX idx_hexagons_zoom_level ON hexagons (zoom_level);

/*
 * receptors_to_natura2000_areas
 * -----------------------------
 * Koppeltabel tussen receptors en natura2000-gebied.
 */
CREATE TABLE receptors_to_natura2000_areas (
	receptor_id integer NOT NULL,
	natura2000_area_id integer NOT NULL,

	CONSTRAINT receptors_to_natura2000_areas_pkey PRIMARY KEY (receptor_id, natura2000_area_id)
);




/*
 * depositions
 * -----------
 * Totale depositie in de natuurgebieden per jaar en receptor.

CREATE TABLE depositions (
	year year_type NOT NULL,
	receptor_id integer NOT NULL,
	total_deposition posreal NOT NULL,

	CONSTRAINT depositions_pkey PRIMARY KEY (year, receptor_id),
	CONSTRAINT depositions_fkey_receptors FOREIGN KEY (receptor_id) REFERENCES receptors
);
 */



/*
 * sectors
 * -------
 * Sectorindeling van AERIUS
 */
CREATE TABLE sectors (
	sector_id smallint NOT NULL,
	description text NOT NULL,

	CONSTRAINT sectors_pkey PRIMARY KEY (sector_id)
);

/*
 * gcn_sectors
 * -----------
 * Sectorindeling van het RIVM.
 * Elke GCN-sector is gekoppeld aan een AERIUS-sector. Hierdoor weten we aan welke AERIUS-sector de depositie van de RIVM-bronnen toegekend moet worden.
 */
CREATE TABLE gcn_sectors (
	gcn_sector_id integer NOT NULL,
	sector_id integer NOT NULL,
	description text NOT NULL,

	CONSTRAINT gcn_sectors_pkey PRIMARY KEY (gcn_sector_id),
	CONSTRAINT gcn_sectors_fkey_sectors FOREIGN KEY (sector_id) REFERENCES sectors
);

/*
 * natura2000_area
 * ----------------
 * Natura 2000 gebieden met bevoegd gezag en geometrie. De ID's zijn de officiele Natura 2000 gebiedsnummers.
 */
CREATE TABLE natura2000_area(
	natura2000_area_id integer,
	natura2000_name text
);

CREATE TABLE IF NOT EXISTS public.hexagons_to_sensitive_habitat
(
    natura2000_area_id integer NOT NULL,
    receptor_id integer NOT NULL,
    zoom_level smallint NOT NULL,
    bird_directive boolean,
    habitat_directive boolean,
    type text COLLATE pg_catalog."default",
    habitat_type_id integer,
    surface real,
    coverage real
);

 /*
 * substances
 * ----------
 * Stoffen
 */
/*CREATE TABLE substances (
	substance_id smallint NOT NULL,
	name text NOT NULL,
	description text,

	CONSTRAINT substances_pkey PRIMARY KEY (substance_id)
); */
