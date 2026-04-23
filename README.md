# SambaFS
Simple Samba file server.

## Quick reference
* Where to file issues:
[GitHub](https://github.com/gianlucavagnuzzi/sambafs/issues)

* Supported architectures: amd64 , armv7 , arm64v8

## Installation
```
cd /opt
git clone https://github.com/rardcode/sambafs.git
cd /opt/sambafs
```
Launch docker the first time: a simple smb.conf will be created in data/ dir.\
Docker is ready for a public samba share in /srv/samba/public.\
Edit data/smb.conf with your desidered shares and compose.yml with group/user to add.


## How to run
### With docker run
You can run it with docker run:
```
docker run -d -p 139:139 -p 445:445 \
 -e USER1=userID|username|password \ # optional
 -e GROUP1=groupname|user1|user2 \ # optional
 -v "/srv/samba:/srv/samba" \
 -v "./data:/data" \
 rardcode/sambafs \
```
### With docker-compose file
```
services:
  sambafs:
    image: rardcode/sambafs
    container_name: sambafs
    restart: unless-stopped
    ports:
      - 137:137/udp
      - 138:138/udp
      - 139:139
      - 445:445
    #environment:
    #  - USER1=userID|username|pass
    #  - GROUP1=groupname|user1|user2
    volumes:
    #- /srv/samba:/srv/samba
    - ./data:/data
```

## Changelog
### v3234.4226r0 - 23.04.2026
- Alpine v.3.23.4

### v3233.4226r0 - 20.03.2026
- Alpine v.3.23.3
- Samba v.4.22.6-r0
