# RUN: llvm-mc -triple=riscv64 -mattr=+c -show-encoding < %s \
# RUN:     | FileCheck -check-prefixes=CHECK,CHECK-INST %s
# RUN: llvm-mc -filetype=obj -triple riscv64 -mattr=+c < %s \
# RUN:     | llvm-objdump -mattr=+c -d - | FileCheck -check-prefix=CHECK-INST %s

# TODO: more exhaustive testing of immediate encoding.

# CHECK-INST: c.ldsp  ra, 0(sp)
# CHECK: encoding: [0x82,0x60]
c.ldsp  ra, 0(sp)
# CHECK-INST: c.sdsp  ra, 504(sp)
# CHECK: encoding: [0x86,0xff]
c.sdsp  ra, 504(sp)
# CHECK-INST: c.ld    a4, 0(a3)
# CHECK: encoding: [0x98,0x62]
c.ld    a4, 0(a3)
# CHECK-INST: c.sd    a5, 248(a3)
# CHECK: encoding: [0xfc,0xfe]
c.sd    a5, 248(a3)
