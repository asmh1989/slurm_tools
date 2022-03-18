## Slurm 不同用户运行脚本注意点

### master 节点上

需要同时存在相同uid的用户

### login 节点上

根据真实开发人员信息, 构建用户, login节点上的uid需要在master节点上存在, 不然会出现如下问题

```
srun: error: Unable to create step for job 56: Error generating job credential
```

### 重点

如果保持`login`节点上的用户名和id与`master`节点保持一致, 那么在`login`节点上跑的任务都会自带`Account`信息