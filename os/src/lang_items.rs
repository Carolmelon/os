// os/src/lang_items.rs
use core::panic::PanicInfo;
use crate::println; // 会展开，然后使用print函数
use crate::print;   // 因此要手动引入print函数
use crate::shutdown;

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    if let Some(location) = info.location() {
        println!(
            "Panicked at {}:{} {}",
            location.file(),
            location.line(),
            info.message().unwrap()
        );
    } else {
        println!("Panicked: {}", info.message().unwrap());
    }
    shutdown()
}
