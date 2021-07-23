
target/riscv64gc-unknown-none-elf/release/os：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_start>:
    80200000:	00012117          	auipc	sp,0x12 # pc + 0x12 000 = 0x8021 2000
    80200004:	00010113          	mv	sp,sp
    80200008:	00000097          	auipc	ra,0x0
    8020000c:	012080e7          	jalr	18(ra) # 8020001a <rust_main>    18+8=26=0x1a   18=6条指令

0000000080200010 <rust_begin_unwind>:
    80200010:	1141                	addi	sp,sp,-16
    80200012:	e406                	sd	ra,8(sp)
    80200014:	e022                	sd	s0,0(sp)
    80200016:	0800                	addi	s0,sp,16
    80200018:	a001                	j	80200018 <rust_begin_unwind+0x8>

000000008020001a <rust_main>:
    8020001a:	1141                	addi	sp,sp,-16
    8020001c:	e406                	sd	ra,8(sp)
    8020001e:	e022                	sd	s0,0(sp)
    80200020:	0800                	addi	s0,sp,16
    80200022:	48a1                	li	a7,8
    80200024:	4501                	li	a0,0
    80200026:	4581                	li	a1,0
    80200028:	4601                	li	a2,0
    8020002a:	00000073          	ecall

000000008020002e <.LBB0_1>:
    8020002e:	00001517          	auipc	a0,0x1
    80200032:	fd250513          	addi	a0,a0,-46 # 80201000 <etext>

0000000080200036 <.LBB0_2>:
    80200036:	00001617          	auipc	a2,0x1
    8020003a:	fea60613          	addi	a2,a2,-22 # 80201020 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.2>
    8020003e:	45cd                	li	a1,19
    80200040:	00000097          	auipc	ra,0x0
    80200044:	028080e7          	jalr	40(ra) # 80200068 <_ZN4core9panicking5panic17h4214b4eed8d3f37fE>
	...

000000008020004a <_ZN4core3ptr102drop_in_place$LT$$RF$core..iter..adapters..copied..Copied$LT$core..slice..iter..Iter$LT$u8$GT$$GT$$GT$17h2c14ec9a62b1a876E>:
    8020004a:	8082                	ret

000000008020004c <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h7108e12ad9db6507E>:
    8020004c:	0160f537          	lui	a0,0x160f
    80200050:	6275051b          	addiw	a0,a0,1575
    80200054:	0536                	slli	a0,a0,0xd
    80200056:	3d750513          	addi	a0,a0,983 # 160f3d7 <.Lline_table_start0+0x15f252d>
    8020005a:	0532                	slli	a0,a0,0xc
    8020005c:	f8150513          	addi	a0,a0,-127
    80200060:	0532                	slli	a0,a0,0xc
    80200062:	f4250513          	addi	a0,a0,-190
    80200066:	8082                	ret

0000000080200068 <_ZN4core9panicking5panic17h4214b4eed8d3f37fE>:
    80200068:	715d                	addi	sp,sp,-80
    8020006a:	e486                	sd	ra,72(sp)
    8020006c:	fc2a                	sd	a0,56(sp)
    8020006e:	e0ae                	sd	a1,64(sp)
    80200070:	1828                	addi	a0,sp,56
    80200072:	e42a                	sd	a0,8(sp)
    80200074:	4505                	li	a0,1
    80200076:	e82a                	sd	a0,16(sp)
    80200078:	ec02                	sd	zero,24(sp)

000000008020007a <.LBB129_1>:
    8020007a:	00001517          	auipc	a0,0x1
    8020007e:	fbe50513          	addi	a0,a0,-66 # 80201038 <.Lanon.9d4bfc86079e95d674f3cded52b1db19.179>
    80200082:	f42a                	sd	a0,40(sp)
    80200084:	f802                	sd	zero,48(sp)
    80200086:	0028                	addi	a0,sp,8
    80200088:	85b2                	mv	a1,a2
    8020008a:	00000097          	auipc	ra,0x0
    8020008e:	00a080e7          	jalr	10(ra) # 80200094 <_ZN4core9panicking9panic_fmt17ha4e041b5d1f17023E>
	...

0000000080200094 <_ZN4core9panicking9panic_fmt17ha4e041b5d1f17023E>:
    80200094:	7179                	addi	sp,sp,-48
    80200096:	f406                	sd	ra,40(sp)

0000000080200098 <.LBB131_1>:
    80200098:	00001617          	auipc	a2,0x1
    8020009c:	fa060613          	addi	a2,a2,-96 # 80201038 <.Lanon.9d4bfc86079e95d674f3cded52b1db19.179>
    802000a0:	e432                	sd	a2,8(sp)

00000000802000a2 <.LBB131_2>:
    802000a2:	00001617          	auipc	a2,0x1
    802000a6:	f9660613          	addi	a2,a2,-106 # 80201038 <.Lanon.9d4bfc86079e95d674f3cded52b1db19.179>
    802000aa:	e832                	sd	a2,16(sp)
    802000ac:	ec2a                	sd	a0,24(sp)
    802000ae:	f02e                	sd	a1,32(sp)
    802000b0:	0028                	addi	a0,sp,8
    802000b2:	00000097          	auipc	ra,0x0
    802000b6:	f5e080e7          	jalr	-162(ra) # 80200010 <rust_begin_unwind>
	...
