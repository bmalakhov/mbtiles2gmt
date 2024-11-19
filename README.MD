mbtiles2gmt
Скрипт для конвертации файлов *.mbtiles (формат БД sqllite) в файловый тайловый кэш формата "cache_gmt"  (Global mapper cache) для SASPlanet http://www.sasgis.org/

https://slazav.xyz/maps/hr/slazav_hr.mbtiles - Горные карты Славы З. актуальная версия.
https://slazav.xyz/maps/podm/all_podm.mbtiles - ММБ актуальная версия.
https://tiles.nakarte.me/files/ - некоторые карты с FTP накарте


Скрипт достает PNG файлы из *.mbtiles и раскладывает их в структуру кэша SASPlanet вида C:\SASPlanet\cache_gmt\slazav_hr\Z10\283...

Автоматический скрипт с диалогами convert_with_dialogs.cmd

Как пользоваться:

1) Копируем все файлы репозитория в одну папку (например "С:\convert") 
2) Туда же кладем исходный файл с картой *.mbtiles (Файл slazav_hr.mbtiles для демо.)
3) Запускаем convert_with_dialogs.cmd
4) В файловом диалоге выбираем файл mbtiles. Если это не БД и ли БД не того формата, скрипт прервет работу, иначе напишет число тайлов карты.
5) В диалоге указываем основную папку СасПланеты, например C:\SasPlanet.  Скрипт создаст C:\SASPlanet\cache_gmt\<имя карты>. Зальет туда тайлы. 
6) Если каталог C:\SasPlanet\maps\<имя карты>.zmp существует, скрип предложит его удалить. И далее пересоздаст его, а в файл params.txt пропишет нужные данные.
7) Карта подключится слоем в меню "Слои" с именем исходного файла mbtiles

Редактируемый вручную скрипт convert_args_edit.cmd

Как пользоваться:

1) Копируем все файлы репозитория в одну папку (например "С:\convert") Файл slazav_hr.mbtiles в репозитории демонстрационно-тестовый.
2) Туда же кладем исходную карту *.mbtiles
3) Открываем блокнотом convert_args_edit.cmd и редактируем 2 переменные  (без концевых пробелов и концевого \!)

Имя файла с картой и путь с кэшу, например:

set mbtiles=slazav_hr.mbtiles
set dirtiles=c:\sasplanet\cache_gmt\slazav_hr

Сохраняем и запускаем convert_args_edit.cmd. Если все ок файлы появятся в кэше.

Как добавить карту вручную в меню SASPlanet:

Кэш должен оказаться в папке cache_gmt вида C:\SASPlanet\cache_gmt\slazav_hr\Z8..

Необходимо скопировать еще один каталог с 5 файлами "slazav_hr.zmp" в папку C:\SASPlanet\maps\
Карта должна появиться в виде слоя в меню "Слои"

Эти  папки копируем один раз в C:\SASPlanet\maps\ и потом их обновлять не надо.

all_podm.zmp - отредактирован для карт ММБ

slazav_hr.zmp - для горных карт 

Если нужно сделать еще один MAP каталог для других карт, то нужно сделать копию и отредактировать файл params.txt.
Файл params.txt содержит настройки отвечающие за то, как карта отображется в SasPlanet.
Для каждой карты или слоя такой файл лежит в каталоге C:\sasplanet\maps\slazav_hr.zmp\params.txt 
Каждой карте "mapname" соответствует каталог "mapname.zmp" с файлом "params.txt" внутри.
Каталог mapname.zmp всегда! должен заканчиваться на .zmp.

В файле params.txt: 

GUID={...} - уникальный ID, если выдается ошибка про дубликаты можно сгенерировать новый (см. в поисковике как сгенерировать GUID windows PowerShell )
name=slazav_hr - имя карты в меню SASPlanet
asLayer=1 - признак, что это слоем поверх других карт
NameInCache=slazav_hr должно совпадать с именем подпапки в cache_gmt
Ext=.png - всегда png в mbtiles
CacheType = 4 указывает, что это кэш формата "Global mapper" и он лежит в C:\SASPlanet\cache_gmt...
