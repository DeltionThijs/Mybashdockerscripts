docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest



Portainer Key voor business:

#           2-1bovql9go4RXM72I1aKyrg0aaK624EGWXLs5oNf3Wa/HWHn2lLY4fhJyq66uCSPjbfDIcedJs0KkFuGyIlw3ww==
