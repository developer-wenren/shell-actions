#!/bin/bash
used=`df   -h |grep /dev/vda1 | awk '{print $5}'`
used=${used%%%*}
if [ "$used" -lt "80" ]
then
  echo '磁盘占用小于80%,不需要迁移日志'

else
  echo '磁盘占用大于80%,开始迁移日志'

  srcDirectory=$1
  destDirectory=$2
  if [ "$srcDirectory" == "/" -o "$srcDirectory" == "" ]
  then
    echo '不能输入 / 或者空'
  else
    cp -f ${srcDirectory}/* ${destDirectory}/
    find ${srcDirectory}/ -mtime +10 -name "*.out" -exec rm -rf {} \;
    find ${srcDirectory}/ -mtime +10 -name "*.txt" -exec rm -rf {} \;
    find ${srcDirectory}/ -mtime +10 -name "*.log" -exec rm -rf {} \;
    find ${srcDirectory}/ -mtime +10 -name "*.zip" -exec rm -rf {} \;
    echo '磁盘迁移日志完毕'
  fi
fi
