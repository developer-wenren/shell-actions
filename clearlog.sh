#!/usr/bin/bash
path=$1;
if [[ "$path" = "" ]];then
path='./'
fi
echo "Are you sure clearing log files in path: $path,input y to continue ?";
read needClear
if [[ "$needClear" = "y" ]];then
find $path -mtime +10 -name '*.txt*' -exec rm -rf {} \;
find $path -mtime +10 -name '*.log*' -exec rm -rf {} \;
find $path -mtime +10 -name '*.out*' -exec rm -rf {} \;
find $path -mtime +10 -name '*.zip*' -exec rm -rf {} \;
echo "path: $path clear log done ^v^ "
else
echo "nothing happened ^v^ "
fi
