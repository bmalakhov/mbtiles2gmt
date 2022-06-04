# mbtiles2gmt
This batch script is for extracting map tiles from mbtiles file (based on sqllite) to file cache structure "cache_gmt" also known as «Global mapper cache» to use in SASPlanet [http://www.sasgis.org/](http://www.sasgis.org/sasplaneta/)

mbtiles -> file structure like C:\SASPlanet\cache_gmt\hr\Z10\283\...

1. Copy all files to one dir (for example ”convert_dir”)
2. Copy source map file *.mbtiles to convert_dir   (examples https://tiles.nakarte.me/files/)
3. Open convert.cmd in Notepad editor and specify the name of *.mbtiles file (source) "mbtiles" variable (hr.mbtiles is a test example)  

set mbtiles=hr.mbtiles

4. Specify the destination folder with tiles to "dirtiles" variable  

set dirtiles=c:\sasplanet\cache_gmt\hr

5. Save convert.cmd and run it.
How to add this map to SASPlanet:
7. Copy all appeared raster data to C:\SASPlanet\cache_gmt   (it should be looks like C:\SASPlanet\cache_gmt\hr\Z8\......)
8. Copy hr.zmp to catalog to C:\SASPlanet\map\   
9. Open paramt.txt
10. Change GUID to to some other value if need be, change NameInCache="dirtile"  for this example specify "hr" withous quotes , specify Ext=.png ,name=your map from mbtiles
11. Add CacheType = 4  to the end of file params.txt
12. Open SasPlanet and look for your new map in menu
