# installation instructions
# PostgreSQL

```powershell
$ docker run --restart=always --name postgres -v $PWD/docs/datadir:/var/lib/postgresql/data -d postgres:9
```
The default <code>postgres</code> user and database are created in the entrypoint with initdb.

```powershell
docker run -v $PWD/application-data:/var/atlassian/application-data/confluence --restart=always --name=confluence -d -p 8090:8090 -p 8091:8091 --link postgres:postgres atlassian/confluence-server
```

# MySQL

```powershell
$ docker run --restart=always --name mysql -v $PWD/datadir:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=secret -d mysql:5.7
```

Your database must use 'READ-COMMITTED' as the default isolation level.

```powershell
mysql> SET GLOBAL tx_isolation='READ-COMMITTED';
Query OK, 0 rows affected

mysql>
```

为了解决汉字乱码的问题，首先创建数据库采用utf8方式（MySQL 5.7的镜像文件），如下方式连接MySQL

```powershell
jdbc:mysql://mysql:3306/confluence?useUnicode=true&characterEncoding=utf8 
```