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
- init.sh: 初始化运行环境文件，此文件不用修改
- save.sh: 保存 docker 所挂载的 volume 所用，用于备份或迁移所用，此文件不用修改
- load.sh: 加载 docker 所挂载的 volume 所用，用于备份或迁移所用，此文件不用修改

## 部署容器
时空目录后运行下面命令
```bash
sh init.sh
docker compose up -d
```

## 容器数据备份与恢复
- 备份数据，运行下面脚本
	```bash
	sh save.sh
	```
	运行后在当前目录下，会生成一个 vol-mysqld.tar 的文件，这个就是容器的数据， 用于恢复作用
- 恢复数据    
	确保 vol-mysqld.tar 在当前目录下， 运行下面脚本
	```bash
	sh load.sh
	```
