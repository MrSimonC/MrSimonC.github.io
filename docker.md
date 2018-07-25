# Docker

## Installation in windows 10

* In the bios, turn on Intel Virtualization
* Type "features" into Windows start (i.e. go to "Turn Windows features on or off")
* In HyperX, tick all the boxes
* [Install docker](https://store.docker.com/editions/community/docker-ce-desktop-windows)

## Run docker container(s)

### Errors

As most docker examples are for linux, when running docker on windows, you may see some unfamiliar errors.

#### invalid reference format error

Wrap the `$PWD` command, from:

```powershell
docker run -d -p 80:80 --name my-apache-php-app -v "$PWD":/var/www/html php:7.0-apache
```

to

```powershell
docker run -d -p 8123:80 --name my-apache-php-app -v "${PWD}:/var/www/html" php:7.0-apache
```

