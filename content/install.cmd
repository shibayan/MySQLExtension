
:: Installing MySQL
curl -LOs https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.9-win32.zip
unzip -q mysql-5.7.9-win32.zip & rm -f mysql-5.7.9-win32.zip

copy /Y my.ini mysql-5.7.9-win32\my.ini
mkdir d:\home\data\mysql

:: Initialize MySQL
cd mysql-5.7.9-win32

"bin/mysqld" --initialize-insecure --user=mysql --log_syslog=0

:: Setup WebJob
SET WEBJOB_PATH=%WEBROOT_PATH%\App_Data\jobs\continuous\mysqld

mkdir %WEBJOB_PATH%
xcopy ..\webjob %WEBJOB_PATH% /E /C

:: Create Database
IF DEFINED LOCALMYSQL_DATABASE (
  sleep 60

  "bin/mysql" -u root -e "CREATE USER '%LOCALMYSQL_USERNAME%'@'%%' IDENTIFIED BY '%LOCALMYSQL_PASSWORD%';GRANT USAGE ON *.* TO '%LOCALMYSQL_USERNAME%'@'%%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;CREATE DATABASE IF NOT EXISTS `%LOCALMYSQL_DATABASE%`;GRANT ALL PRIVILEGES ON `%LOCALMYSQL_DATABASE%`.* TO '%LOCALMYSQL_USERNAME%'@'%%';"
)