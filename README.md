# mbtiles2gmt
This batch windows script is for extracting map tiles from *.mbtiles file (based on sqllite) to the file cache structure "cache_gmt" also known as «Global mapper cache» to use it in SASPlanet [http://www.sasgis.org/](http://www.sasgis.org/sasplaneta/)

https://slazav.xyz/maps/hr/slazav_hr.mbtiles - Slazav mountaineering maps 
https://slazav.xyz/maps/podm/all_podm.mbtiles - Slazav MMB maps
https://tiles.nakarte.me/files/ - maps from https://nakarte.me/

This script converts the sqlite database from mapname.mbtiles to a SasPlanet cache_gmt folder:
*.mbtiles -> file structure like C:\SASPlanet\cache_gmt\slazav_hr\Z10\283\...

1. Copy all files to one dir (for example ”convert_dir”)
2. Copy source map file *.mbtiles to convert_dir   
3. Open convert.cmd in any text editor and specify the name of *.mbtiles file (source) "mbtiles" variable (hr.mbtiles is a test example)  

set mbtiles=slazav_hr.mbtiles.mbtiles

4. Specify the destination folder with tiles to "dirtiles" variable  

set dirtiles=c:\sasplanet\cache_gmt\slazav_hr

5. Save convert.cmd and run it.

How to add this map to SASPlanet as a layer:

7. All Global mapper tiles have to be in C:\SASPlanet\cache_gmt   (it should be looks like C:\SASPlanet\cache_gmt\slazav_hr\Z8\......)
   
9. Copy slazav_hr.zmp to  C:\SASPlanet\maps\
    
11. Open SasPlanet main menu Layers-> slazav_hr

Map display options are specified in C:\sasplanet\maps\slazav_hr.zmp\params.txt
Each map "mapname" must have a unique folder "mapname.zmp" with the "params.txt" inside.

params.txt:
GUID={...} - an unique ID 
If a duplicate UUID error occurs change it manually to any other or search how to generate a Globally Unique Identifier (GUID) in windows PowerShell
name=slazav_hr - map name
NameInCache=slazav_hr  -  might have the same value of cache folder (specified in from %dirtile% )
Ext=.png  - mbtiles map raster data have to be in png format 
CacheType = 4 - This sets the tile cache type to a "Global mapper" and it is located in the folder C:\SASPlanet\cache_gmt\...
