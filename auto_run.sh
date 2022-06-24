#! /bin/bash

echo "start run at `hostname`"
cd /public/home/sun/slurm_tools/ 

sudo bash create_slurm_user_without_sacct.sh
# sudo userdel baoyu
echo "end run at `hostname`"
