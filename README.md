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
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120
# Login
export DOCKER_HOST=ssh://pi
# Start
docker-compose -p max up -d --remove-orphans
# Update
docker-compose -p max pull
# Stop
docker-compose -p max down --remove-orphans

# Update a single image. Pull Latest, Stop, remove, start (all)
docker-compose -p max pull
docker stop unifi
docker rm unifi
docker-compose -p max up -d --remove-orphans

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
  
### Setup rclone/onedrive
```
# Need to configure rclone seperately, as onedrive uses oauth url redirection
  docker run -i -t --rm \
    --volume /home/pi/rclone/config:/config/rclone \
    --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro \
    --device /dev/fuse \
    rclone/rclone config

# Dont use 'autoconfig' option at the end, and it'll give you instructions. Basically run
  .\rclone.exe authorize "onedrive"
On a machine with a browser. Its a single binary
```