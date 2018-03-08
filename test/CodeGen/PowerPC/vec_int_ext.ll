; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-gnu-linux -mcpu=pwr9 < %s | FileCheck %s -check-prefix=CHECK-LE
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-gnu-linux -mcpu=pwr9 < %s | FileCheck %s -check-prefix=CHECK-BE

define <4 x i32> @vextsb2wLE(<16 x i8> %a) {
; CHECK-LE-LABEL: vextsb2wLE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vextsb2w 2, 2
; CHECK-LE-NEXT:    blr
; CHECK-BE-LABEL: vextsb2wLE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE:         vperm 2, 2, 2, 3
; CHECK-BE-NEXT:    vextsb2w 2, 2
; CHECK-BE-NEXT:    blr

entry:
  %vecext = extractelement <16 x i8> %a, i32 0
  %conv = sext i8 %vecext to i32
  %vecinit = insertelement <4 x i32> undef, i32 %conv, i32 0
  %vecext1 = extractelement <16 x i8> %a, i32 4
  %conv2 = sext i8 %vecext1 to i32
  %vecinit3 = insertelement <4 x i32> %vecinit, i32 %conv2, i32 1
  %vecext4 = extractelement <16 x i8> %a, i32 8
  %conv5 = sext i8 %vecext4 to i32
  %vecinit6 = insertelement <4 x i32> %vecinit3, i32 %conv5, i32 2
  %vecext7 = extractelement <16 x i8> %a, i32 12
  %conv8 = sext i8 %vecext7 to i32
  %vecinit9 = insertelement <4 x i32> %vecinit6, i32 %conv8, i32 3
  ret <4 x i32> %vecinit9
}

define <2 x i64> @vextsb2dLE(<16 x i8> %a) {
; CHECK-LE-LABEL: vextsb2dLE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vextsb2d 2, 2
; CHECK-LE-NEXT:    blr
; CHECK-BE-LABEL: vextsb2dLE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE:         vperm 2, 2, 2, 3
; CHECK-BE-NEXT:    vextsb2d 2, 2
; CHECK-BE-NEXT:    blr

entry:
  %vecext = extractelement <16 x i8> %a, i32 0
  %conv = sext i8 %vecext to i64
  %vecinit = insertelement <2 x i64> undef, i64 %conv, i32 0
  %vecext1 = extractelement <16 x i8> %a, i32 8
  %conv2 = sext i8 %vecext1 to i64
  %vecinit3 = insertelement <2 x i64> %vecinit, i64 %conv2, i32 1
  ret <2 x i64> %vecinit3
}

define <4 x i32> @vextsh2wLE(<8 x i16> %a) {
; CHECK-LE-LABEL: vextsh2wLE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vextsh2w 2, 2
; CHECK-LE-NEXT:    blr
; CHECK-BE-LABEL: vextsh2wLE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE:         vperm 2, 2, 2, 3
; CHECK-BE-NEXT:    vextsh2w 2, 2
; CHECK-BE-NEXT:    blr

entry:
  %vecext = extractelement <8 x i16> %a, i32 0
  %conv = sext i16 %vecext to i32
  %vecinit = insertelement <4 x i32> undef, i32 %conv, i32 0
  %vecext1 = extractelement <8 x i16> %a, i32 2
  %conv2 = sext i16 %vecext1 to i32
  %vecinit3 = insertelement <4 x i32> %vecinit, i32 %conv2, i32 1
  %vecext4 = extractelement <8 x i16> %a, i32 4
  %conv5 = sext i16 %vecext4 to i32
  %vecinit6 = insertelement <4 x i32> %vecinit3, i32 %conv5, i32 2
  %vecext7 = extractelement <8 x i16> %a, i32 6
  %conv8 = sext i16 %vecext7 to i32
  %vecinit9 = insertelement <4 x i32> %vecinit6, i32 %conv8, i32 3
  ret <4 x i32> %vecinit9
}

define <2 x i64> @vextsh2dLE(<8 x i16> %a) {
; CHECK-LE-LABEL: vextsh2dLE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vextsh2d 2, 2
; CHECK-LE-NEXT:    blr
; CHECK-BE-LABEL: vextsh2dLE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE:         vperm 2, 2, 2, 3
; CHECK-BE-NEXT:    vextsh2d 2, 2
; CHECK-BE-NEXT:    blr

entry:
  %vecext = extractelement <8 x i16> %a, i32 0
  %conv = sext i16 %vecext to i64
  %vecinit = insertelement <2 x i64> undef, i64 %conv, i32 0
  %vecext1 = extractelement <8 x i16> %a, i32 4
  %conv2 = sext i16 %vecext1 to i64
  %vecinit3 = insertelement <2 x i64> %vecinit, i64 %conv2, i32 1
  ret <2 x i64> %vecinit3
}

define <2 x i64> @vextsw2dLE(<4 x i32> %a) {
; CHECK-LE-LABEL: vextsw2dLE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vextsw2d 2, 2
; CHECK-LE-NEXT:    blr
; CHECK-BE-LABEL: vextsw2dLE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE:         vmrgew
; CHECK-BE-NEXT:    vextsw2d 2, 2
; CHECK-BE-NEXT:    blr

entry:
  %vecext = extractelement <4 x i32> %a, i32 0
  %conv = sext i32 %vecext to i64
  %vecinit = insertelement <2 x i64> undef, i64 %conv, i32 0
  %vecext1 = extractelement <4 x i32> %a, i32 2
  %conv2 = sext i32 %vecext1 to i64
  %vecinit3 = insertelement <2 x i64> %vecinit, i64 %conv2, i32 1
  ret <2 x i64> %vecinit3
}

define <4 x i32> @vextsb2wBE(<16 x i8> %a) {
; CHECK-BE-LABEL: vextsb2wBE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE-NEXT:    vextsb2w 2, 2
; CHECK-BE-NEXT:    blr
; CHECK-LE-LABEL: vextsb2wBE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vsldoi 2, 2, 2, 13
; CHECK-LE-NEXT:    vextsb2w 2, 2
; CHECK-LE-NEXT:    blr
entry:
  %vecext = extractelement <16 x i8> %a, i32 3
  %conv = sext i8 %vecext to i32
  %vecinit = insertelement <4 x i32> undef, i32 %conv, i32 0
  %vecext1 = extractelement <16 x i8> %a, i32 7
  %conv2 = sext i8 %vecext1 to i32
  %vecinit3 = insertelement <4 x i32> %vecinit, i32 %conv2, i32 1
  %vecext4 = extractelement <16 x i8> %a, i32 11
  %conv5 = sext i8 %vecext4 to i32
  %vecinit6 = insertelement <4 x i32> %vecinit3, i32 %conv5, i32 2
  %vecext7 = extractelement <16 x i8> %a, i32 15
  %conv8 = sext i8 %vecext7 to i32
  %vecinit9 = insertelement <4 x i32> %vecinit6, i32 %conv8, i32 3
  ret <4 x i32> %vecinit9
}

define <2 x i64> @vextsb2dBE(<16 x i8> %a) {
; CHECK-BE-LABEL: vextsb2dBE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE-NEXT:    vextsb2d 2, 2
; CHECK-BE-NEXT:    blr
; CHECK-LE-LABEL: vextsb2dBE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vsldoi 2, 2, 2, 9
; CHECK-LE-NEXT:    vextsb2d 2, 2
; CHECK-LE-NEXT:    blr
entry:
  %vecext = extractelement <16 x i8> %a, i32 7
  %conv = sext i8 %vecext to i64
  %vecinit = insertelement <2 x i64> undef, i64 %conv, i32 0
  %vecext1 = extractelement <16 x i8> %a, i32 15
  %conv2 = sext i8 %vecext1 to i64
  %vecinit3 = insertelement <2 x i64> %vecinit, i64 %conv2, i32 1
  ret <2 x i64> %vecinit3
}

define <4 x i32> @vextsh2wBE(<8 x i16> %a) {
; CHECK-BE-LABEL: vextsh2wBE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE-NEXT:    vextsh2w 2, 2
; CHECK-BE-NEXT:    blr
; CHECK-LE-LABEL: vextsh2wBE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vsldoi 2, 2, 2, 14
; CHECK-LE-NEXT:    vextsh2w 2, 2
; CHECK-LE-NEXT:    blr
entry:
  %vecext = extractelement <8 x i16> %a, i32 1
  %conv = sext i16 %vecext to i32
  %vecinit = insertelement <4 x i32> undef, i32 %conv, i32 0
  %vecext1 = extractelement <8 x i16> %a, i32 3
  %conv2 = sext i16 %vecext1 to i32
  %vecinit3 = insertelement <4 x i32> %vecinit, i32 %conv2, i32 1
  %vecext4 = extractelement <8 x i16> %a, i32 5
  %conv5 = sext i16 %vecext4 to i32
  %vecinit6 = insertelement <4 x i32> %vecinit3, i32 %conv5, i32 2
  %vecext7 = extractelement <8 x i16> %a, i32 7
  %conv8 = sext i16 %vecext7 to i32
  %vecinit9 = insertelement <4 x i32> %vecinit6, i32 %conv8, i32 3
  ret <4 x i32> %vecinit9
}

define <2 x i64> @vextsh2dBE(<8 x i16> %a) {
; CHECK-BE-LABEL: vextsh2dBE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE-NEXT:    vextsh2d 2, 2
; CHECK-BE-NEXT:    blr
; CHECK-LE-LABEL: vextsh2dBE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vsldoi 2, 2, 2, 10
; CHECK-LE-NEXT:    vextsh2d 2, 2
; CHECK-LE-NEXT:    blr
entry:
  %vecext = extractelement <8 x i16> %a, i32 3
  %conv = sext i16 %vecext to i64
  %vecinit = insertelement <2 x i64> undef, i64 %conv, i32 0
  %vecext1 = extractelement <8 x i16> %a, i32 7
  %conv2 = sext i16 %vecext1 to i64
  %vecinit3 = insertelement <2 x i64> %vecinit, i64 %conv2, i32 1
  ret <2 x i64> %vecinit3
}

define <2 x i64> @vextsw2dBE(<4 x i32> %a) {
; CHECK-BE-LABEL: vextsw2dBE:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE-NEXT:    vextsw2d 2, 2
; CHECK-BE-NEXT:    blr
; CHECK-LE-LABEL: vextsw2dBE:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NEXT:    vsldoi 2, 2, 2, 12
; CHECK-LE-NEXT:    vextsw2d 2, 2
; CHECK-LE-NEXT:    blr
entry:
  %vecext = extractelement <4 x i32> %a, i32 1
  %conv = sext i32 %vecext to i64
  %vecinit = insertelement <2 x i64> undef, i64 %conv, i32 0
  %vecext1 = extractelement <4 x i32> %a, i32 3
  %conv2 = sext i32 %vecext1 to i64
  %vecinit3 = insertelement <2 x i64> %vecinit, i64 %conv2, i32 1
  ret <2 x i64> %vecinit3
}

define <2 x i64> @vextDiffVectors(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LE-LABEL: vextDiffVectors:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NOT:     vextsw2d

; CHECK-BE-LABEL: vextDiffVectors:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE-NOT:     vextsw2d
entry:
  %vecext = extractelement <4 x i32> %a, i32 0
  %conv = sext i32 %vecext to i64
  %vecinit = insertelement <2 x i64> undef, i64 %conv, i32 0
  %vecext1 = extractelement <4 x i32> %b, i32 2
  %conv2 = sext i32 %vecext1 to i64
  %vecinit3 = insertelement <2 x i64> %vecinit, i64 %conv2, i32 1
  ret <2 x i64> %vecinit3
}

define <8 x i16> @testInvalidExtend(<16 x i8> %a) {
entry:
; CHECK-LE-LABEL: testInvalidExtend:
; CHECK-LE:       # BB#0: # %entry
; CHECK-LE-NOT:     vexts

; CHECK-BE-LABEL: testInvalidExtend:
; CHECK-BE:       # BB#0: # %entry
; CHECK-BE-NOT:     vexts

  %vecext = extractelement <16 x i8> %a, i32 0
  %conv = sext i8 %vecext to i16
  %vecinit = insertelement <8 x i16> undef, i16 %conv, i32 0
  %vecext1 = extractelement <16 x i8> %a, i32 2
  %conv2 = sext i8 %vecext1 to i16
  %vecinit3 = insertelement <8 x i16> %vecinit, i16 %conv2, i32 1
  %vecext4 = extractelement <16 x i8> %a, i32 4
  %conv5 = sext i8 %vecext4 to i16
  %vecinit6 = insertelement <8 x i16> %vecinit3, i16 %conv5, i32 2
  %vecext7 = extractelement <16 x i8> %a, i32 6
  %conv8 = sext i8 %vecext7 to i16
  %vecinit9 = insertelement <8 x i16> %vecinit6, i16 %conv8, i32 3
  %vecext10 = extractelement <16 x i8> %a, i32 8
  %conv11 = sext i8 %vecext10 to i16
  %vecinit12 = insertelement <8 x i16> %vecinit9, i16 %conv11, i32 4
  %vecext13 = extractelement <16 x i8> %a, i32 10
  %conv14 = sext i8 %vecext13 to i16
  %vecinit15 = insertelement <8 x i16> %vecinit12, i16 %conv14, i32 5
  %vecext16 = extractelement <16 x i8> %a, i32 12
  %conv17 = sext i8 %vecext16 to i16
  %vecinit18 = insertelement <8 x i16> %vecinit15, i16 %conv17, i32 6
  %vecext19 = extractelement <16 x i8> %a, i32 14
  %conv20 = sext i8 %vecext19 to i16
  %vecinit21 = insertelement <8 x i16> %vecinit18, i16 %conv20, i32 7
  ret <8 x i16> %vecinit21
}
