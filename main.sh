#!/bin/bash


if [ -z "$SITE" ]
then
    echo 'Prease inform an SITE variable, using default'
    SITE=localhost
fi

if [ -z "$ADMIN_EMAIL" ]
then
    echo 'Please inform an admin email, using default'
    ADMIN_EMAIL='root@localhost'
fi

if [ ! -f /etc/apache2/sites-available/default ]
then
    echo '[+] Generating site configuration'
    cat > /etc/apache2/sites-available/default << EOF
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
