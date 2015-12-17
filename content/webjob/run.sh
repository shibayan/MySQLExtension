
cd "D:/Program Files (x86)/mysql/5.7.9.0/bin"

echo "Starting mysqld"

mysqld --defaults-file=d:/home/SiteExtensions/mysql/my.ini --standalone --log_syslog=0 &

while [ ! -e "$WEBJOBS_SHUTDOWN_FILE" ]
do
  sleep 1
done

mysqladmin --defaults-file=d:/home/SiteExtensions/mysql/my.ini shutdown -u root 2>/dev/null

wait

echo "Shutdown mysqld"