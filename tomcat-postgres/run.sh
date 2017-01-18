#!/bin/bash

# Stop on error
set -e

# Variables
DATA_DIR=/var/lib/pgsql/data

#start postgreSQL
echo "starting postgreSQL ... "

# CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]

su postgres -c "pg_ctl -D $DATA_DIR -l ${DATA_DIR}/logfile start"

echo "started postgreSQL"

#start tomcat
echo "starting tomcat ... "

echo "export JAVA_OPTS=\"-Dapp.env=dev\"" > /usr/local/tomcat/bin/setenv.sh  

./opt/tomcat/bin/catalina.sh &



echo "started tomcat"

# keep the stdin
/bin/bash