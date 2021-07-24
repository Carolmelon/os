#![no_std]
#![no_main]
#![feature(global_asm)]
#![feature(llvm_asm)]
#![feature(panic_info_message)]

// 源码级别引入
mod lang_items;
mod sbi;
mod console;
use crate::sbi::sbi_call;
use crate::console::{print, Stdout};
use core::fmt::Write;

// 控制内核输出开关
const ENABLE_KERNEL_PRINT: bool = true;

global_asm!(include_str!("entry.asm"));

#[no_mangle]
pub fn rust_main() -> ! {
    clear_bss();
    println!("hello, world");

    // 测试所有实现的颜色
    info!("hello");
    warn!("hello");
    debug!("hello");
    trace!("hello");
    error!("hello");

    extern "C" {    // 声明链接符号
        fn stext();
        fn etext();
        fn srodata();
        fn erodata();
        fn sdata();
        fn edata();
        fn sbss();
        fn ebss();
        fn skernel();
        fn ekernel();
    }
    info!("kernel space: [{:#x}, {:#x})", skernel as usize, ekernel as usize);
    info!(".text [{:#x}, {:#x})", stext as usize, etext as usize);
    info!(".rodate [{:#x}, {:#x})", srodata as usize, erodata as usize);
    info!(".data [{:#x}, {:#x})", sdata as usize, edata as usize);
    info!(".bss [{:#x}, {:#x})", sbss as usize, ebss as usize);

    sbi_call(SBI_SHUTDOWN, 0, 0, 0);
    panic!("It should shutdown!");
}

const SBI_SHUTDOWN: usize = 8;

pub fn shutdown() -> ! {
    sbi_call(SBI_SHUTDOWN, 0, 0, 0);
    panic!("It should shutdown!");
}

fn clear_bss() {
    extern "C" {
        fn sbss();
        fn ebss();
    }
    (sbss as usize..ebss as usize).for_each(|a| {
        unsafe { (a as *mut u8).write_volatile(0) }
    });
}

