#! /bin/bash

for item in `cat account.conf`; do
    echo "find account : ${item}"
    uid=`echo $item | cut -d '=' -f 2 `
    account=`echo $item | cut -d '=' -f 1 `
    cat /etc/passwd | grep "$account:x:$uid" > /dev/null
    if (( $? != 0 )); then
        sudo useradd $account -u $uid
        echo "创建 $account 成功!"
    else
        echo "$account 已经存在!"
    fi 
    sudo usermod -a -G slurm $account
done



