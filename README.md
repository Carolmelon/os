# 实验要求
## 实现分支：ch1。
git checkout ch1可以切换到ch1分支，
使用make run可以看到实验结果。

## 完成实验指导书中的内容，在裸机上实现 hello world 输出。
在src/main.rs::23行。

## 实现彩色输出宏(只要求可以彩色输出，不要求 log 等级控制，不要求多种颜色)。
在src/main.rs::26~30行，具体实现在src/console.rs中。

## 隐形要求：可以关闭内核所有输出。从 lab2 开始要求关闭内核所有输出（如果实现了 log 等级控制，那么这一点自然就实现了）。
在src/main.rs::16行，只需把ENABLE_KERNEL_PRINT改为false即可关闭内核输出。

## 利用彩色输出宏输出 os 内存空间布局，即：输出 .text、.data、.rodata、.bss 各段位置，输出等级为 INFO。
在src/main::44~48行已实现。