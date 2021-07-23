
target/riscv64gc-unknown-none-elf/release/os：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_start>:
    80200000:	1141                	addi	sp,sp,-16
    80200002:	e406                	sd	ra,8(sp)
    80200004:	e022                	sd	s0,0(sp)
    80200006:	0800                	addi	s0,sp,16
    80200008:	00000097          	auipc	ra,0x0
    8020000c:	014080e7          	jalr	20(ra) # 8020001c <_ZN2os8shutdown17h1512eadb59589f93E>
	...

0000000080200012 <rust_begin_unwind>:
    80200012:	1141                	addi	sp,sp,-16
    80200014:	e406                	sd	ra,8(sp)
    80200016:	e022                	sd	s0,0(sp)
    80200018:	0800                	addi	s0,sp,16
    8020001a:	a001                	j	8020001a <rust_begin_unwind+0x8>

000000008020001c <_ZN2os8shutdown17h1512eadb59589f93E>:
    8020001c:	1141                	addi	sp,sp,-16
    8020001e:	e406                	sd	ra,8(sp)
    80200020:	e022                	sd	s0,0(sp)
    80200022:	0800                	addi	s0,sp,16
    80200024:	48a1                	li	a7,8
    80200026:	4501                	li	a0,0
    80200028:	4581                	li	a1,0
    8020002a:	4601                	li	a2,0
    8020002c:	00000073          	ecall

0000000080200030 <.LBB0_1>:
    80200030:	00001517          	auipc	a0,0x1
    80200034:	fd050513          	addi	a0,a0,-48 # 80201000 <etext>

0000000080200038 <.LBB0_2>:
    80200038:	00001617          	auipc	a2,0x1
    8020003c:	fe860613          	addi	a2,a2,-24 # 80201020 <.Lanon.49c9f8067fe4468184af16d7576940c9.2>
    80200040:	45cd                	li	a1,19
    80200042:	00000097          	auipc	ra,0x0
    80200046:	028080e7          	jalr	40(ra) # 8020006a <_ZN4core9panicking5panic17h4214b4eed8d3f37fE>
	...

000000008020004c <_ZN4core3ptr102drop_in_place$LT$$RF$core..iter..adapters..copied..Copied$LT$core..slice..iter..Iter$LT$u8$GT$$GT$$GT$17h2c14ec9a62b1a876E>:
    8020004c:	8082                	ret

000000008020004e <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h7108e12ad9db6507E>:
    8020004e:	0160f537          	lui	a0,0x160f
    80200052:	6275051b          	addiw	a0,a0,1575
    80200056:	0536                	slli	a0,a0,0xd
    80200058:	3d750513          	addi	a0,a0,983 # 160f3d7 <.Lline_table_start0+0x15f252d>
    8020005c:	0532                	slli	a0,a0,0xc
    8020005e:	f8150513          	addi	a0,a0,-127
    80200062:	0532                	slli	a0,a0,0xc
    80200064:	f4250513          	addi	a0,a0,-190
    80200068:	8082                	ret

000000008020006a <_ZN4core9panicking5panic17h4214b4eed8d3f37fE>:
    8020006a:	715d                	addi	sp,sp,-80
    8020006c:	e486                	sd	ra,72(sp)
    8020006e:	fc2a                	sd	a0,56(sp)
    80200070:	e0ae                	sd	a1,64(sp)
    80200072:	1828                	addi	a0,sp,56
    80200074:	e42a                	sd	a0,8(sp)
    80200076:	4505                	li	a0,1
    80200078:	e82a                	sd	a0,16(sp)
    8020007a:	ec02                	sd	zero,24(sp)

000000008020007c <.LBB129_1>:
    8020007c:	00001517          	auipc	a0,0x1
    80200080:	fbc50513          	addi	a0,a0,-68 # 80201038 <.Lanon.9d4bfc86079e95d674f3cded52b1db19.179>
    80200084:	f42a                	sd	a0,40(sp)
    80200086:	f802                	sd	zero,48(sp)
    80200088:	0028                	addi	a0,sp,8
    8020008a:	85b2                	mv	a1,a2
    8020008c:	00000097          	auipc	ra,0x0
    80200090:	00a080e7          	jalr	10(ra) # 80200096 <_ZN4core9panicking9panic_fmt17ha4e041b5d1f17023E>
	...

0000000080200096 <_ZN4core9panicking9panic_fmt17ha4e041b5d1f17023E>:
    80200096:	7179                	addi	sp,sp,-48
    80200098:	f406                	sd	ra,40(sp)

000000008020009a <.LBB131_1>:
    8020009a:	00001617          	auipc	a2,0x1
    8020009e:	f9e60613          	addi	a2,a2,-98 # 80201038 <.Lanon.9d4bfc86079e95d674f3cded52b1db19.179>
    802000a2:	e432                	sd	a2,8(sp)

00000000802000a4 <.LBB131_2>:
    802000a4:	00001617          	auipc	a2,0x1
    802000a8:	f9460613          	addi	a2,a2,-108 # 80201038 <.Lanon.9d4bfc86079e95d674f3cded52b1db19.179>
    802000ac:	e832                	sd	a2,16(sp)
    802000ae:	ec2a                	sd	a0,24(sp)
    802000b0:	f02e                	sd	a1,32(sp)
    802000b2:	0028                	addi	a0,sp,8
    802000b4:	00000097          	auipc	ra,0x0
    802000b8:	f5e080e7          	jalr	-162(ra) # 80200012 <rust_begin_unwind>
	...
