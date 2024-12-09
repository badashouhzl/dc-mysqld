#!/bin/sh



g_containerName="mysqld"
g_volumeName=vol-$g_containerName
g_savePath="/var/lib/mysql"


# 工作路径
g_workPath=$(cd `dirname \$0`; pwd -P)
cd $g_workPath

# 创建 volume
# @param $1 容器名称
# @param $2 volume 名称 (输出的数据包名称)
# @param $3 要打包的目录(volume 挂载的目录)
function save() {
	echo "start save "$2 " -> "$2".tar"
	docker run  --rm --volumes-from $1 -v $(pwd -P):/backup ubuntu tar cf /backup/$2.tar $3 
	echo "end save "$2 " -> "$2".tar"
}


save $g_containerName $g_volumeName $g_savePath