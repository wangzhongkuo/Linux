### top[options]
- h：显示帮助画面，给出一些简短的命令总结说明； 
- k：终止一个进程； 
- i：忽略闲置和僵死进程，这是一个开关式命令； 
- q：退出程序； 
- r：重新安排一个进程的优先级别； 
- S：切换到累计模式； 
- s：改变两次刷新之间的延迟时间（单位为s），如果有小数，就换算成ms。输入0值则系统将不断刷新，默认值是5s； 
- f或者F：从当前显示中添加或者删除项目； 
- o或者O：改变显示项目的顺序； 
- l：切换显示平均负载和启动时间信息； 
- m：切换显示内存信息； 
- t：切换显示进程和CPU状态信息； 
- c：切换显示命令名称和完整命令行； 
- M：根据驻留内存大小进行排序； 
- P：根据CPU使用百分比大小进行排序； 
- T：根据时间/累计时间进行排序； 
- w：将当前设置写入~/.toprc文件中

### 常用命令：
- top //每隔5秒显式所有进程的资源占用情况
- top -d 2  //每隔2秒显式所有进程的资源占用情况
- top -c  //每隔5秒显式进程的资源占用情况，并显示进程的命令行参数(默认只有进程名)
- top -p 12345 -p 6789//每隔5秒显示pid是12345和pid是6789的两个进程的资源占用情况
- top -d 2 -c -p 123456 //每隔2秒显示pid是12345的进程的资源使用情况，并显式该进程启动的命令行参数

### 示例：top

![top.png](https://raw.githubusercontent.com/wangzhongkuo/Linux/master/imgs/top.png)

- top - 17:09:35[当前系统时间]
- up 420 days,  5:39[系统运行时间]
- 3 users[当前登录用户]
- load average: 62.41, 59.50, 43.38[系统负载，即任务队列的平均长度。三个数值分别为 1分钟、5分钟、15分钟前到现在的平均值][load average](http://blog.scoutapp.com/articles/2009/07/31/understanding-load-averages "load average")
- Tasks: 158 total[进程总数]
- 2 running[正在运行进程数]
- 156 sleeping[睡眠进程数]
- 0 stopped[停止的进程数]
- 0 zombie[僵尸进程数]
- Cpu0  :
- 96.3%us[用户空间占用cpu百分比]
- 3.7%sy[内核空间占用cpu百分比]
- 0.0%ni[用户进程空间内改变过优先级的进程占用CPU百分比]
- 0.0%id[空闲CPU百分比]
- 0.0%wa[等待输入输出的CPU时间百分比]
- 0.0%hi[硬件CPU中断占用百分比]
- 0.0%si[软中断占用百分比]
- 0.0%st[虚拟机占用百分比]
- Cpu1  : 97.0%us,  3.0%sy,  0.0%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
- Mem:
- 7662648k total[物理内存总量]
- 7527224k used[物理内存使用总量]
- 135424k free[空闲内存总量]
- 4232k buffers[用作内核缓存的内存量]
- Swap:
- 0k total[交换分区总量]
- 0k used[交换分区使用总量]
- 0k free[空闲交换分区总量]
- 3675340k cached[缓冲交换分区总量]

### 进程信息
序号|  列名     |含义
----- | ------ | ---
|a    |PID     |进程id|
|b    |PPID    |父进程id|
|c    |RUSER   |Real user name|
|d    |UID     |进程所有者的用户id|
|e    |USER    |进程所有者的用户名|
|f    |GROUP   |进程所有者的组名|
|g    |TTY     |启动进程的终端名。不是从终端启动的进程则显示为 ?|
|h    |PR      |优先级|
|i    |NI      |nice值。负值表示高优先级，正值表示低优先级|
|j    |P       |最后使用的CPU，仅在多CPU环境下有意义|
|k    |%CPU    |上次更新到现在的CPU时间占用百分比|
|l    |TIME    |进程使用的CPU时间总计，单位秒|
|m    |TIME+   |进程使用的CPU时间总计，单位1/100秒|
|n    |%MEM    |进程使用的物理内存百分比|
|o    |VIRT    |进程使用的虚拟内存总量，单位kb。VIRT=SWAP+RES|
|p    |SWAP    |进程使用的虚拟内存中，被换出的大小，单位kb。|
|q    |RES     |进程使用的、未被换出的物理内存大小，单位kb。RES=CODE+DATA|
|r    |CODE    |可执行代码占用的物理内存大小，单位kb|
|s    |DATA    |可执行代码以外的部分(数据段+栈)占用的物理内存大小，单位kb|
|t    |SHR     |共享内存大小，单位kb|
|u    |nFLT    |页面错误次数|
|v    |nDRT    |最后一次写入到现在，被修改过的页面数。|
|w    |S       |进程状态(D=不可中断的睡眠状态,R=运行,S=睡眠,T=跟踪/停止,Z=僵尸进程)|
|x    |COMMAND |命令名/命令行|
|y    |WCHAN   |若该进程在睡眠，则显示睡眠中的系统函数名|
|z    |Flags   |任务标志，参考 sched.h|


