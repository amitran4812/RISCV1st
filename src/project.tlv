\m5_TLV_version 1d --inlineGen --bestsv --noline --noDirectiveComments: tl-x.org
\SV
   /*
   Copyright 2024 Redwood EDA, LLC
   
   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
   
   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
   
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
   */
\m5
   use(m5-1.0)

   var(PROG_NAME, my_custom)
   var(ISA, RISCV)
   var(EXT_E, 0)
   var(EXT_M, 0)
   var(EXT_F, 0)
   var(EXT_B, 0)
   var(NUM_CORES, 1)
   var(NUM_VCS, 2)
   var(NUM_PRIOS, 2)
   var(MAX_PACKET_SIZE, 8)
   var(soft_reset, 1'b0)
   var(cpu_blocked, 1'b0)
   var(BRANCH_PRED, two_bit)
   var(EXTRA_REPLAY_BUBBLE, 0)
   var(EXTRA_PRED_TAKEN_BUBBLE, 0)
   var(EXTRA_JUMP_BUBBLE, 0)
   var(EXTRA_BRANCH_BUBBLE, 0)
   var(EXTRA_INDIRECT_JUMP_BUBBLE, 0)
   var(EXTRA_NON_PIPELINED_BUBBLE, 1)
   var(EXTRA_TRAP_BUBBLE, 1)
   var(NEXT_PC_STAGE, 0)
   var(FETCH_STAGE, 0)
   var(DECODE_STAGE, 1)
   var(BRANCH_PRED_STAGE, 1)
   var(REG_RD_STAGE, 1)
   var(EXECUTE_STAGE, 2)
   var(RESULT_STAGE, 2)
   var(REG_WR_STAGE, 3)
   var(MEM_WR_STAGE, 3)
   var(LD_RETURN_ALIGN, 4)
\SV
   // Include WARP-V.
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/warp-v/aa67bf494289a2cc285c6c51fdbcb98a896aa7ae/warp-v.tlv'])
\m5
   TLV_fn(riscv_my_custom_prog, {
      ~assemble(['
         sum(int):
                 ble     a0,zero,.L4
                 addi    a4,a0,1
                 li      a5,1
                 li      a0,0
         .L3:
                 add     a0,a0,a5
                 addi    a5,a5,1
                 bne     a5,a4,.L3
                 ret
         .L4:
                 li      a0,0
                 ret
         main:
                 li      a0,55
                 ret
      '])
   })
m4+module_def()
\TLV
   m5+warpv_top()
\SV
   endmodule
