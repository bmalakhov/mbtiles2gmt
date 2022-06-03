: mbtiles2gmt is a mbtiles to gmt converter
: This script is intend to convert raster maps from *.mbtiles file (based on sqllite) to SASPlanet Global Mapper file cache structure "cache_gmt"
: mbtiles2gmt
: How to use:
:1) Copy all files to convert_dir or any one
:2) Copy map file *.mbtiles to convert_dir
:3) Specify the name of *.mbtiles file (source) "mbtiles" variable (hr.mbtiles is a test example) 
set mbtiles=hr.mbtiles
:4) Specify the destination folder with tiles to "dirtiles" variable  
set dirtiles=c:\sasplanet\cache_gmt\hr
:Because there was no exponentiation function in sqllite syntax, so the query looks strange ;-). 
:It is will creates command file "1_mk_dir.cmd" of 1000+ mkdir commands, limited 18 zoom level. 
sqlite3 %mbtiles% "SELECT DISTINCT 'mkdir %dirtiles%\'||'Z'||cast(zoom_level as text)||'\'||cast((CASE zoom_level WHEN 1	THEN 1 WHEN 2	THEN 3 WHEN 3	THEN 7 WHEN 4	THEN 15 WHEN 5	THEN 31 WHEN 6	THEN 63 WHEN 7	THEN 127 WHEN 8	THEN 255 WHEN 9	THEN 511 WHEN 10 THEN 1023 WHEN 11 THEN 2047 WHEN 12 THEN 4095 WHEN 13	THEN 8191 WHEN 14 THEN 16383 WHEN 15 THEN 32767 WHEN 16	THEN 65535 WHEN 17 THEN 131071 WHEN 18 THEN 262143 END)-tile_row as text) FROM tiles" >1_mk_dir.cmd
:Delete catalog before
del /s /q %dirtiles%
:So, "1_mk_dir.cmd" has created and now let's execute it to get a catalog structure for GMT cache 
call 1_mk_dir.cmd
:Next query is to copy "blob"s from sqllite to raster tiles *.png
sqlite3 %mbtiles% "SELECT writefile('%dirtiles%\Z'||cast(zoom_level as text)||'\'||cast((CASE zoom_level WHEN 1	THEN 1 WHEN 2	THEN 3 WHEN 3	THEN 7 WHEN 4	THEN 15 WHEN 5	THEN 31 WHEN 6	THEN 63 WHEN 7	THEN 127 WHEN 8	THEN 255 WHEN 9	THEN 511 WHEN 10 THEN 1023 WHEN 11 THEN 2047 WHEN 12 THEN 4095 WHEN 13	THEN 8191 WHEN 14 THEN 16383 WHEN 15 THEN 32767 WHEN 16	THEN 65535 WHEN 17 THEN 131071 WHEN 18 THEN 262143 END)-tile_row as text)||'\'||cast(tile_column as text)||'.png', tile_data) FROM tiles"
:what to do next
:5) copy all raster data to C:\SASPlanet\cache_gmt   (it might be looks like C:\SASPlanet\cache_gmt\hr\Z8\......)
:6) Create an zmp file as a copy hr.zmp catalog to C:\SASPlanet\map
:7) Change GUID to to some other value if need be, change NameInCache="dirtile"  for this example specify "hr" withous quotes , specify Ext=.png ,name=your map from mbtiles
:8) Add CacheType = 4  to the end of file params.txt
:9) Open SasPlanet and search your maps