
:: Installing MySQL
curl -LOs https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.9-win32.zip
unzip -q mysql-5.7.9-win32.zip & rm -f mysql-5.7.9-win32.zip

copy /Y my.ini mysql-5.7.9-win32\my.ini

cd mysql-5.7.9-win32

"bin/mysqld" --initialize-insecure --user=mysql --log_syslog=0

:: Setup WebJob
SET WEBJOB_PATH=%WEBROOT_PATH%\App_Data\jobs\continuous\mysqld

mkdir %WEBJOB_PATH%
xcopy webjob %WEBJOB_PATH% /E /C