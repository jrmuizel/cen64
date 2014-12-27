//
// arch/x86_64/rsp/vnxor.s
//
// CEN64: Cycle-Accurate Nintendo 64 Simulator.
// Copyright (C) 2014, Tyler J. Stachecki.
//
// This file is subject to the terms and conditions defined in
// 'LICENSE', which is part of this source code package.
//

#
# xmm1 = vs
# xmm0 = vt
# xmm2 = zero
# xmm5 = acc_lo
#

.global RSP_VNXOR
.type	RSP_VNXOR, @function

RSP_VNXOR:

.ifdef __AVX__
  vpcmpeqd %xmm2, %xmm2, %xmm2
  vpxor %xmm0, %xmm1, %xmm0
  vpxor %xmm2, %xmm0, %xmm1
  movdqa %xmm1, %xmm5
  retq
.else
  pcmpeqd %xmm2, %xmm2
  pxor %xmm0, %xmm1
  pxor %xmm2, %xmm1
  movdqa %xmm1, %xmm5
  retq
.endif

.size RSP_VNXOR,.-RSP_VNXOR

