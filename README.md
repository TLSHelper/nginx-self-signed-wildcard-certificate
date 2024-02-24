# Instructions

## Download or clone the repo

```
git clone https://github.com/TLSHelper/nginx-self-signed-wildcard-certificate.git
```

## nginx-self-signed-wildcard-certificate folder

```
cd nginx-self-signed-wildcard-certificate
chmod +x nginx-self-signed-wildcard-certificate.sh
```

## Execute script

```
./nginx-self-signed-wildcard-certificate.sh server.acme.com
```

## nginx Configuration

1. Copy `fullchain.crt` and `server.key` to nginx SSL folder.
2. Configure nginx or use the pre-configured [default](default) nginx configuration file.
3. Start or restart nginx. On Debian/Ubuntu:
```
sudo systemctl restart nginx
```

[https://phoenixnap.com/kb/install-ssl-certificate-nginx](https://phoenixnap.com/kb/install-ssl-certificate-nginx)

## Install the root.crt on the client systems

Windows
[https://windowsreport.com/install-windows-10-root-certificates/](https://windowsreport.com/install-windows-10-root-certificates/)

Linux
[https://www.howtouselinux.com/post/install-a-ca-certificate-on-linux](https://www.howtouselinux.com/post/install-a-ca-certificate-on-linux)
