# DockerCalibreGui_Server

Debian Stable docker container, novnc x11fb based to run the latest calibre gui to have more flex than running calibre web.  
Calibre Full gui with running the net server allows multiple libraries hosted under 1 server but at the cost of more disk space used
for getting into the GUI for management.

example docker-compose:

version: '2'
services:
  Calibre:
         image: calibre:custom
         container_name: calibre-gui
         network_mode: bridge
         restart: unless-stopped
         ports:
                 - "8081:8080" #noVNC
                 - "8082:8081" #Calibre Web Port to be assigned in GUI on first setup
         volumes:
                 - /opt/Calibre/config:/root/.config/calibre
                 - /opt/Calibre/Library:/mnt/Libraries
         mem_limit: 2048m
