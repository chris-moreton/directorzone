mysqldump -uroot -p --add-drop-database --disable-keys --databases directorzone_zf2 > /home/cmoreton/db_create.sql
cd /home/cmoreton
rm db_create.zip
zip db_create.zip db_create.sql
rm db_create.sql
