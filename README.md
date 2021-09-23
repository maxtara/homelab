# Raspberry Pi home lab
  
## Images
  
  * unifi
  * pihole
  * telegraf
  * localhost
  * coredns_up
  * influxdb
  * grafana
  * ftp
  * mosquitto
  * zigbee2mqtt
  * zigbee2mqttassistant
  * portainer
  * homeassistant
  * nginx
  
And some custom images, on github
  
  * [max_aqi](https://github.com/maxtara/sds-mqtt)
  * [max_reo](https://github.com/maxtara/reoyolo)
  * [max_sucks](https://github.com/maxtara/sucks)

## Raspberry pi docker notes
      
```
# Login
export DOCKER_HOST=ssh://pi
# Start
docker-compose -p max up -d --remove-orphans
# Update
docker-compose -p max pull
# Stop
docker-compose -p max down --remove-orphans

```
  
# Other notes
### Setup RPI notes
```
# Flash image
touch /ssh # On the drive
echo "console=serial0,115200 console=tty1 root=PARTUUID=9820fc7c-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait ip=192.168.1.X cgroup_enable=memory cgroup_memory=1 swapaccount=1" > /boot/cmdline.txt

sudo nano /etc/dhcpcd.conf
    > interface eth0
    > static ip_address=192.168.1.X
    > static routers=192.168.1.1
apt-get update && apt-get upgrade
curl -sSL https://get.docker.com | sh
sudo reboot

```
