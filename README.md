
Docker Nagios
===========================

This is a modified version of [https://hub.docker.com/r/sunggun/nagios/ ]()


## Usage

### Pull the image from Docker hub

```
docker pull ysde/nagios
```

### Run the Container

```bash
docker run --name nagios -d \
  -v <your-nagios-etc-directory>:/usr/local/nagios/etc/ \
  -h <your-hostname>  \
  -p 80:80 ysde/nagios:4.3.2
```
or using the ***--net=host*** mode and specify the ***NAGIOS_PORT*** if you want.

```bash
docker run --name nagios -d \
  --net=host \
  -e NAGIOS_PORT=YOUR_CHOSEN_PORT \
  -v <your-nagios-etc-directory>:/usr/local/nagios/etc/ \
  -h <your-hostname>  \
  ysde/nagios:4.3.2
```

### Access to Nagios Dashboard
```
http://hostname
```

### Credential

Default user account and password is 

- User name : `nagiosadmin`
- Password : `nagios123`

You can change user name and password :

```
docker exec nagios htpasswd -c -b -s /usr/local/nagios/etc/htpasswd.users <username> <password>
```
