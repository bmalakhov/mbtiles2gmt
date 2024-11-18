echo Select *.mbtiles file.
echo off
SET gmt=cache_gmt
set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"

for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "file=%%p"
echo selected  file is : "%file%"
If NOT EXIST %file% "EXIT /B"
del ntiles.txt
sqlite3 %file% "SELECT count(1) FROM tiles WHERE zoom_level>0" > ntiles.txt
set /p ntiles=<ntiles.txt
If %ntiles%==""  "EXIT /B"
echo on
echo Tiles=%ntiles% in the %file%! Select the SASPlanet folder. (example: C:\SasPlanet)
echo off
set cachename=%file%
for %%f in ("%cachename%") do set cachename=%%~nf
If %cachename% == "" "EXIT /B"
echo Select SasPlanet main folder.


setlocal
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Select C:\SasPlanet folder.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"

setlocal enabledelayedexpansion

If NOT EXIST %folder% "EXIT /B"
endlocal
echo on
set folder_gmt=%folder%\%gmt%\%cachename%
echo The gmt tiles folder = %folder_gmt%

sqlite3 %file% "SELECT DISTINCT 'IF NOT EXIST %folder_gmt%\'||'Z'||cast(zoom_level as text)||'\'||cast(((1<<zoom_level)-1)-tile_row as text)||' mkdir %folder_gmt%\'||'Z'||cast(zoom_level as text)||'\'||cast(((1<<zoom_level)-1)-tile_row as text) FROM tiles WHERE zoom_level>0" >2_mk_dir.cmd
call 2_mk_dir.cmd
sqlite3 %file% "SELECT writefile('%folder_gmt%\Z'||cast(zoom_level as text)||'\'||cast(((1<<zoom_level)-1)-tile_row as text)||'\'||cast(tile_column as text)||'.png', tile_data) FROM tiles"

set folder_map=%folder%\maps

msg %username% %ntiles% tiles done in %folder_gmt%! 

IF EXIST %folder_map%\%cachename%.zmp DEL %folder_map%\%cachename%.zmp

Xcopy /E /I mbtiles.zmp %folder_map%\%cachename%.zmp

IF NOT EXIST %folder_map%\%cachename%.zmp\params.txt echo folder  %folder_map%\%cachename%.zmp\params.txt creation failed, you can create it manually
IF NOT EXIST %folder_map%\%cachename%.zmp\params.txt "EXIT /B"

echo %folder_map%\%cachename%.zmp\params.txt
echo NameInCache=%cachename% >> %folder_map%\%cachename%.zmp\params.txt
echo name=%cachename% >> %folder_map%\%cachename%.zmp\params.txt
powershell 'GUID={'+[guid]::NewGuid().ToString()+'}'  >> %folder_map%\%cachename%.zmp\params.txt

echo   %folder_map%\%cachename%.zmp\params.txt - maps data
msg %username%  Run SasPlanet. Open main menu -Layers  - %cachename%".
pause