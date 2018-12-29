#!/usr/bin/bash
echo "going shutdown"
# 获取当前服务目录文件的名称
service=$(basename `pwd`)
path=`find ./ -name *.jar`
file=${path:2}
# 强制杀掉进程
kill -9 `ps -ef|grep $file | awk '{print $2}'`;
nohup>log java -jar $file 2>&1 &
echo "going startup"  && tail -20f log
