#![allow(unused)]
use super::super::batch::{APP_BASE_ADDRESS, APP_MANAGER, AppManager, AppManagerInner, USER_STACK, UserStack};
const FD_STDOUT: usize = 1;

pub fn sys_write(fd: usize, buf: *const u8, len: usize) -> isize {
    match fd {
        FD_STDOUT => {
            let start = buf as usize;
            let end = start + len as usize;
            // 考虑两个段，一个是用户程序bin的加载内存段，从0x8040 0000~0x8040 0000 + bin.size
            // 另一个是用户程序的栈段，只有[start, end]位于这两个区域才是合法的

            // 加载内存段
            let load_start = APP_BASE_ADDRESS as usize;
            let load_end = load_start + APP_MANAGER.inner.borrow().get_app_len();
            // 栈内存段
            let stack_start = USER_STACK.data.as_ptr() as usize;
            let stack_end = USER_STACK.get_sp();

            // debug
            // println!("\nstart: {:X}, end: {:X}, load_start: {:X}, load_end: {:X}, stack_start: {:X}, stack_end: {:X}\n", 
            // start, end, load_start, load_end, stack_start, stack_end);

            // 检查合法性
            if (start >= load_start && end <= load_end) || (start >= stack_start && end <= stack_end){
                let slice = unsafe { core::slice::from_raw_parts(buf, len) };
                let str = core::str::from_utf8(slice).unwrap();
                print!("{}", str);
                len as isize
            }else { // 不合法则返回-1
                -1
            }            
        },
        _ => {
            // 不支持的文件描述符返回-1，符合user测试用例ch2_write1.rs要求
            // panic!("Unsupported fd in sys_write!");
            -1
        }
    }
}