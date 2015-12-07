
cd "D:/home/SiteExtensions/mysql/mysql-5.7.9-win32"

echo "Starting mysqld"

"bin/mysqld" --standalone --log_syslog=0 &

while [ ! -e "$WEBJOBS_SHUTDOWN_FILE" ]
do
  sleep 5
done

"bin/mysqladmin" shutdown -u root

sleep 5

echo "Shutdown mysqld"