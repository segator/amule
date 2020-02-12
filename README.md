# Amule Docker
Amule Docker GUI + DAEMON

## Daemon Image
The Daemon image is where Amule logic and downloads runs, there are no frontend it's only a simple daemon.

### Build
```
cd amule-daemon
docker build -t segator/amule:daemon
```

### Deploy
```
docker run -it --rm -e AMULE_PORT=35111 -e AMULE_PWD=mypassword -p 4712:4712 -p 35111:35111 -p 35111:35111/udp -p 35113:35113/udp -v /tmp:/amule segator/amule:daemon
```

### Environment variables

- **AMULE_PORT:** TCP/UDP Port (Default 4662) The port and the port+3 need to be published
- **AMULE_DAEMON_PORT:** Daemon Port (Default 4712)
- **AMULE_PWD:** Password required to login on the daemon(no default password,  set your own!!)
- **AMULE_MAX_SOURCES_FILE:** Max sources per file (Default 500)
- **AMULE_MAX_CONNECTIONS:** Max connections (Default 1500)
- **AMULE_TEMP:** Temporal Download path (Default /amule/tmp)
- **AMULE_INCOMING:** Download Path (Default /amule/download)
- **AMULE_DOWNLOAD_CAPACITY:** download capacity in KB (Default 200000)
- **AMULE_UPLOAD_CAPACITY:** download capacity in KB (Default 10000)

### Volumes

- `/amule/download`: Complete downloads
- `/amule/tmp`: Incomplete downloads

## GUI Image
The GUI image is a desktop application that connects to the daemon, there is not logic here, it's only a frontend.

### Build
```
cd amule-gui
docker build -t segator/amule:gui
```

### Deploy
```
docker run -it --rm -e AMULE_HOST=192.168.1.15 -e VNC_PASS=mypassword -e AMULE_PWD=mypassword -p 8080:8080 segator/amule:gui
```

### Environment variables

- **AMULE_PORT:** Amule Daemon Port
- **AMULE_HOST:** Amule Daemon IP
- **AMULE_PWD:** Amule Daemon Password

### Volumes
No Volumes, it's a simple frontend...
