#! /bin/bash
for item in `cat /public/home/sun/slurm_tools/account.conf`; do
    echo "find account : ${item}"
    uid=`echo $item | cut -d '=' -f 2 `
    account=`echo $item | cut -d '=' -f 1 `
    sudo chage -d 2022-4-1 -E -1 -m -1 -M 180 -I 14 -W 14 $account
done