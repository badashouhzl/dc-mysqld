#!/bin/sh



g_containerName="mysqld"
g_volumeName=vol-$g_containerName
g_savePath="/var/lib/mysql"


# 工作路径
g_workPath=$(cd `dirname \$0`; pwd -P)
cd $g_workPath


# 创建 volume
# @param $1 volume 名称
mkVolume(){
	volName="$1"
	b=`docker volume ls | grep ${volName} | awk '{print $2}'`

	if [ ${#volName} == ${#b} ]
	then
		echo "volume ${volName} exist"
	else
		echo "volume ${volName} not exist"
		docker volume create  ${volName}
		echo "create volume ${volName}"
	fi
}



# 创建 volume
# @param $1 容器名称
# @param $2 volume 名称 (输出的数据包名称)
# @param $3 要打包的目录 (volume 挂载的目录)
function load() {
	echo "start load "$2 " -> "$2".tar"
	docker run --rm -v $2:$3:rw -v$(pwd -P):/backup ubuntu tar xf /backup/$2.tar -C /
	echo "end load "$2 " -> "$2".tar"
}


mkVolume $g_volumeName

load $g_containerName $g_volumeName $g_savePath