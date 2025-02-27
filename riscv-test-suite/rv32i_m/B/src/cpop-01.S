
// -----------
// This file was generated by riscv_ctg (https://github.com/riscv-software-src/riscv-ctg)
// version   : 0.7.1
// timestamp : Sun Aug  7 17:43:57 2022 GMT
// usage     : riscv_ctg \
//                  -- cgf //                  --cgf /home/anku/work2/bmanip/32/dataset.yaml \
//                  --cgf /home/anku/work2/bmanip/32/rv32ib.yaml \
 \
//                  -- xlen 32  \
// -----------
//
// -----------
// Copyright (c) 2020. RISC-V International. All rights reserved.
// SPDX-License-Identifier: BSD-3-Clause
// -----------
//
// This assembly file tests the cpop instruction of the RISC-V RV32Zbb extension for the cpop covergroup.
// 
#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32IZbb")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN

#ifdef TEST_CASE_1

RVTEST_CASE(0,"//check ISA:=regex(.*32.*);check ISA:=regex(.*I.*Zbb.*);def TEST_CASE_1=True;",cpop)

RVTEST_SIGBASE(x1,signature_x1_1)

inst_0:
// rs1 == rd, rs1==x31, rd==x31, 
// opcode: cpop ; op1:x31; dest:x31; op1val:0x55555555;
TEST_RD_OP(cpop, x31, x31, 0x00000000, 0x55555555, x1, 0, x2) 

inst_1:
// rs1 != rd, rs1==x29, rd==x30, 
// opcode: cpop ; op1:x29; dest:x30; op1val:0x7fffffff;
TEST_RD_OP(cpop, x30, x29, 0x00000000, 0x7fffffff, x1, 4, x2) 

inst_2:
// rs1==x30, rd==x29, 
// opcode: cpop ; op1:x30; dest:x29; op1val:0xbfffffff;
TEST_RD_OP(cpop, x29, x30, 0x00000000, 0xbfffffff, x1, 8, x2) 

inst_3:
// rs1==x27, rd==x28, 
// opcode: cpop ; op1:x27; dest:x28; op1val:0xdfffffff;
TEST_RD_OP(cpop, x28, x27, 0x00000000, 0xdfffffff, x1, 12, x2) 

inst_4:
// rs1==x28, rd==x27, 
// opcode: cpop ; op1:x28; dest:x27; op1val:0xefffffff;
TEST_RD_OP(cpop, x27, x28, 0x00000000, 0xefffffff, x1, 16, x2) 

inst_5:
// rs1==x25, rd==x26, 
// opcode: cpop ; op1:x25; dest:x26; op1val:0xf7ffffff;
TEST_RD_OP(cpop, x26, x25, 0x00000000, 0xf7ffffff, x1, 20, x2) 

inst_6:
// rs1==x26, rd==x25, 
// opcode: cpop ; op1:x26; dest:x25; op1val:0xfbffffff;
TEST_RD_OP(cpop, x25, x26, 0x00000000, 0xfbffffff, x1, 24, x2) 

inst_7:
// rs1==x23, rd==x24, 
// opcode: cpop ; op1:x23; dest:x24; op1val:0xfdffffff;
TEST_RD_OP(cpop, x24, x23, 0x00000000, 0xfdffffff, x1, 28, x2) 

inst_8:
// rs1==x24, rd==x23, 
// opcode: cpop ; op1:x24; dest:x23; op1val:0xfeffffff;
TEST_RD_OP(cpop, x23, x24, 0x00000000, 0xfeffffff, x1, 32, x2) 

inst_9:
// rs1==x21, rd==x22, 
// opcode: cpop ; op1:x21; dest:x22; op1val:0xff7fffff;
TEST_RD_OP(cpop, x22, x21, 0x00000000, 0xff7fffff, x1, 36, x2) 

inst_10:
// rs1==x22, rd==x21, 
// opcode: cpop ; op1:x22; dest:x21; op1val:0xffbfffff;
TEST_RD_OP(cpop, x21, x22, 0x00000000, 0xffbfffff, x1, 40, x2) 

inst_11:
// rs1==x19, rd==x20, 
// opcode: cpop ; op1:x19; dest:x20; op1val:0xffdfffff;
TEST_RD_OP(cpop, x20, x19, 0x00000000, 0xffdfffff, x1, 44, x2) 

inst_12:
// rs1==x20, rd==x19, 
// opcode: cpop ; op1:x20; dest:x19; op1val:0xffefffff;
TEST_RD_OP(cpop, x19, x20, 0x00000000, 0xffefffff, x1, 48, x2) 

inst_13:
// rs1==x17, rd==x18, 
// opcode: cpop ; op1:x17; dest:x18; op1val:0xfff7ffff;
TEST_RD_OP(cpop, x18, x17, 0x00000000, 0xfff7ffff, x1, 52, x2) 

inst_14:
// rs1==x18, rd==x17, 
// opcode: cpop ; op1:x18; dest:x17; op1val:0xfffbffff;
TEST_RD_OP(cpop, x17, x18, 0x00000000, 0xfffbffff, x1, 56, x2) 

inst_15:
// rs1==x15, rd==x16, 
// opcode: cpop ; op1:x15; dest:x16; op1val:0xfffdffff;
TEST_RD_OP(cpop, x16, x15, 0x00000000, 0xfffdffff, x1, 60, x2) 

inst_16:
// rs1==x16, rd==x15, 
// opcode: cpop ; op1:x16; dest:x15; op1val:0xfffeffff;
TEST_RD_OP(cpop, x15, x16, 0x00000000, 0xfffeffff, x1, 64, x2) 

inst_17:
// rs1==x13, rd==x14, 
// opcode: cpop ; op1:x13; dest:x14; op1val:0xffff7fff;
TEST_RD_OP(cpop, x14, x13, 0x00000000, 0xffff7fff, x1, 68, x2) 

inst_18:
// rs1==x14, rd==x13, 
// opcode: cpop ; op1:x14; dest:x13; op1val:0xffffbfff;
TEST_RD_OP(cpop, x13, x14, 0x00000000, 0xffffbfff, x1, 72, x2) 

inst_19:
// rs1==x11, rd==x12, 
// opcode: cpop ; op1:x11; dest:x12; op1val:0xffffdfff;
TEST_RD_OP(cpop, x12, x11, 0x00000000, 0xffffdfff, x1, 76, x2) 

inst_20:
// rs1==x12, rd==x11, 
// opcode: cpop ; op1:x12; dest:x11; op1val:0xffffefff;
TEST_RD_OP(cpop, x11, x12, 0x00000000, 0xffffefff, x1, 80, x2) 

inst_21:
// rs1==x9, rd==x10, 
// opcode: cpop ; op1:x9; dest:x10; op1val:0xfffff7ff;
TEST_RD_OP(cpop, x10, x9, 0x00000000, 0xfffff7ff, x1, 84, x2) 

inst_22:
// rs1==x10, rd==x9, 
// opcode: cpop ; op1:x10; dest:x9; op1val:0xfffffbff;
TEST_RD_OP(cpop, x9, x10, 0x00000000, 0xfffffbff, x1, 88, x2) 

inst_23:
// rs1==x7, rd==x8, 
// opcode: cpop ; op1:x7; dest:x8; op1val:0xfffffdff;
TEST_RD_OP(cpop, x8, x7, 0x00000000, 0xfffffdff, x1, 92, x2) 

inst_24:
// rs1==x8, rd==x7, 
// opcode: cpop ; op1:x8; dest:x7; op1val:0xfffffeff;
TEST_RD_OP(cpop, x7, x8, 0x00000000, 0xfffffeff, x1, 96, x2) 

inst_25:
// rs1==x5, rd==x6, 
// opcode: cpop ; op1:x5; dest:x6; op1val:0xffffff7f;
TEST_RD_OP(cpop, x6, x5, 0x00000000, 0xffffff7f, x1, 100, x2) 

inst_26:
// rs1==x6, rd==x5, 
// opcode: cpop ; op1:x6; dest:x5; op1val:0xffffffbf;
TEST_RD_OP(cpop, x5, x6, 0x00000000, 0xffffffbf, x1, 104, x7) 

inst_27:
// rs1==x3, rd==x4, 
// opcode: cpop ; op1:x3; dest:x4; op1val:0xffffffdf;
TEST_RD_OP(cpop, x4, x3, 0x00000000, 0xffffffdf, x1, 108, x7) 
RVTEST_SIGBASE(x5,signature_x5_0)

inst_28:
// rs1==x4, rd==x3, 
// opcode: cpop ; op1:x4; dest:x3; op1val:0xffffffef;
TEST_RD_OP(cpop, x3, x4, 0x00000000, 0xffffffef, x5, 0, x7) 

inst_29:
// rs1==x1, rd==x2, 
// opcode: cpop ; op1:x1; dest:x2; op1val:0xfffffff7;
TEST_RD_OP(cpop, x2, x1, 0x00000000, 0xfffffff7, x5, 4, x7) 

inst_30:
// rs1==x2, rd==x1, 
// opcode: cpop ; op1:x2; dest:x1; op1val:0xfffffffb;
TEST_RD_OP(cpop, x1, x2, 0x00000000, 0xfffffffb, x5, 8, x7) 

inst_31:
// rs1==x0, 
// opcode: cpop ; op1:x0; dest:x31; op1val:0x0;
TEST_RD_OP(cpop, x31, x0, 0x00000000, 0x0, x5, 12, x7) 

inst_32:
// rd==x0, 
// opcode: cpop ; op1:x31; dest:x0; op1val:0xfffffffe;
TEST_RD_OP(cpop, x0, x31, 0x00000000, 0xfffffffe, x5, 16, x7) 

inst_33:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x80000000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x80000000, x5, 20, x7) 

inst_34:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x40000000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x40000000, x5, 24, x7) 

inst_35:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x1;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x1, x5, 28, x7) 

inst_36:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0xaaaaaaaa;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0xaaaaaaaa, x5, 32, x7) 

inst_37:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x20000000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x20000000, x5, 36, x7) 

inst_38:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x10000000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x10000000, x5, 40, x7) 

inst_39:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x8000000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x8000000, x5, 44, x7) 

inst_40:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x4000000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x4000000, x5, 48, x7) 

inst_41:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x2000000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x2000000, x5, 52, x7) 

inst_42:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x1000000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x1000000, x5, 56, x7) 

inst_43:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x800000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x800000, x5, 60, x7) 

inst_44:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x400000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x400000, x5, 64, x7) 

inst_45:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x200000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x200000, x5, 68, x7) 

inst_46:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x100000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x100000, x5, 72, x7) 

inst_47:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x80000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x80000, x5, 76, x7) 

inst_48:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x40000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x40000, x5, 80, x7) 

inst_49:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x20000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x20000, x5, 84, x7) 

inst_50:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x10000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x10000, x5, 88, x7) 

inst_51:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x8000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x8000, x5, 92, x7) 

inst_52:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x4000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x4000, x5, 96, x7) 

inst_53:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x2000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x2000, x5, 100, x7) 

inst_54:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x1000;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x1000, x5, 104, x7) 

inst_55:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x800;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x800, x5, 108, x7) 

inst_56:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x400;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x400, x5, 112, x7) 

inst_57:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x200;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x200, x5, 116, x7) 

inst_58:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x100;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x100, x5, 120, x7) 

inst_59:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x80;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x80, x5, 124, x7) 

inst_60:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x40;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x40, x5, 128, x7) 

inst_61:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x20;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x20, x5, 132, x7) 

inst_62:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x10;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x10, x5, 136, x7) 

inst_63:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x8;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x8, x5, 140, x7) 

inst_64:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x4;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x4, x5, 144, x7) 

inst_65:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0x2;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0x2, x5, 148, x7) 

inst_66:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0xfffffffd;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0xfffffffd, x5, 152, x7) 

inst_67:
// 
// opcode: cpop ; op1:x30; dest:x31; op1val:0xfffffffe;
TEST_RD_OP(cpop, x31, x30, 0x00000000, 0xfffffffe, x5, 156, x7) 
#endif


RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0xbabecafe
.word 0xabecafeb
.word 0xbecafeba
.word 0xecafebab
RVTEST_DATA_END

RVMODEL_DATA_BEGIN


signature_x1_0:
    .fill 0*(XLEN/32),4,0xdeadbeef


signature_x1_1:
    .fill 28*(XLEN/32),4,0xdeadbeef


signature_x5_0:
    .fill 40*(XLEN/32),4,0xdeadbeef

#ifdef rvtest_mtrap_routine

mtrap_sigptr:
    .fill 64*(XLEN/32),4,0xdeadbeef

#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*(XLEN/32),4,0xdeadbeef

#endif

RVMODEL_DATA_END
