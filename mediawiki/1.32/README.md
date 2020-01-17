![logo](https://raw.githubusercontent.com/docker-library/docs/0e325698c0f701882e333c6cb112a0f1fa98a003/mediawiki/logo.png)

# How to use this image

The basic pattern for starting a `mediawiki` instance is:

```powershell
$ docker run --name some-mediawiki -d mediawiki
```

If you'd like to be able to access the instance from the host without the container's IP, standard port mappings can be used:

```powershell
$ docker run --name some-mediawiki -p 8080:80 -d mediawiki
```

Then, access it via `http://localhost:8080` or `http://host-ip:8080` in a browser.

```powershell
$ sudo docker cp docs/LocalSettings.php 082e5019880b:/var/www/html/LocalSettings.php
```



# MySQL

```powershell
$ docker run --name mysql -v $PWD/datadir:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret -d mysql:5.7
$ docker run --name some-mediawiki --link mysql:mysql -d mediawiki
```

- Database type: `MySQL, MariaDB, or equivalent`
- Database name/username/password: `<details for>` (`MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE`; see environment variables in the description for [`mariadb`](https
://hub.docker.com/_/mariadb/))
- ADVANCED OPTIONS; Database host: `some-mysql` (for using the `/etc/hosts` entry added by `--link` to access the linked container's MySQL instance)

# PostgreSQL

```powershell
$ docker run --name postgres -v $PWD/docs/datadir:/var/lib/postgresql/data -d postgres:9
```

```powershell
$ docker run --name mediawiki --link postgres:postgres -d mediawiki
```

```powershell
POSTGRES_PORT_5432_TCP=tcp://172.17.0.3:5432
MEDIAWIKI_VERSION=1.32.2
POSTGRES_PORT_5432_TCP_ADDR=172.17.0.3
POSTGRES_ENV_PGDATA=/var/lib/postgresql/data
PWD=/var/www/html
HOME=/root
POSTGRES_PORT_5432_TCP_PORT=5432
PHP_LDFLAGS=-Wl,-O1 -Wl,--hash-style=both -pie
POSTGRES_NAME=/mediawiki/postgres
POSTGRES_PORT=tcp://172.17.0.3:5432
```

# Volumes

By default, this image does not include any volumes.

The paths `/var/www/html/images` and `/var/www/html/LocalSettings.php` are things that generally ought to be volumes, but do not explicitly have a `VOLUME` declaration 
in this image because volumes cannot be removed.

```powershell
$ docker run --name mediawiki -p 80:80 -v $PWD/images:/var/www/html/images --link mysql:mysql -d dailynuts/mediawiki:tag
```
