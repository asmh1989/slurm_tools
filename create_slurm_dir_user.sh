for item in `cat /public/home/sun/slurm_tools/account.conf | grep -v '^#'`; do
    echo "find account : ${item}"
    uid=`echo $item | cut -d '=' -f 2 `
    account=`echo $item | cut -d '=' -f 1 `
    sudo mkdir -p /mnt/slurm/$account
    sudo chown $account:$account /mnt/slurm/$account
done