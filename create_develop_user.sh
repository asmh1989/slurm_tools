#! /bin/bash

for item in `cat /public/home/sun/slurm_tools/account.conf | grep -v '^#'`; do
    echo "find account : ${item}"
    uid=`echo $item | cut -d '=' -f 2 `
    account=`echo $item | cut -d '=' -f 1 `
    cat /etc/passwd | grep "$account:x" > /dev/null
    if (( $? != 0 )); then
        sudo useradd -d /home/$account  -u $uid -m $account -s /bin/bash
        # 自动修改密码
        pp=`date +%s | sha256sum | base64 | head -c 32 ; echo`
        echo "$account 's password = $pp"
        echo "$account:$pp" | sudo chpasswd
        sudo chage -E -1 -m -1 -M 90 -I 14 -W 14 $account
        echo "创建 $account 成功!"
    else
        echo "$account 已经存在!"
    fi 
    # sudo usermod -a -G sz_user $account
done

