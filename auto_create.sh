#! /bin/bash

ssh -p 6666 admin@cpu25 "bash /public/home/sun/slurm_tools/auto_run.sh"
ssh -p 6666 admin@cpu212 "bash /public/home/sun/slurm_tools/auto_run.sh"
ssh -p 6666 admin@gpu27 "bash /public/home/sun/slurm_tools/auto_run.sh"
ssh -p 6666 admin@gpu28 "bash /public/home/sun/slurm_tools/auto_run.sh"
ssh -p 6666 admin@gpu29 "bash /public/home/sun/slurm_tools/auto_run.sh"
