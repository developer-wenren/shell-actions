#!/usr/bin/bash
echo "going shutdown"
# 获取当前Tomcat目录文件的名称
tomcat=$(basename `pwd`)
# 强制杀掉进程
kill -9 `ps -ef|grep tomcat | awk '{print $2}'`;
# 启动 Tonmcat
./bin/startup.sh;
echo "going startup"
