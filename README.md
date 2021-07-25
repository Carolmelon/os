## 报告要求

- 简单总结与上次实验相比本次实验你增加的东西（控制在5行以内，不要贴代码）。

​        修改了`os/src/syscall/fs.rs`中的`sys_write`函数，使得每次调用时考虑字符串所在地址`[start, end)`**是否**落在用户程序的加载地址`[load_start, load_end)`**或者**用户程序的堆栈地址`[stack_start, stack_end)`之间。具体实现详见本仓库内代码。

- 完成问答问题。

> 1.正确进入 U 态后，程序的特征还应有：使用 S 态特权指令，访问 S 态寄存器后会报错。目前由于一些其他原因，这些问题不太好测试，请同学们可以自行测试这些内容（参考 前三个测例 )，描述程序出错行为，同时注意注明你使用的 sbi 及其版本。

我们的OS会通过`os/src/trap/mod.rs`中的trap_handler函数识别出这是一个`Exception::IllegalInstruction`，从而打印出`[kernel] IllegalInstruction in application, core dumped.`，终止用户程序并执行下一个用户程序。

**RustSBI版本号：RustSBI version 0.2.0-alpha.1**

> 2.请结合用例理解 [trap.S](https://github.com/rcore-os/rCore-Tutorial-v3/blob/ch2/os/src/trap/trap.S) 中两个函数 `__alltraps` 和 `__restore` 的作用，并回答如下几个问题:
>
> 2.1 L40: 刚进入 `__restore` 时，a0 代表了什么值。请指出 `__restore` 的两种使用情景。

a0代表内核栈顶指针的值。

case1: `rust_main`调用`run_next_app`，再调用`__restore`开始运行第一个用户程序。或者当前用户程序意外终止、退出，通过`run_next_app`进而调用`__restore`选择下一个用户程序。
case2: 从中断处理中返回

> 2.2 L46-L51: 这几行汇编代码特殊处理了哪些寄存器？这些寄存器的的值对于进入用户态有何意义？请分别解释。
>
> ```rust
> ld t0, 32*8(sp)
> ld t1, 33*8(sp)
> ld t2, 2*8(sp)
> csrw sstatus, t0
> csrw sepc, t1
> csrw sscratch, t2
> ```

特殊处理了`sstatus`、`sepc`、`sscratch`三个寄存器。

`sstatus`标记了发生中断时，特权级转移是从U->S，所以必须恢复，这样执行`sret`时，CPU才会返回用户态。

`sepc`标记了从中断返回时，pc寄存器应该装入什么值，换句话说，就是中断返回后用户程序应该从哪里开始继续执行。

`sscratch`则是一个临时交换寄存器，这里我们用来保存用户栈指针的值，方便中断返回前恢复用户程序的sp寄存器。

> 2.3 L53-L59: 为何跳过了 `x2` 和 `x4`？
>
> ```rust
> ld x1, 1*8(sp)
> ld x3, 3*8(sp)
> .set n, 5
> .rept 27
> LOAD_GP %n
> .set n, n+1
> .endr
> ```

x2是sp，在中断返回前才会修改，不然会影响我们使用栈上的数据来恢复其他寄存器。

x4是tp，在中断处理程序中一般不会修改，所以不用保存、恢复。

> 2.4 L63: 该指令之后，`sp` 和 `sscratch` 中的值分别有什么意义？
>
> ```rust
> csrrw sp, sscratch, sp
> ```

sp -> user.stack

sscratch -> kernel.stack

> 2.5 `__restore`：中发生状态切换在哪一条指令？为何该指令执行之后会进入用户态？

`sret`指令执行后，会发生状态切换。

因为`sstatus`标记了中断发生时的状态转换是从U -> S，所以执行`sret`时，状态转换会反过来从S -> U。

> 2.6 L13： 该指令之后，`sp` 和 `sscratch` 中的值分别有什么意义？
>
> ```rust
> csrrw sp, sscratch, sp
> ```

now sp->kernel stack, sscratch->user stack

> 2.7 从 U 态进入 S 态是哪一条指令发生的？

`user/src/syscall.rs`的`syscall`函数的`ecall`指令

> 3.程序陷入内核的原因有中断和异常（系统调用），请问 riscv64 支持哪些中断 / 异常？如何判断进入内核是由于中断还是异常？描述陷入内核时的几个重要寄存器及其值。

riscv64支持如下中断/异常

| Interrupt | Exception Code | Description                    |
| --------- | -------------- | ------------------------------ |
| 0         | 0              | Instruction address misaligned |
| 0         | 1              | Instruction access fault       |
| 0         | 2              | Illegal instruction            |
| 0         | 3              | Breakpoint                     |
| 0         | 4              | Load address misaligned        |
| 0         | 5              | Load access fault              |
| 0         | 6              | Store/AMO address misaligned   |
| 0         | 7              | Store/AMO access fault         |
| 0         | 8              | Environment call from U-mode   |
| 0         | 9              | Environment call from S-mode   |
| 0         | 11             | Environment call from M-mode   |
| 0         | 12             | Instruction page fault         |
| 0         | 13             | Load page fault                |
| 0         | 15             | Store/AMO page fault           |

可以根据`scause`这个CSR寄存器来判断进入内核是由于中断还是异常。

| CSR 名  | 该 CSR 与 Trap 相关的功能                                    |
| ------- | ------------------------------------------------------------ |
| sstatus | `SPP` 等字段给出 Trap 发生之前 CPU 处在哪个特权级（S/U）等信息 |
| sepc    | 当 Trap 是一个异常的时候，记录 Trap 发生之前执行的最后一条指令的地址 |
| scause  | 描述 Trap 的原因                                             |
| stval   | 给出 Trap 附加信息                                           |
| stvec   | 控制 Trap 处理代码的入口地址                                 |

> 4.对于任何中断， `__alltraps` 中都需要保存所有寄存器吗？你有没有想到一些加速 `__alltraps` 的方法？简单描述你的想法。

对于一些不可恢复中断，比如U态中使用了S态或者M态的命令，或者U态中访问S态或者M态寄存器的行为，可以不保存寄存器，因为不需要从中断恢复，直接终止用户程序即可。

