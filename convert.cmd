rem mbtiles - sqllite file with mbtiles cache (source)
rem dirtiles - new folder with google tiles cache (destination !with no ending spaces no \ , a typical folder looks like C:\SASPlanet\cache_gmt\slazav_hr)


set mbtiles=all_podm.mbtiles
set dirtiles=E:\SASPlanet_230909\cache_gmt\all_podm


sqlite3 %mbtiles% "SELECT DISTINCT 'IF NOT EXIST %dirtiles%\'||'Z'||cast(zoom_level as text)||'\'||cast(((1<<zoom_level)-1)-tile_row as text)||' mkdir %dirtiles%\'||'Z'||cast(zoom_level as text)||'\'||cast(((1<<zoom_level)-1)-tile_row as text) FROM tiles WHERE zoom_level>0" >2_mk_dir.cmd
call 2_mk_dir.cmd
sqlite3 %mbtiles% "SELECT writefile('%dirtiles%\Z'||cast(zoom_level as text)||'\'||cast(((1<<zoom_level)-1)-tile_row as text)||'\'||cast(tile_column as text)||'.png', tile_data) FROM tiles"

echo Done!
pause

