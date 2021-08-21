![](https://shaojiemike.oss-cn-hangzhou.aliyuncs.com/img/20210726183429.png)

## 常用slurm指令

```
# 查看仍在运行作业7454119的详细信息
scontrol show job 7454119

# sacct查询已经结束作业的相关信息
format=jobid,jobname,partition,nodelist,alloccpus,state,end,start,submit
sacct --format=$format -j 7454119
```