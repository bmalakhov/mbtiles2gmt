mbtiles2gmt
������ ��� ����������� ������ *.mbtiles (������ �� sqllite) � �������� �������� ��� ������� "cache_gmt"  
(Global mapper cache) ��� SASPlanet http://www.sasgis.org/

https://slazav.xyz/maps/hr/slazav_hr.mbtiles - ������ ����� ����� �.
https://slazav.xyz/maps/podm/all_podm.mbtiles - ��� 
https://tiles.nakarte.me/files/ - ��������� ����� � FTP �������


������ ������� PNG ����� �� *.mbtiles � ������������ �� � ��������� ���� SASPlanet ���� C:\SASPlanet\cache_gmt\slazav_hr\Z10\283...

��� ������������:
1) �������� ��� ����� ����������� � ���� ����� (�������� "�:\convert_dir")
2) ���� �� ������ �������� ����� *.mbtiles
3) ��������� ��������� convert.cmd � ����������� 2 ����������  (��� �������� �������� � ��������� \!)

��� ����� � ������ � ���� � ����

set mbtiles=slazav_hr.mbtiles
set dirtiles=c:\sasplanet\cache_gmt\slazav_hr

��������� � ��������� convert.cmd. ���� ��� �� ����� �������� � ����.

��� �������� � ���� SASPlanet:

��� ������ ��������� � ����� cache_gmt ���� C:\SASPlanet\cache_gmt\slazav_hr\Z8..

���������� ����������� ��� ���� ������� � 5 ������� "slazav_hr.zmp" � ����� C:\SASPlanet\maps\
����� ������ ��������� � ���� ���� � ���� "����"

���  ����� �������� ���� ��� � C:\SASPlanet\maps\ � ����� �� ��������� �� ����.
all_podm.zmp - �������������� ��� ���� ���
slazav_hr.zmp - ��� ������ ���� 

���� ����� ������� ��� ���� MAP ������� ��� ������ ����, �� ����� ������� ����� � ��������������� ���� params.txt.
���� params.txt �������� ��������� ���������� �� ��, ��� ����� ����������� � SasPlanet.
��� ������ ����� ��� ���� ����� ���� ����� � �������� C:\sasplanet\maps\slazav_hr.zmp\params.txt 
������ ����� "mapname" ������������� ������� "mapname.zmp" � ������ "params.txt" ������.
������� mapname.zmp ������! ������ ������������� �� .zmp.
��� �� Sasplanet ������������ ������� zip ������ mapname.zmp � ������� ������. (���������� ������ ���� .zmp � �� zip!)
� ����� params.txt: 
GUID={...} - ���������� ID, ���� �������� ������ ��� ��������� ����� ������������� ����� (��. � ���������� ��� ������������� GUID windows PowerShell )
name=slazav_hr - ��� ����� � ���� SASPlanet
asLayer=1 - �������, ��� ��� ����� ������ ������ ����
NameInCache=slazav_hr ������ ��������� � ������ �������� � cache_gmt
Ext=.png - ������ png � mbtiles
CacheType = 4 ���������, ��� ��� ��� ������� "Global mapper" � �� ����� � C:\SASPlanet\cache_gmt...
