[toc]
# mysqld
- mysql:9.2.0(当前验证版本)
- mysql:8.0.30
## 文件说明
- config_3306/: 这个是配置文件，里面有详细的注释，也可不修改直接用(nas 自用或自己开发环境)
- .env: 容器的配置文件，可以修改，也可以直接用不修改，里面有以下重要参数
	- image: docker 镜像
	- MYSQL_ROOT_PASSWORD: mysql 管理员密码
	- 其它及详情参数文件中有注释
- docker-compose.yaml: docker 容器编排文件，此文件不用修改
- ctrl: 封装的一些命令, 初始化环境呀，数据卷备份，数据卷恢复，等

## ctrl 命令用法
```txt
用法: ./ctrl [选项]
可用选项:
	init			初始化容器部署文件(端口转发), 没有执行 private 之前
	init private	初始化容器部署文件(nginx 代理)
	init public		还原容器部署文件为(端口转发)
	save			备份容器的数据卷(备份在 backup/<数据卷名称>.tar.gz)
	save <备份名称>	备份容器的数据卷(备份在 backup/<备份名称>.tar.gz)
	load			还原备份容器的数据卷(备份在 backup/<数据卷名称>.tar.gz)
	load <备份名称>	还原备份容器的数据卷(备份在 backup/<备份名称>.tar.gz)
	sql <sql语句>	执行 sql 语句
```


## 部署容器
- 端口转发版
	```shell
	./ctrl init
	docker compose up -d
	```
- nginx 代理版
	```shell
	./ctrl init private
	docker compose up -d
	```
	将 mysqld.nginx.conf 放入 nginx 配置文件目录中

默认初始化密码是 0123456789，也可以到 .env 文件中修改 MYSQL_ROOT_PASSWORD 的值来改变初始化密码
