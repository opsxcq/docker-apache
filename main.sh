#!/bin/bash

SITE=$1
ADMIN_EMAIL=$2
if [ ! -f /etc/apache2/sites-available/default ]
then
    echo '[+] Generating site configuration'
    cat << EOF
<VirtualHost *:80>
    ServerName ${SITE}
    ServerAdmin ${ADMIN_EMAIL}

    DocumentRoot /www
    <Directory /www>
        Options -Indexes
        AllowOverride all
        Order allow,deny
        allow from all
    </Directory>

    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    LogLevel warn

     ErrorLog /dev/stderr
     TransferLog /dev/stdout

</VirtualHost>
EOF
fi

# Set apache variables
source /etc/apache2/envvars
apachectl -f /etc/apache2/apache2.conf

while [ true ]
do
    tail -f /var/log/apache2/*.log
    sleep 10
done;