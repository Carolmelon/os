pub use core::fmt::{self, Write};
use crate::sbi::{sbi_call};
use crate::ENABLE_KERNEL_PRINT;

const SBI_CONSOLE_PUTCHAR: usize = 1;

pub fn console_putchar(c: usize) {
    sbi_call(SBI_CONSOLE_PUTCHAR, c, 0, 0);
}

pub struct Stdout;

impl Write for Stdout {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        //sys_write(STDOUT, s.as_bytes());
        // 控制内核输出开关
        if ENABLE_KERNEL_PRINT{
            for c in s.chars() {
                console_putchar(c as usize);
            }
        }
        Ok(())
    }
}

pub fn print(args: fmt::Arguments) {
    Stdout.write_fmt(args).unwrap();
}

#[macro_export]
macro_rules! print {
    ($fmt: literal $(, $($arg: tt)+)?) => {
        print(format_args!($fmt $(, $($arg)+)?));
    }
}

#[macro_export]
macro_rules! println {
    ($fmt: literal $(, $($arg: tt)+)?) => {
        print(format_args!(concat!($fmt, "\n") $(, $($arg)+)?));
    }
}

// 蓝色info
#[macro_export]
macro_rules! info {
    ($fmt: literal $(, $($arg: tt)+)?) => {
        Stdout.write_str("\x1b[34m").unwrap();
        print(format_args!($fmt $(, $($arg)+)?));
        Stdout.write_str("\x1b[0m").unwrap();
        Stdout.write_str("\n").unwrap();
    }
}

// 黄色warn
#[macro_export]
macro_rules! warn {
    ($fmt: literal $(, $($arg: tt)+)?) => {
        Stdout.write_str("\x1b[93m").unwrap();
        print(format_args!($fmt $(, $($arg)+)?));
        Stdout.write_str("\x1b[0m").unwrap();
        Stdout.write_str("\n").unwrap();
    }
}

// 灰色trace
#[macro_export]
macro_rules! trace {
    ($fmt: literal $(, $($arg: tt)+)?) => {
        Stdout.write_str("\x1b[90m").unwrap();
        print(format_args!($fmt $(, $($arg)+)?));
        Stdout.write_str("\x1b[0m").unwrap();
        Stdout.write_str("\n").unwrap();
    }
}

// 绿色debug
#[macro_export]
macro_rules! debug {
    ($fmt: literal $(, $($arg: tt)+)?) => {
        Stdout.write_str("\x1b[32m").unwrap();
        print(format_args!($fmt $(, $($arg)+)?));
        Stdout.write_str("\x1b[0m").unwrap();
        Stdout.write_str("\n").unwrap();
    }
}

// 红色error
#[macro_export]
macro_rules! error {
    ($fmt: literal $(, $($arg: tt)+)?) => {
        Stdout.write_str("\x1b[31m").unwrap();
        print(format_args!($fmt $(, $($arg)+)?));
        Stdout.write_str("\x1b[0m").unwrap();
        Stdout.write_str("\n").unwrap();
    }
}