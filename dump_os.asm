
target/riscv64gc-unknown-none-elf/debug/os:	file format elf64-littleriscv


Disassembly of section .text:

000000000001112e <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17hd052c4639634279bE>:
;     pub const fn len(&self) -> usize {
   1112e: 01 11        	addi	sp, sp, -32
   11130: 2a e8        	sd	a0, 16(sp)
   11132: 2e ec        	sd	a1, 24(sp)
;         unsafe { crate::ptr::Repr { rust: self }.raw.len }
   11134: 2a e0        	sd	a0, 0(sp)
   11136: 2e e4        	sd	a1, 8(sp)
;     }
   11138: 2e 85        	add	a0, zero, a1
   1113a: 05 61        	addi	sp, sp, 32
   1113c: 82 80        	ret

000000000001113e <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hbf34b8bdf853e594E>:
;     pub const fn as_ptr(&self) -> *const T {
   1113e: 41 11        	addi	sp, sp, -16
   11140: 2a e0        	sd	a0, 0(sp)
   11142: 2e e4        	sd	a1, 8(sp)
;     }
   11144: 41 01        	addi	sp, sp, 16
   11146: 82 80        	ret

0000000000011148 <_ZN2os9sys_write17h5969d21bdbbceb90E>:
; 
   11148: 59 71        	addi	sp, sp, -112
   1114a: 86 f4        	sd	ra, 104(sp)
   1114c: aa e8        	sd	a0, 80(sp)
   1114e: ae ec        	sd	a1, 88(sp)
   11150: b2 f0        	sd	a2, 96(sp)
; const SYSCALL_EXIT: usize = 93;
   11152: 2a f8        	sd	a0, 48(sp)
   11154: 2e 85        	add	a0, zero, a1
   11156: 2e f4        	sd	a1, 40(sp)
   11158: b2 85        	add	a1, zero, a2
   1115a: 32 f0        	sd	a2, 32(sp)
   1115c: 97 00 00 00  	auipc	ra, 0
   11160: e7 80 20 fe  	jalr	-30(ra)
   11164: 2a ec        	sd	a0, 24(sp)
   11166: 09 a0        	j	2 <_ZN2os9sys_write17h5969d21bdbbceb90E+0x20>
   11168: 62 65        	ld	a0, 24(sp)
   1116a: a2 75        	ld	a1, 40(sp)
   1116c: 2a e8        	sd	a0, 16(sp)
   1116e: 2e 85        	add	a0, zero, a1
   11170: 82 75        	ld	a1, 32(sp)
   11172: 97 00 00 00  	auipc	ra, 0
   11176: e7 80 c0 fb  	jalr	-68(ra)
   1117a: 2a e4        	sd	a0, 8(sp)
   1117c: 09 a0        	j	2 <_ZN2os9sys_write17h5969d21bdbbceb90E+0x36>
   1117e: 42 75        	ld	a0, 48(sp)
   11180: 2a fc        	sd	a0, 56(sp)
   11182: c2 65        	ld	a1, 16(sp)
   11184: ae e0        	sd	a1, 64(sp)
   11186: 22 66        	ld	a2, 8(sp)
   11188: b2 e4        	sd	a2, 72(sp)
   1118a: 13 05 00 04  	addi	a0, zero, 64
   1118e: 2c 18        	addi	a1, sp, 56
   11190: 97 00 00 00  	auipc	ra, 0
   11194: e7 80 40 01  	jalr	20(ra)
   11198: 2a e0        	sd	a0, 0(sp)
   1119a: 09 a0        	j	2 <_ZN2os9sys_write17h5969d21bdbbceb90E+0x54>
; const SYSCALL_WRITE: usize = 64;
   1119c: 02 65        	ld	a0, 0(sp)
   1119e: a6 70        	ld	ra, 104(sp)
   111a0: 65 61        	addi	sp, sp, 112
   111a2: 82 80        	ret

00000000000111a4 <_ZN2os7syscall17h82feda8a60c04bc3E>:
; pub fn print(args: fmt::Arguments) {
   111a4: 01 11        	addi	sp, sp, -32
   111a6: 2a ec        	sd	a0, 24(sp)  // id
; macro_rules! print {
   111a8: 90 61        	ld	a2, 0(a1)   // args[0]
   111aa: 94 65        	ld	a3, 8(a1)   // args[1]
   111ac: 8c 69        	ld	a1, 16(a1)  // args[2]
; 
   111ae: 2a e4        	sd	a0, 8(sp)               // id
   111b0: 32 85        	add	a0, zero, a2   // args[0] -> x10(a0)
   111b2: 2e e0        	sd	a1, 0(sp)              // args[2]
   111b4: b6 85        	add	a1, zero, a3   // args[1] -> x11(a1)
   111b6: 02 66        	ld	a2, 0(sp)               // args[2] -> 0(sp) -> x12(a2)
   111b8: a2 68        	ld	a7, 8(sp)               // id -> x17(a7)
   111ba: 73 00 00 00  	ecall	
   111be: 2a e8        	sd	a0, 16(sp)           // 这步没有意义，sp+16这地址下一步就被释放，返回值存在a0
; #[macro_export]
   111c0: 05 61        	addi	sp, sp, 32
   111c2: 82 80        	ret

00000000000111c4 <_ZN2os8sys_exit17hab93f5c6dda906b9E>:
;     ($fmt: literal $(, $($arg: tt)+)?) => {
   111c4: 39 71        	addi	sp, sp, -64
   111c6: 06 fc        	sd	ra, 56(sp)
   111c8: aa 85        	add	a1, zero, a0
   111ca: 2a da        	sw	a0, 52(sp)
;         print(format_args!(concat!($fmt, "\n") $(, $($arg)+)?));
   111cc: 01 25        	sext.w	a0, a0
   111ce: 2a ec        	sd	a0, 24(sp)
   111d0: 01 45        	mv	a0, zero
   111d2: 2a f0        	sd	a0, 32(sp)
   111d4: 2a f4        	sd	a0, 40(sp)
   111d6: 13 05 d0 05  	addi	a0, zero, 93
   111da: 30 08        	addi	a2, sp, 24
   111dc: 2e e8        	sd	a1, 16(sp)
   111de: b2 85        	add	a1, zero, a2
   111e0: 97 00 00 00  	auipc	ra, 0
   111e4: e7 80 40 fc  	jalr	-60(ra)
   111e8: 2a e4        	sd	a0, 8(sp)
   111ea: 09 a0        	j	2 <_ZN2os8sys_exit17hab93f5c6dda906b9E+0x28>
;     }
   111ec: 22 65        	ld	a0, 8(sp)
   111ee: e2 70        	ld	ra, 56(sp)
   111f0: 21 61        	addi	sp, sp, 64
   111f2: 82 80        	ret

00000000000111f4 <_start>:
; #[no_mangle]
   111f4: 39 71        	addi	sp, sp, -64
   111f6: 06 fc        	sd	ra, 56(sp)

00000000000111f8 <.LBB3_4>:
   111f8: 17 f5 ff ff  	auipc	a0, 1048575
   111fc: 13 05 85 f2  	addi	a0, a0, -216
   11200: 2a ec        	sd	a0, 24(sp)
   11202: b9 45        	addi	a1, zero, 14
   11204: 2e f0        	sd	a1, 32(sp)
;         unsafe { mem::transmute(self) }
   11206: 2a f4        	sd	a0, 40(sp)
   11208: 2e f8        	sd	a1, 48(sp)
; extern "C" fn _start() {
   1120a: 2a e8        	sd	a0, 16(sp)
   1120c: 2e e4        	sd	a1, 8(sp)
   1120e: 09 a0        	j	2 <.LBB3_4+0x18>
   11210: 05 45        	addi	a0, zero, 1
; extern "C" fn _start() {
   11212: c2 65        	ld	a1, 16(sp)
   11214: 22 66        	ld	a2, 8(sp)
   11216: 97 00 00 00  	auipc	ra, 0
   1121a: e7 80 20 f3  	jalr	-206(ra)
   1121e: 09 a0        	j	2 <.LBB3_4+0x28>
   11220: 25 45        	addi	a0, zero, 9
;     sys_write(1, "hello, rcore!\n".as_bytes());
   11222: 97 00 00 00  	auipc	ra, 0
   11226: e7 80 20 fa  	jalr	-94(ra)
   1122a: 09 a0        	j	2 <.LBB3_4+0x34>
;     sys_exit(9);
   1122c: e2 70        	ld	ra, 56(sp)
   1122e: 21 61        	addi	sp, sp, 64
   11230: 82 80        	ret
