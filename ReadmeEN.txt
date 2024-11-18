# mbtiles2gmt
This batch windows script is for extracting map tiles from *.mbtiles file (based on sqllite) to the file cache structure "cache_gmt" also known as «Global mapper cache» to use it in SASPlanet [http://www.sasgis.org/](http://www.sasgis.org/sasplaneta/)

https://slazav.xyz/maps/hr/slazav_hr.mbtiles - Slazav mountaineering maps 
https://slazav.xyz/maps/podm/all_podm.mbtiles - Slazav MMB maps
https://tiles.nakarte.me/files/ - maps from https://nakarte.me/

This scripts convert converts the sqlite database from mapname.mbtiles to a SasPlanet cache_gmt folder:

*.mbtiles -> files in folder structure C:\SASPlanet\cache_gmt\slazav_hr\Z10\283\...

How to use a script with dialogues  convert_with_dialog.cmd

1. Download all files to one dir (for ex.”convert”)
2. Copy source map file *.mbtiles to convert_dir
3. Run convert_with_dialogs.cmd
4. Select an mbtiles file in a file dialog.
5. Select Sasplanet main folder (f.e. C:\SasPlanet). 
6. Run SasPlanet. Open main menu. Open Layers and select map with the same name as mbtiles filename.


How to use manually editable script convert_args_edit.cmd.

1. Download all files to one dir (for ex.”convert”)
   
2. Copy source map file *.mbtiles to convert_dir
   
3. Open convert_args_edit.cmd in а text editor and specify the name of *.mbtiles file (without trailing spaces!)

set mbtiles=slazav_hr.mbtiles

4. Specify the destination folder with tiles to "dirtiles" variable  (without trailing spaces and trailing slash symbol!)

set dirtiles=c:\sasplanet\cache_gmt\slazav_hr

5. Save convert_args_edit.cmd and run it.

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
