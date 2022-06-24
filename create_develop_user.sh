#! /bin/bash

for item in `cat account.conf`; do
    echo "find account : ${item}"
    uid=`echo $item | cut -d '=' -f 2 `
    account=`echo $item | cut -d '=' -f 1 `
    cat /etc/passwd | grep "$account:x:$uid" > /dev/null
    if (( $? != 0 )); then
        sudo useradd -d /home/$1  -u $uid -m $1 -s /bin/bash
        sudo chage -E -1 -m -1 -M 90 -I 14 -W 14 $account
        echo "创建 $account 成功!"
    else
        echo "$account 已经存在!"
    fi 
    sudo usermod -a -G sz_user $account
done

