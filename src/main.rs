#![no_std]
#![no_main]

#![feature(llvm_asm)]

// 源码级别引入
mod lang_items;
mod sbi;
use crate::sbi::sbi_call;

const SBI_SHUTDOWN: usize = 8;

pub fn shutdown() -> ! {
    sbi_call(SBI_SHUTDOWN, 0, 0, 0);
    panic!("It should shutdown!");
}

#[no_mangle]
#[link_section = ".text.entry"]
extern "C" fn _start() {
    shutdown();
}