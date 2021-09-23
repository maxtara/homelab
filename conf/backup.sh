#!/bin/sh
set -ex
echo "Backup of configuration"
/usr/bin/tar -cvzf /home/*/backups/backup_`date +%Y%m%d`.tar.gz \
    /home/*/ftp \
    /home/*/grafana \
    /home/*/nginx \
    /home/*/unifi \
    /home/*/portainer \
    /home/*/mosquitto \
    /home/*/zigbee2mqtt 

echo "Backup of databases. Stop containers first"
/usr/bin/docker stop influxdb homeassistant
/usr/bin/tar -cvzf /home/*/backups/backup_dyn_`date +%Y%m%d`.tar.gz /home/*/influxdb/ /home/*/homeassistant /

echo "Restarting containers"
/usr/bin/docker start influxdb homeassistant

