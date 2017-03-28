# Vanilla Apache Httpd

A vanilla Apache Httpd server running on Debian Jessie with PHP5 and PHP Mysql drivers.

#### TCP Port

This image listen on port 80 by default

#### Volumes

By default you can add your files to `/web` folder.

#### Variables

Some useful environment variables

* `SITE` - Represents the `ServerName` variable on apache configuration file
* `ADMIN_EMAIL` - Represents the `ServerAdmin` variable on apache configuration file

#### Notes

`apt-get` lists were not removed, so you can install something if you want to with no effort.

If you want to use your custom configuration file for apache, just override the `/etc/apache2/sites-enabled/000-default.conf` file, so the configuration generation will be disabled and `SITE` and `ADMIN_EMAIL` variables won't have any effect. 



#### 
[![Docker Pulls](https://img.shields.io/docker/pulls/strm/apache.svg?style=plastic)](https://hub.docker.com/r/strm/apache/)

![License](https://img.shields.io/badge/License-GPL-blue.svg?style=plastic)
