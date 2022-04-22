#! /bin/bash



function create () {
    uid=`cat account.conf | grep "^$1="`


    uid=$2
    # 新建linux 用户
    echo "开始新建linux 用户: $1 uid:$uid"

    sudo useradd -d /public/home/$1  -u $uid -m $1 -s /bin/bash
    if (( $? != 0 )); then
        echo "新建用户失败!" 
        exit 1
    fi

    # 自动修改密码
    echo "$1:$1" | sudo chpasswd



    # # 新建的用户加入到slurm组中
    # echo "$1 添加到slurm组中"
    # sudo usermod -a -G slurm $1

    # 新建
    echo "开始新建 sacctmgr 信息"
    sudo sacctmgr create account name=$1 
    sudo sacctmgr create user name=$1 account=$1 
    echo "done!"
}


for item in `cat account.conf`; do
    echo "find account : ${item}"
    uid=`echo $item | cut -d '=' -f 2 `
    account=`echo $item | cut -d '=' -f 1 `

    cat /etc/passwd | grep "$account:x:$uid" > /dev/null
    if (( $? != 0 )); then
        create $account $uid
        echo "创建 $account 成功!"
    else
        echo "$account 已经存在!"
    fi 

    sudo usermod -a -G slurm $account
done