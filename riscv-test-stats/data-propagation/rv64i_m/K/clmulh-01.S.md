
# Data Propagation Report

- **STAT1** : Number of instructions that hit unique coverpoints and update the signature.
- **STAT2** : Number of instructions that hit covepoints which are not unique but still update the signature
- **STAT3** : Number of instructions that hit a unique coverpoint but do not update signature
- **STAT4** : Number of multiple signature updates for the same coverpoint
- **STAT5** : Number of times the signature was overwritten

| Param                     | Value    |
|---------------------------|----------|
| XLEN                      | 64      |
| TEST_REGION               | [('0x80000390', '0x80001e50')]      |
| SIG_REGION                | [('0x80003210', '0x80003b10', '288 dwords')]      |
| COV_LABELS                | clmulh      |
| TEST_NAME                 | /home/anku/bcrypto/trial8/64/riscof_work/clmulh-01.S/ref.S    |
| Total Number of coverpoints| 394     |
| Total Coverpoints Hit     | 387      |
| Total Signature Updates   | 287      |
| STAT1                     | 284      |
| STAT2                     | 3      |
| STAT3                     | 1     |
| STAT4                     | 0     |
| STAT5                     | 0     |

## Details for STAT2:

```
Op without unique coverpoint updates Signature
 -- Code Sequence:
      [0x80000848]:clmulh t6, t5, t4
      [0x8000084c]:sd t6, 216(t1)
 -- Signature Address: 0x800033c0 Data: 0x5555555555555555
 -- Redundant Coverpoints hit by the op
      - opcode : clmulh
      - rs1 : x30
      - rs2 : x29
      - rd : x31
      - rs1 != rs2  and rs1 != rd and rs2 != rd
      - rs2_val == 18446744073709550591
      - rs1_val == 18446744073709550591




Op without unique coverpoint updates Signature
 -- Code Sequence:
      [0x80001e2c]:clmulh t6, t5, t4
      [0x80001e30]:sd t6, 16(t1)
 -- Signature Address: 0x80003b00 Data: 0x55555556AAAAA955
 -- Redundant Coverpoints hit by the op
      - opcode : clmulh
      - rs1 : x30
      - rs2 : x29
      - rd : x31
      - rs1 != rs2  and rs1 != rd and rs2 != rd
      - rs2_val == 18446744056529682431
      - rs1_val == 18446744073709550591




Op without unique coverpoint updates Signature
 -- Code Sequence:
      [0x80001e44]:clmulh t6, t5, t4
      [0x80001e48]:sd t6, 24(t1)
 -- Signature Address: 0x80003b08 Data: 0x55555554AAAAA955
 -- Redundant Coverpoints hit by the op
      - opcode : clmulh
      - rs1 : x30
      - rs2 : x29
      - rd : x31
      - rs1 != rs2  and rs1 != rd and rs2 != rd
      - rs2_val == 18446744065119617023
      - rs1_val == 18446744073709550591






```

## Details of STAT3

```
[0x80001db8]:clmulh t6, t5, t4
[0x80001dbc]:addi t1, t1, 2040
[0x80001dc0]:sd t6, 2040(t1)
[0x80001dc4]:auipc t1, 2
[0x80001dc8]:addi t1, t1, 3364
[0x80001dcc]:addi t5, zero, 3071
[0x80001dd0]:addiw t4, zero, 4095
[0x80001dd4]:slli t4, t4, 62
[0x80001dd8]:addi t4, t4, 4095



```

## Details of STAT4:

```

```

## Details of STAT5:



## Details of STAT1:

- The first column indicates the signature address and the data at that location in hexadecimal in the following format: 
  ```
  [Address]
  Data
  ```

- The second column captures all the coverpoints which have been captured by that particular signature location

- The third column captures all the insrtuctions since the time a coverpoint was
  hit to the point when a store to the signature was performed. Each line has
  the following format:
  ```
  [PC of instruction] : mnemonic
  ```
- The order in the table is based on the order of signatures occuring in the
  test. These need not necessarily be in increasing or decreasing order of the
  address in the signature region.

|s.no|            signature             |                                                                   coverpoints                                                                   |                                 code                                 |
|---:|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
|   1|[0x80003210]<br>0x0000000000000000|- opcode : clmulh<br> - rs1 : x31<br> - rs2 : x30<br> - rd : x31<br> - rs1 == rd != rs2<br> - rs1_val==0 and rs2_val==0<br>                      |[0x800003a0]:clmulh t6, t6, t5<br> [0x800003a4]:sd t6, 0(ra)<br>      |
|   2|[0x80003218]<br>0x2AAAAAAAAAAAAB55|- rs1 : x30<br> - rs2 : x29<br> - rd : x29<br> - rs2 == rd != rs1<br> - rs2_val == 9223372036854775807<br> - rs1_val == 18446744073709550591<br> |[0x800003b8]:clmulh t4, t5, t4<br> [0x800003bc]:sd t4, 8(ra)<br>      |
|   3|[0x80003220]<br>0x5555555555555555|- rs1 : x28<br> - rs2 : x28<br> - rd : x30<br> - rs1 == rs2 != rd<br> - rs2_val == 18446744073709550591<br>                                      |[0x800003c8]:clmulh t5, t3, t3<br> [0x800003cc]:sd t5, 16(ra)<br>     |
|   4|[0x80003228]<br>0x4AAAAAAAAAAAA9D5|- rs1 : x29<br> - rs2 : x31<br> - rd : x28<br> - rs1 != rs2  and rs1 != rd and rs2 != rd<br> - rs2_val == 16140901064495857663<br>               |[0x800003e0]:clmulh t3, t4, t6<br> [0x800003e4]:sd t3, 24(ra)<br>     |
|   5|[0x80003230]<br>0x5555555555555555|- rs1 : x27<br> - rs2 : x27<br> - rd : x27<br> - rs1 == rs2 == rd<br>                                                                            |[0x800003f0]:clmulh s11, s11, s11<br> [0x800003f4]:sd s11, 32(ra)<br> |
|   6|[0x80003238]<br>0x52AAAAAAAAAAA975|- rs1 : x25<br> - rs2 : x24<br> - rd : x26<br> - rs2_val == 17870283321406128127<br>                                                             |[0x80000408]:clmulh s10, s9, s8<br> [0x8000040c]:sd s10, 40(ra)<br>   |
|   7|[0x80003240]<br>0x56AAAAAAAAAAA945|- rs1 : x24<br> - rs2 : x26<br> - rd : x25<br> - rs2_val == 18158513697557839871<br>                                                             |[0x80000420]:clmulh s9, s8, s10<br> [0x80000424]:sd s9, 48(ra)<br>    |
|   8|[0x80003248]<br>0x54AAAAAAAAAAA95D|- rs1 : x26<br> - rs2 : x25<br> - rd : x24<br> - rs2_val == 18302628885633695743<br>                                                             |[0x80000438]:clmulh s8, s10, s9<br> [0x8000043c]:sd s8, 56(ra)<br>    |
|   9|[0x80003250]<br>0x55AAAAAAAAAAA951|- rs1 : x22<br> - rs2 : x21<br> - rd : x23<br> - rs2_val == 18374686479671623679<br>                                                             |[0x80000450]:clmulh s7, s6, s5<br> [0x80000454]:sd s7, 64(ra)<br>     |
|  10|[0x80003258]<br>0x552AAAAAAAAAA957|- rs1 : x21<br> - rs2 : x23<br> - rd : x22<br> - rs2_val == 18410715276690587647<br>                                                             |[0x80000468]:clmulh s6, s5, s7<br> [0x8000046c]:sd s6, 72(ra)<br>     |
|  11|[0x80003260]<br>0x556AAAAAAAAAA954|- rs1 : x23<br> - rs2 : x22<br> - rd : x21<br> - rs2_val == 18428729675200069631<br>                                                             |[0x80000480]:clmulh s5, s7, s6<br> [0x80000484]:sd s5, 80(ra)<br>     |
|  12|[0x80003268]<br>0x554AAAAAAAAAA955|- rs1 : x19<br> - rs2 : x18<br> - rd : x20<br> - rs2_val == 18437736874454810623<br>                                                             |[0x80000498]:clmulh s4, s3, s2<br> [0x8000049c]:sd s4, 88(ra)<br>     |
|  13|[0x80003270]<br>0x555AAAAAAAAAA955|- rs1 : x18<br> - rs2 : x20<br> - rd : x19<br> - rs2_val == 18442240474082181119<br>                                                             |[0x800004b0]:clmulh s3, s2, s4<br> [0x800004b4]:sd s3, 96(ra)<br>     |
|  14|[0x80003278]<br>0x5552AAAAAAAAA955|- rs1 : x20<br> - rs2 : x19<br> - rd : x18<br> - rs2_val == 18444492273895866367<br>                                                             |[0x800004c8]:clmulh s2, s4, s3<br> [0x800004cc]:sd s2, 104(ra)<br>    |
|  15|[0x80003280]<br>0x5556AAAAAAAAA955|- rs1 : x16<br> - rs2 : x15<br> - rd : x17<br> - rs2_val == 18445618173802708991<br>                                                             |[0x800004e0]:clmulh a7, a6, a5<br> [0x800004e4]:sd a7, 112(ra)<br>    |
|  16|[0x80003288]<br>0x5554AAAAAAAAA955|- rs1 : x15<br> - rs2 : x17<br> - rd : x16<br> - rs2_val == 18446181123756130303<br>                                                             |[0x800004f8]:clmulh a6, a5, a7<br> [0x800004fc]:sd a6, 120(ra)<br>    |
|  17|[0x80003290]<br>0x5555AAAAAAAAA955|- rs1 : x17<br> - rs2 : x16<br> - rd : x15<br> - rs2_val == 18446462598732840959<br>                                                             |[0x80000510]:clmulh a5, a7, a6<br> [0x80000514]:sd a5, 128(ra)<br>    |
|  18|[0x80003298]<br>0x55552AAAAAAAA955|- rs1 : x13<br> - rs2 : x12<br> - rd : x14<br> - rs2_val == 18446603336221196287<br>                                                             |[0x80000528]:clmulh a4, a3, a2<br> [0x8000052c]:sd a4, 136(ra)<br>    |
|  19|[0x800032a0]<br>0x55556AAAAAAAA955|- rs1 : x12<br> - rs2 : x14<br> - rd : x13<br> - rs2_val == 18446673704965373951<br>                                                             |[0x80000540]:clmulh a3, a2, a4<br> [0x80000544]:sd a3, 144(ra)<br>    |
|  20|[0x800032a8]<br>0x55554AAAAAAAA955|- rs1 : x14<br> - rs2 : x13<br> - rd : x12<br> - rs2_val == 18446708889337462783<br>                                                             |[0x80000558]:clmulh a2, a4, a3<br> [0x8000055c]:sd a2, 152(ra)<br>    |
|  21|[0x800032b0]<br>0x55555AAAAAAAA955|- rs1 : x10<br> - rs2 : x9<br> - rd : x11<br> - rs2_val == 18446726481523507199<br>                                                              |[0x80000570]:clmulh a1, a0, s1<br> [0x80000574]:sd a1, 160(ra)<br>    |
|  22|[0x800032b8]<br>0x555552AAAAAAA955|- rs1 : x9<br> - rs2 : x11<br> - rd : x10<br> - rs2_val == 18446735277616529407<br>                                                              |[0x80000588]:clmulh a0, s1, a1<br> [0x8000058c]:sd a0, 168(ra)<br>    |
|  23|[0x800032c0]<br>0x555556AAAAAAA955|- rs1 : x11<br> - rs2 : x10<br> - rd : x9<br> - rs2_val == 18446739675663040511<br>                                                              |[0x800005a0]:clmulh s1, a1, a0<br> [0x800005a4]:sd s1, 176(ra)<br>    |
|  24|[0x800032c8]<br>0x555554AAAAAAA955|- rs1 : x7<br> - rs2 : x6<br> - rd : x8<br> - rs2_val == 18446741874686296063<br>                                                                |[0x800005b8]:clmulh fp, t2, t1<br> [0x800005bc]:sd fp, 184(ra)<br>    |
|  25|[0x800032d0]<br>0x555555AAAAAAA955|- rs1 : x6<br> - rs2 : x8<br> - rd : x7<br> - rs2_val == 18446742974197923839<br>                                                                |[0x800005d0]:clmulh t2, t1, fp<br> [0x800005d4]:sd t2, 192(ra)<br>    |
|  26|[0x800032d8]<br>0x5555552AAAAAA955|- rs1 : x8<br> - rs2 : x7<br> - rd : x6<br> - rs2_val == 18446743523953737727<br>                                                                |[0x800005e8]:clmulh t1, fp, t2<br> [0x800005ec]:sd t1, 200(ra)<br>    |
|  27|[0x800032e0]<br>0x5555556AAAAAA955|- rs1 : x4<br> - rs2 : x3<br> - rd : x5<br> - rs2_val == 18446743798831644671<br>                                                                |[0x80000600]:clmulh t0, tp, gp<br> [0x80000604]:sd t0, 208(ra)<br>    |
|  28|[0x800032e8]<br>0x5555554AAAAAA955|- rs1 : x3<br> - rs2 : x5<br> - rd : x4<br> - rs2_val == 18446743936270598143<br>                                                                |[0x80000620]:clmulh tp, gp, t0<br> [0x80000624]:sd tp, 0(t1)<br>      |
|  29|[0x800032f0]<br>0x5555555AAAAAA955|- rs1 : x5<br> - rs2 : x4<br> - rd : x3<br> - rs2_val == 18446744004990074879<br>                                                                |[0x80000638]:clmulh gp, t0, tp<br> [0x8000063c]:sd gp, 8(t1)<br>      |
|  30|[0x800032f8]<br>0x0000000000000000|- rs1 : x1<br> - rs2 : x0<br> - rd : x2<br>                                                                                                      |[0x80000648]:clmulh sp, ra, zero<br> [0x8000064c]:sd sp, 16(t1)<br>   |
|  31|[0x80003300]<br>0x0000000000000000|- rs1 : x0<br> - rs2 : x2<br> - rd : x1<br> - rs2_val == 18446744056529682431<br>                                                                |[0x80000660]:clmulh ra, zero, sp<br> [0x80000664]:sd ra, 24(t1)<br>   |
|  32|[0x80003308]<br>0x0000000000000000|- rs1 : x2<br> - rs2 : x1<br> - rd : x0<br> - rs2_val == 18446744065119617023<br>                                                                |[0x80000678]:clmulh zero, sp, ra<br> [0x8000067c]:sd zero, 32(t1)<br> |
|  33|[0x80003310]<br>0x55555555AAAAA955|- rs2_val == 18446744069414584319<br>                                                                                                            |[0x80000690]:clmulh t6, t5, t4<br> [0x80000694]:sd t6, 40(t1)<br>     |
|  34|[0x80003318]<br>0x555555552AAAA955|- rs2_val == 18446744071562067967<br>                                                                                                            |[0x800006a8]:clmulh t6, t5, t4<br> [0x800006ac]:sd t6, 48(t1)<br>     |
|  35|[0x80003320]<br>0x555555556AAAA955|- rs2_val == 18446744072635809791<br>                                                                                                            |[0x800006bc]:clmulh t6, t5, t4<br> [0x800006c0]:sd t6, 56(t1)<br>     |
|  36|[0x80003328]<br>0x555555554AAAA955|- rs2_val == 18446744073172680703<br>                                                                                                            |[0x800006d0]:clmulh t6, t5, t4<br> [0x800006d4]:sd t6, 64(t1)<br>     |
|  37|[0x80003330]<br>0x555555555AAAA955|- rs2_val == 18446744073441116159<br>                                                                                                            |[0x800006e4]:clmulh t6, t5, t4<br> [0x800006e8]:sd t6, 72(t1)<br>     |
|  38|[0x80003338]<br>0x5555555552AAA955|- rs2_val == 18446744073575333887<br>                                                                                                            |[0x800006f8]:clmulh t6, t5, t4<br> [0x800006fc]:sd t6, 80(t1)<br>     |
|  39|[0x80003340]<br>0x5555555556AAA955|- rs2_val == 18446744073642442751<br>                                                                                                            |[0x8000070c]:clmulh t6, t5, t4<br> [0x80000710]:sd t6, 88(t1)<br>     |
|  40|[0x80003348]<br>0x5555555554AAA955|- rs2_val == 18446744073675997183<br>                                                                                                            |[0x80000720]:clmulh t6, t5, t4<br> [0x80000724]:sd t6, 96(t1)<br>     |
|  41|[0x80003350]<br>0x5555555555AAA955|- rs2_val == 18446744073692774399<br>                                                                                                            |[0x80000734]:clmulh t6, t5, t4<br> [0x80000738]:sd t6, 104(t1)<br>    |
|  42|[0x80003358]<br>0x55555555552AA955|- rs2_val == 18446744073701163007<br>                                                                                                            |[0x80000748]:clmulh t6, t5, t4<br> [0x8000074c]:sd t6, 112(t1)<br>    |
|  43|[0x80003360]<br>0x55555555556AA955|- rs2_val == 18446744073705357311<br>                                                                                                            |[0x8000075c]:clmulh t6, t5, t4<br> [0x80000760]:sd t6, 120(t1)<br>    |
|  44|[0x80003368]<br>0x55555555554AA955|- rs2_val == 18446744073707454463<br>                                                                                                            |[0x80000770]:clmulh t6, t5, t4<br> [0x80000774]:sd t6, 128(t1)<br>    |
|  45|[0x80003370]<br>0x55555555555AA955|- rs2_val == 18446744073708503039<br>                                                                                                            |[0x80000784]:clmulh t6, t5, t4<br> [0x80000788]:sd t6, 136(t1)<br>    |
|  46|[0x80003378]<br>0x555555555552A955|- rs2_val == 18446744073709027327<br>                                                                                                            |[0x80000798]:clmulh t6, t5, t4<br> [0x8000079c]:sd t6, 144(t1)<br>    |
|  47|[0x80003380]<br>0x555555555556A955|- rs2_val == 18446744073709289471<br>                                                                                                            |[0x800007ac]:clmulh t6, t5, t4<br> [0x800007b0]:sd t6, 152(t1)<br>    |
|  48|[0x80003388]<br>0x555555555554A955|- rs2_val == 18446744073709420543<br>                                                                                                            |[0x800007c0]:clmulh t6, t5, t4<br> [0x800007c4]:sd t6, 160(t1)<br>    |
|  49|[0x80003390]<br>0x555555555555A955|- rs2_val == 18446744073709486079<br>                                                                                                            |[0x800007d4]:clmulh t6, t5, t4<br> [0x800007d8]:sd t6, 168(t1)<br>    |
|  50|[0x80003398]<br>0x5555555555552955|- rs2_val == 18446744073709518847<br>                                                                                                            |[0x800007e8]:clmulh t6, t5, t4<br> [0x800007ec]:sd t6, 176(t1)<br>    |
|  51|[0x800033a0]<br>0x5555555555556955|- rs2_val == 18446744073709535231<br>                                                                                                            |[0x800007fc]:clmulh t6, t5, t4<br> [0x80000800]:sd t6, 184(t1)<br>    |
|  52|[0x800033a8]<br>0x5555555555554955|- rs2_val == 18446744073709543423<br>                                                                                                            |[0x80000810]:clmulh t6, t5, t4<br> [0x80000814]:sd t6, 192(t1)<br>    |
|  53|[0x800033b0]<br>0x5555555555555955|- rs2_val == 18446744073709547519<br>                                                                                                            |[0x80000824]:clmulh t6, t5, t4<br> [0x80000828]:sd t6, 200(t1)<br>    |
|  54|[0x800033b8]<br>0x5555555555555155|- rs2_val == 18446744073709549567<br>                                                                                                            |[0x80000838]:clmulh t6, t5, t4<br> [0x8000083c]:sd t6, 208(t1)<br>    |
|  55|[0x800033c8]<br>0x5555555555555755|- rs2_val == 18446744073709551103<br>                                                                                                            |[0x80000858]:clmulh t6, t5, t4<br> [0x8000085c]:sd t6, 224(t1)<br>    |
|  56|[0x800033d0]<br>0x5555555555555655|- rs2_val == 18446744073709551359<br>                                                                                                            |[0x80000868]:clmulh t6, t5, t4<br> [0x8000086c]:sd t6, 232(t1)<br>    |
|  57|[0x800033d8]<br>0x55555555555556D5|- rs2_val == 18446744073709551487<br>                                                                                                            |[0x80000878]:clmulh t6, t5, t4<br> [0x8000087c]:sd t6, 240(t1)<br>    |
|  58|[0x800033e0]<br>0x5555555555555695|- rs2_val == 18446744073709551551<br>                                                                                                            |[0x80000888]:clmulh t6, t5, t4<br> [0x8000088c]:sd t6, 248(t1)<br>    |
|  59|[0x800033e8]<br>0x55555555555556B5|- rs2_val == 18446744073709551583<br>                                                                                                            |[0x80000898]:clmulh t6, t5, t4<br> [0x8000089c]:sd t6, 256(t1)<br>    |
|  60|[0x800033f0]<br>0x55555555555556A5|- rs2_val == 18446744073709551599<br>                                                                                                            |[0x800008a8]:clmulh t6, t5, t4<br> [0x800008ac]:sd t6, 264(t1)<br>    |
|  61|[0x800033f8]<br>0x55555555555556AD|- rs2_val == 18446744073709551607<br>                                                                                                            |[0x800008b8]:clmulh t6, t5, t4<br> [0x800008bc]:sd t6, 272(t1)<br>    |
|  62|[0x80003400]<br>0x55555555555556A9|- rs2_val == 18446744073709551611<br>                                                                                                            |[0x800008c8]:clmulh t6, t5, t4<br> [0x800008cc]:sd t6, 280(t1)<br>    |
|  63|[0x80003408]<br>0x55555555555556AB|- rs2_val == 18446744073709551613<br>                                                                                                            |[0x800008d8]:clmulh t6, t5, t4<br> [0x800008dc]:sd t6, 288(t1)<br>    |
|  64|[0x80003410]<br>0x55555555555556AA|- rs2_val == 18446744073709551614<br>                                                                                                            |[0x800008e8]:clmulh t6, t5, t4<br> [0x800008ec]:sd t6, 296(t1)<br>    |
|  65|[0x80003418]<br>0x2AAAAAAAAAAAAB55|- rs1_val == 9223372036854775807<br>                                                                                                             |[0x80000900]:clmulh t6, t5, t4<br> [0x80000904]:sd t6, 304(t1)<br>    |
|  66|[0x80003420]<br>0x6AAAAAAAAAAAA855|- rs1_val == 13835058055282163711<br>                                                                                                            |[0x80000918]:clmulh t6, t5, t4<br> [0x8000091c]:sd t6, 312(t1)<br>    |
|  67|[0x80003428]<br>0x4AAAAAAAAAAAA9D5|- rs1_val == 16140901064495857663<br>                                                                                                            |[0x80000930]:clmulh t6, t5, t4<br> [0x80000934]:sd t6, 320(t1)<br>    |
|  68|[0x80003430]<br>0x5AAAAAAAAAAAA915|- rs1_val == 17293822569102704639<br>                                                                                                            |[0x80000948]:clmulh t6, t5, t4<br> [0x8000094c]:sd t6, 328(t1)<br>    |
|  69|[0x80003438]<br>0x52AAAAAAAAAAA975|- rs1_val == 17870283321406128127<br>                                                                                                            |[0x80000960]:clmulh t6, t5, t4<br> [0x80000964]:sd t6, 336(t1)<br>    |
|  70|[0x80003440]<br>0x56AAAAAAAAAAA945|- rs1_val == 18158513697557839871<br>                                                                                                            |[0x80000978]:clmulh t6, t5, t4<br> [0x8000097c]:sd t6, 344(t1)<br>    |
|  71|[0x80003448]<br>0x54AAAAAAAAAAA95D|- rs1_val == 18302628885633695743<br>                                                                                                            |[0x80000990]:clmulh t6, t5, t4<br> [0x80000994]:sd t6, 352(t1)<br>    |
|  72|[0x80003450]<br>0x55AAAAAAAAAAA951|- rs1_val == 18374686479671623679<br>                                                                                                            |[0x800009a8]:clmulh t6, t5, t4<br> [0x800009ac]:sd t6, 360(t1)<br>    |
|  73|[0x80003458]<br>0x552AAAAAAAAAA957|- rs1_val == 18410715276690587647<br>                                                                                                            |[0x800009c0]:clmulh t6, t5, t4<br> [0x800009c4]:sd t6, 368(t1)<br>    |
|  74|[0x80003460]<br>0x556AAAAAAAAAA954|- rs1_val == 18428729675200069631<br>                                                                                                            |[0x800009d8]:clmulh t6, t5, t4<br> [0x800009dc]:sd t6, 376(t1)<br>    |
|  75|[0x80003468]<br>0x554AAAAAAAAAA955|- rs1_val == 18437736874454810623<br>                                                                                                            |[0x800009f0]:clmulh t6, t5, t4<br> [0x800009f4]:sd t6, 384(t1)<br>    |
|  76|[0x80003470]<br>0x555AAAAAAAAAA955|- rs1_val == 18442240474082181119<br>                                                                                                            |[0x80000a08]:clmulh t6, t5, t4<br> [0x80000a0c]:sd t6, 392(t1)<br>    |
|  77|[0x80003478]<br>0x5552AAAAAAAAA955|- rs1_val == 18444492273895866367<br>                                                                                                            |[0x80000a20]:clmulh t6, t5, t4<br> [0x80000a24]:sd t6, 400(t1)<br>    |
|  78|[0x80003480]<br>0x5556AAAAAAAAA955|- rs1_val == 18445618173802708991<br>                                                                                                            |[0x80000a38]:clmulh t6, t5, t4<br> [0x80000a3c]:sd t6, 408(t1)<br>    |
|  79|[0x80003488]<br>0x5554AAAAAAAAA955|- rs1_val == 18446181123756130303<br>                                                                                                            |[0x80000a50]:clmulh t6, t5, t4<br> [0x80000a54]:sd t6, 416(t1)<br>    |
|  80|[0x80003490]<br>0x5555AAAAAAAAA955|- rs1_val == 18446462598732840959<br>                                                                                                            |[0x80000a68]:clmulh t6, t5, t4<br> [0x80000a6c]:sd t6, 424(t1)<br>    |
|  81|[0x80003498]<br>0x55552AAAAAAAA955|- rs1_val == 18446603336221196287<br>                                                                                                            |[0x80000a80]:clmulh t6, t5, t4<br> [0x80000a84]:sd t6, 432(t1)<br>    |
|  82|[0x800034a0]<br>0x55556AAAAAAAA955|- rs1_val == 18446673704965373951<br>                                                                                                            |[0x80000a98]:clmulh t6, t5, t4<br> [0x80000a9c]:sd t6, 440(t1)<br>    |
|  83|[0x800034a8]<br>0x55554AAAAAAAA955|- rs1_val == 18446708889337462783<br>                                                                                                            |[0x80000ab0]:clmulh t6, t5, t4<br> [0x80000ab4]:sd t6, 448(t1)<br>    |
|  84|[0x800034b0]<br>0x55555AAAAAAAA955|- rs1_val == 18446726481523507199<br>                                                                                                            |[0x80000ac8]:clmulh t6, t5, t4<br> [0x80000acc]:sd t6, 456(t1)<br>    |
|  85|[0x800034b8]<br>0x555552AAAAAAA955|- rs1_val == 18446735277616529407<br>                                                                                                            |[0x80000ae0]:clmulh t6, t5, t4<br> [0x80000ae4]:sd t6, 464(t1)<br>    |
|  86|[0x800034c0]<br>0x555556AAAAAAA955|- rs1_val == 18446739675663040511<br>                                                                                                            |[0x80000af8]:clmulh t6, t5, t4<br> [0x80000afc]:sd t6, 472(t1)<br>    |
|  87|[0x800034c8]<br>0x555554AAAAAAA955|- rs1_val == 18446741874686296063<br>                                                                                                            |[0x80000b10]:clmulh t6, t5, t4<br> [0x80000b14]:sd t6, 480(t1)<br>    |
|  88|[0x800034d0]<br>0x555555AAAAAAA955|- rs1_val == 18446742974197923839<br>                                                                                                            |[0x80000b28]:clmulh t6, t5, t4<br> [0x80000b2c]:sd t6, 488(t1)<br>    |
|  89|[0x800034d8]<br>0x5555552AAAAAA955|- rs1_val == 18446743523953737727<br>                                                                                                            |[0x80000b40]:clmulh t6, t5, t4<br> [0x80000b44]:sd t6, 496(t1)<br>    |
|  90|[0x800034e0]<br>0x5555556AAAAAA955|- rs1_val == 18446743798831644671<br>                                                                                                            |[0x80000b58]:clmulh t6, t5, t4<br> [0x80000b5c]:sd t6, 504(t1)<br>    |
|  91|[0x800034e8]<br>0x5555554AAAAAA955|- rs1_val == 18446743936270598143<br>                                                                                                            |[0x80000b70]:clmulh t6, t5, t4<br> [0x80000b74]:sd t6, 512(t1)<br>    |
|  92|[0x800034f0]<br>0x5555555AAAAAA955|- rs1_val == 18446744004990074879<br>                                                                                                            |[0x80000b88]:clmulh t6, t5, t4<br> [0x80000b8c]:sd t6, 520(t1)<br>    |
|  93|[0x800034f8]<br>0x55555552AAAAA955|- rs1_val == 18446744039349813247<br>                                                                                                            |[0x80000ba0]:clmulh t6, t5, t4<br> [0x80000ba4]:sd t6, 528(t1)<br>    |
|  94|[0x80003500]<br>0x55555556AAAAA955|- rs1_val == 18446744056529682431<br>                                                                                                            |[0x80000bb8]:clmulh t6, t5, t4<br> [0x80000bbc]:sd t6, 536(t1)<br>    |
|  95|[0x80003508]<br>0x55555554AAAAA955|- rs1_val == 18446744065119617023<br>                                                                                                            |[0x80000bd0]:clmulh t6, t5, t4<br> [0x80000bd4]:sd t6, 544(t1)<br>    |
|  96|[0x80003510]<br>0x55555555AAAAA955|- rs1_val == 18446744069414584319<br>                                                                                                            |[0x80000be8]:clmulh t6, t5, t4<br> [0x80000bec]:sd t6, 552(t1)<br>    |
|  97|[0x80003518]<br>0x555555552AAAA955|- rs1_val == 18446744071562067967<br>                                                                                                            |[0x80000c00]:clmulh t6, t5, t4<br> [0x80000c04]:sd t6, 560(t1)<br>    |
|  98|[0x80003520]<br>0x555555556AAAA955|- rs1_val == 18446744072635809791<br>                                                                                                            |[0x80000c14]:clmulh t6, t5, t4<br> [0x80000c18]:sd t6, 568(t1)<br>    |
|  99|[0x80003528]<br>0x555555554AAAA955|- rs1_val == 18446744073172680703<br>                                                                                                            |[0x80000c28]:clmulh t6, t5, t4<br> [0x80000c2c]:sd t6, 576(t1)<br>    |
| 100|[0x80003530]<br>0x555555555AAAA955|- rs1_val == 18446744073441116159<br>                                                                                                            |[0x80000c3c]:clmulh t6, t5, t4<br> [0x80000c40]:sd t6, 584(t1)<br>    |
| 101|[0x80003538]<br>0x5555555552AAA955|- rs1_val == 18446744073575333887<br>                                                                                                            |[0x80000c50]:clmulh t6, t5, t4<br> [0x80000c54]:sd t6, 592(t1)<br>    |
| 102|[0x80003540]<br>0x5555555556AAA955|- rs1_val == 18446744073642442751<br>                                                                                                            |[0x80000c64]:clmulh t6, t5, t4<br> [0x80000c68]:sd t6, 600(t1)<br>    |
| 103|[0x80003548]<br>0x5555555554AAA955|- rs1_val == 18446744073675997183<br>                                                                                                            |[0x80000c78]:clmulh t6, t5, t4<br> [0x80000c7c]:sd t6, 608(t1)<br>    |
| 104|[0x80003550]<br>0x5555555555AAA955|- rs1_val == 18446744073692774399<br>                                                                                                            |[0x80000c8c]:clmulh t6, t5, t4<br> [0x80000c90]:sd t6, 616(t1)<br>    |
| 105|[0x80003558]<br>0x55555555552AA955|- rs1_val == 18446744073701163007<br>                                                                                                            |[0x80000ca0]:clmulh t6, t5, t4<br> [0x80000ca4]:sd t6, 624(t1)<br>    |
| 106|[0x80003560]<br>0x55555555556AA955|- rs1_val == 18446744073705357311<br>                                                                                                            |[0x80000cb4]:clmulh t6, t5, t4<br> [0x80000cb8]:sd t6, 632(t1)<br>    |
| 107|[0x80003568]<br>0x55555555554AA955|- rs1_val == 18446744073707454463<br>                                                                                                            |[0x80000cc8]:clmulh t6, t5, t4<br> [0x80000ccc]:sd t6, 640(t1)<br>    |
| 108|[0x80003570]<br>0x55555555555AA955|- rs1_val == 18446744073708503039<br>                                                                                                            |[0x80000cdc]:clmulh t6, t5, t4<br> [0x80000ce0]:sd t6, 648(t1)<br>    |
| 109|[0x80003578]<br>0x555555555552A955|- rs1_val == 18446744073709027327<br>                                                                                                            |[0x80000cf0]:clmulh t6, t5, t4<br> [0x80000cf4]:sd t6, 656(t1)<br>    |
| 110|[0x80003580]<br>0x555555555556A955|- rs1_val == 18446744073709289471<br>                                                                                                            |[0x80000d04]:clmulh t6, t5, t4<br> [0x80000d08]:sd t6, 664(t1)<br>    |
| 111|[0x80003588]<br>0x555555555554A955|- rs1_val == 18446744073709420543<br>                                                                                                            |[0x80000d18]:clmulh t6, t5, t4<br> [0x80000d1c]:sd t6, 672(t1)<br>    |
| 112|[0x80003590]<br>0x555555555555A955|- rs1_val == 18446744073709486079<br>                                                                                                            |[0x80000d2c]:clmulh t6, t5, t4<br> [0x80000d30]:sd t6, 680(t1)<br>    |
| 113|[0x80003598]<br>0x5555555555552955|- rs1_val == 18446744073709518847<br>                                                                                                            |[0x80000d40]:clmulh t6, t5, t4<br> [0x80000d44]:sd t6, 688(t1)<br>    |
| 114|[0x800035a0]<br>0x5555555555556955|- rs1_val == 18446744073709535231<br>                                                                                                            |[0x80000d54]:clmulh t6, t5, t4<br> [0x80000d58]:sd t6, 696(t1)<br>    |
| 115|[0x800035a8]<br>0x5555555555554955|- rs1_val == 18446744073709543423<br>                                                                                                            |[0x80000d68]:clmulh t6, t5, t4<br> [0x80000d6c]:sd t6, 704(t1)<br>    |
| 116|[0x800035b0]<br>0x5555555555555955|- rs1_val == 18446744073709547519<br>                                                                                                            |[0x80000d7c]:clmulh t6, t5, t4<br> [0x80000d80]:sd t6, 712(t1)<br>    |
| 117|[0x800035b8]<br>0x5555555555555155|- rs1_val == 18446744073709549567<br>                                                                                                            |[0x80000d90]:clmulh t6, t5, t4<br> [0x80000d94]:sd t6, 720(t1)<br>    |
| 118|[0x800035c0]<br>0x5555555555555755|- rs1_val == 18446744073709551103<br>                                                                                                            |[0x80000da0]:clmulh t6, t5, t4<br> [0x80000da4]:sd t6, 728(t1)<br>    |
| 119|[0x800035c8]<br>0x5555555555555655|- rs1_val == 18446744073709551359<br>                                                                                                            |[0x80000db0]:clmulh t6, t5, t4<br> [0x80000db4]:sd t6, 736(t1)<br>    |
| 120|[0x800035d0]<br>0x55555555555556D5|- rs1_val == 18446744073709551487<br>                                                                                                            |[0x80000dc0]:clmulh t6, t5, t4<br> [0x80000dc4]:sd t6, 744(t1)<br>    |
| 121|[0x800035d8]<br>0x5555555555555695|- rs1_val == 18446744073709551551<br>                                                                                                            |[0x80000dd0]:clmulh t6, t5, t4<br> [0x80000dd4]:sd t6, 752(t1)<br>    |
| 122|[0x800035e0]<br>0x55555555555556B5|- rs1_val == 18446744073709551583<br>                                                                                                            |[0x80000de0]:clmulh t6, t5, t4<br> [0x80000de4]:sd t6, 760(t1)<br>    |
| 123|[0x800035e8]<br>0x55555555555556A5|- rs1_val == 18446744073709551599<br>                                                                                                            |[0x80000df0]:clmulh t6, t5, t4<br> [0x80000df4]:sd t6, 768(t1)<br>    |
| 124|[0x800035f0]<br>0x55555555555556AD|- rs1_val == 18446744073709551607<br>                                                                                                            |[0x80000e00]:clmulh t6, t5, t4<br> [0x80000e04]:sd t6, 776(t1)<br>    |
| 125|[0x800035f8]<br>0x55555555555556A9|- rs1_val == 18446744073709551611<br>                                                                                                            |[0x80000e10]:clmulh t6, t5, t4<br> [0x80000e14]:sd t6, 784(t1)<br>    |
| 126|[0x80003600]<br>0x55555555555556AB|- rs1_val == 18446744073709551613<br>                                                                                                            |[0x80000e20]:clmulh t6, t5, t4<br> [0x80000e24]:sd t6, 792(t1)<br>    |
| 127|[0x80003608]<br>0x55555555555556AA|- rs1_val == 18446744073709551614<br>                                                                                                            |[0x80000e30]:clmulh t6, t5, t4<br> [0x80000e34]:sd t6, 800(t1)<br>    |
| 128|[0x80003610]<br>0x7FFFFFFFFFFFFDFF|- rs2_val == 9223372036854775808<br>                                                                                                             |[0x80000e44]:clmulh t6, t5, t4<br> [0x80000e48]:sd t6, 808(t1)<br>    |
| 129|[0x80003618]<br>0x3FFFFFFFFFFFFEFF|- rs2_val == 4611686018427387904<br>                                                                                                             |[0x80000e58]:clmulh t6, t5, t4<br> [0x80000e5c]:sd t6, 816(t1)<br>    |
| 130|[0x80003620]<br>0x1FFFFFFFFFFFFF7F|- rs2_val == 2305843009213693952<br>                                                                                                             |[0x80000e6c]:clmulh t6, t5, t4<br> [0x80000e70]:sd t6, 824(t1)<br>    |
| 131|[0x80003628]<br>0x0FFFFFFFFFFFFFBF|- rs2_val == 1152921504606846976<br>                                                                                                             |[0x80000e80]:clmulh t6, t5, t4<br> [0x80000e84]:sd t6, 832(t1)<br>    |
| 132|[0x80003630]<br>0x07FFFFFFFFFFFFDF|- rs2_val == 576460752303423488<br>                                                                                                              |[0x80000e94]:clmulh t6, t5, t4<br> [0x80000e98]:sd t6, 840(t1)<br>    |
| 133|[0x80003638]<br>0x03FFFFFFFFFFFFEF|- rs2_val == 288230376151711744<br>                                                                                                              |[0x80000ea8]:clmulh t6, t5, t4<br> [0x80000eac]:sd t6, 848(t1)<br>    |
| 134|[0x80003640]<br>0x01FFFFFFFFFFFFF7|- rs2_val == 144115188075855872<br>                                                                                                              |[0x80000ebc]:clmulh t6, t5, t4<br> [0x80000ec0]:sd t6, 856(t1)<br>    |
| 135|[0x80003648]<br>0x00FFFFFFFFFFFFFB|- rs2_val == 72057594037927936<br>                                                                                                               |[0x80000ed0]:clmulh t6, t5, t4<br> [0x80000ed4]:sd t6, 864(t1)<br>    |
| 136|[0x80003650]<br>0x007FFFFFFFFFFFFD|- rs2_val == 36028797018963968<br>                                                                                                               |[0x80000ee4]:clmulh t6, t5, t4<br> [0x80000ee8]:sd t6, 872(t1)<br>    |
| 137|[0x80003658]<br>0x003FFFFFFFFFFFFE|- rs2_val == 18014398509481984<br>                                                                                                               |[0x80000ef8]:clmulh t6, t5, t4<br> [0x80000efc]:sd t6, 880(t1)<br>    |
| 138|[0x80003660]<br>0x001FFFFFFFFFFFFF|- rs2_val == 9007199254740992<br>                                                                                                                |[0x80000f0c]:clmulh t6, t5, t4<br> [0x80000f10]:sd t6, 888(t1)<br>    |
| 139|[0x80003668]<br>0x000FFFFFFFFFFFFF|- rs2_val == 4503599627370496<br>                                                                                                                |[0x80000f20]:clmulh t6, t5, t4<br> [0x80000f24]:sd t6, 896(t1)<br>    |
| 140|[0x80003670]<br>0x0007FFFFFFFFFFFF|- rs2_val == 2251799813685248<br>                                                                                                                |[0x80000f34]:clmulh t6, t5, t4<br> [0x80000f38]:sd t6, 904(t1)<br>    |
| 141|[0x80003678]<br>0x0003FFFFFFFFFFFF|- rs2_val == 1125899906842624<br>                                                                                                                |[0x80000f48]:clmulh t6, t5, t4<br> [0x80000f4c]:sd t6, 912(t1)<br>    |
| 142|[0x80003680]<br>0x0001FFFFFFFFFFFF|- rs2_val == 562949953421312<br>                                                                                                                 |[0x80000f5c]:clmulh t6, t5, t4<br> [0x80000f60]:sd t6, 920(t1)<br>    |
| 143|[0x80003688]<br>0x0000FFFFFFFFFFFF|- rs2_val == 281474976710656<br>                                                                                                                 |[0x80000f70]:clmulh t6, t5, t4<br> [0x80000f74]:sd t6, 928(t1)<br>    |
| 144|[0x80003690]<br>0x00007FFFFFFFFFFF|- rs2_val == 140737488355328<br>                                                                                                                 |[0x80000f84]:clmulh t6, t5, t4<br> [0x80000f88]:sd t6, 936(t1)<br>    |
| 145|[0x80003698]<br>0x00003FFFFFFFFFFF|- rs2_val == 70368744177664<br>                                                                                                                  |[0x80000f98]:clmulh t6, t5, t4<br> [0x80000f9c]:sd t6, 944(t1)<br>    |
| 146|[0x800036a0]<br>0x00001FFFFFFFFFFF|- rs2_val == 35184372088832<br>                                                                                                                  |[0x80000fac]:clmulh t6, t5, t4<br> [0x80000fb0]:sd t6, 952(t1)<br>    |
| 147|[0x800036a8]<br>0x00000FFFFFFFFFFF|- rs2_val == 17592186044416<br>                                                                                                                  |[0x80000fc0]:clmulh t6, t5, t4<br> [0x80000fc4]:sd t6, 960(t1)<br>    |
| 148|[0x800036b0]<br>0x000007FFFFFFFFFF|- rs2_val == 8796093022208<br>                                                                                                                   |[0x80000fd4]:clmulh t6, t5, t4<br> [0x80000fd8]:sd t6, 968(t1)<br>    |
| 149|[0x800036b8]<br>0x000003FFFFFFFFFF|- rs2_val == 4398046511104<br>                                                                                                                   |[0x80000fe8]:clmulh t6, t5, t4<br> [0x80000fec]:sd t6, 976(t1)<br>    |
| 150|[0x800036c0]<br>0x000001FFFFFFFFFF|- rs2_val == 2199023255552<br>                                                                                                                   |[0x80000ffc]:clmulh t6, t5, t4<br> [0x80001000]:sd t6, 984(t1)<br>    |
| 151|[0x800036c8]<br>0x000000FFFFFFFFFF|- rs2_val == 1099511627776<br>                                                                                                                   |[0x80001010]:clmulh t6, t5, t4<br> [0x80001014]:sd t6, 992(t1)<br>    |
| 152|[0x800036d0]<br>0x0000007FFFFFFFFF|- rs2_val == 549755813888<br>                                                                                                                    |[0x80001024]:clmulh t6, t5, t4<br> [0x80001028]:sd t6, 1000(t1)<br>   |
| 153|[0x800036d8]<br>0x0000003FFFFFFFFF|- rs2_val == 274877906944<br>                                                                                                                    |[0x80001038]:clmulh t6, t5, t4<br> [0x8000103c]:sd t6, 1008(t1)<br>   |
| 154|[0x800036e0]<br>0x0000001FFFFFFFFF|- rs2_val == 137438953472<br>                                                                                                                    |[0x8000104c]:clmulh t6, t5, t4<br> [0x80001050]:sd t6, 1016(t1)<br>   |
| 155|[0x800036e8]<br>0x0000000FFFFFFFFF|- rs2_val == 68719476736<br>                                                                                                                     |[0x80001060]:clmulh t6, t5, t4<br> [0x80001064]:sd t6, 1024(t1)<br>   |
| 156|[0x800036f0]<br>0x00000007FFFFFFFF|- rs2_val == 34359738368<br>                                                                                                                     |[0x80001074]:clmulh t6, t5, t4<br> [0x80001078]:sd t6, 1032(t1)<br>   |
| 157|[0x800036f8]<br>0x00000003FFFFFFFF|- rs2_val == 17179869184<br>                                                                                                                     |[0x80001088]:clmulh t6, t5, t4<br> [0x8000108c]:sd t6, 1040(t1)<br>   |
| 158|[0x80003700]<br>0x0000000000000000|- rs1_val == 1<br>                                                                                                                               |[0x80001098]:clmulh t6, t5, t4<br> [0x8000109c]:sd t6, 1048(t1)<br>   |
| 159|[0x80003708]<br>0x30E93EBBAEF01372|- rs1_val == 0x6af29145404fd8ed and rs2_val == 0x990e75eafff569c2 #nosat<br>                                                                     |[0x800010d8]:clmulh t6, t5, t4<br> [0x800010dc]:sd t6, 1056(t1)<br>   |
| 160|[0x80003710]<br>0x37FCDE5E559A1E22|- rs1_val == 0x6d23c0488a6019c1 and rs2_val == 0x860bdaad7447a088 #nosat<br>                                                                     |[0x80001120]:clmulh t6, t5, t4<br> [0x80001124]:sd t6, 1064(t1)<br>   |
| 161|[0x80003718]<br>0x04789A438BD464FC|- rs1_val == 0x1f7d946f17168ab3 and rs2_val == 0x66eae3d9bbb4f560 #nosat<br>                                                                     |[0x80001168]:clmulh t6, t5, t4<br> [0x8000116c]:sd t6, 1072(t1)<br>   |
| 162|[0x80003720]<br>0x0996D3184782EFDD|- rs1_val == 0xef1d54db32b81f27 and rs2_val == 0x1826a804284fe16c #nosat<br>                                                                     |[0x800011b0]:clmulh t6, t5, t4<br> [0x800011b4]:sd t6, 1080(t1)<br>   |
| 163|[0x80003728]<br>0x13CBF1D82678D546|- rs1_val == 0xb694de26ad9e5431 and rs2_val == 0x293f9f6071fad878 #nosat<br>                                                                     |[0x800011f8]:clmulh t6, t5, t4<br> [0x800011fc]:sd t6, 1088(t1)<br>   |
| 164|[0x80003730]<br>0x0C2B34E2D010E985|- rs1_val == 0x987daa20b858e304 and rs2_val == 0x1aa1beebefb902cb #nosat<br>                                                                     |[0x80001240]:clmulh t6, t5, t4<br> [0x80001244]:sd t6, 1096(t1)<br>   |
| 165|[0x80003738]<br>0x3DDD0163DB6378FA|- rs1_val == 0x79bb7c341d3110bc and rs2_val == 0x8678f5e3d272e229 #nosat<br>                                                                     |[0x80001288]:clmulh t6, t5, t4<br> [0x8000128c]:sd t6, 1104(t1)<br>   |
| 166|[0x80003740]<br>0x308F905CF4FE627B|- rs1_val == 0xe2eaf4a09869be8c and rs2_val == 0x5b730cad91766f62 #nosat<br>                                                                     |[0x800012d0]:clmulh t6, t5, t4<br> [0x800012d4]:sd t6, 1112(t1)<br>   |
| 167|[0x80003748]<br>0x75F1FC19980EC35D|- rs1_val == 0xc0fe15dd0df9564b and rs2_val == 0xb22bbf7eb4c858fb #nosat<br>                                                                     |[0x80001318]:clmulh t6, t5, t4<br> [0x8000131c]:sd t6, 1120(t1)<br>   |
| 168|[0x80003750]<br>0x14BFC772CF2FA34D|- rs1_val == 0x4113ee60952acffe and rs2_val == 0x53a66ed1dc80d916 #nosat<br>                                                                     |[0x80001360]:clmulh t6, t5, t4<br> [0x80001364]:sd t6, 1128(t1)<br>   |
| 169|[0x80003758]<br>0x2DF1FF739FC2FE9E|- rs1_val == 0x40a5ff526f38a9c7 and rs2_val == 0xb6f9706fb4f741aa #nosat<br>                                                                     |[0x800013a8]:clmulh t6, t5, t4<br> [0x800013ac]:sd t6, 1136(t1)<br>   |
| 170|[0x80003760]<br>0x629F73BD98FE004F|- rs1_val == 0x9bedfe390d6ddd9d and rs2_val == 0xd05668ae0fdb82bc #nosat<br>                                                                     |[0x800013f0]:clmulh t6, t5, t4<br> [0x800013f4]:sd t6, 1144(t1)<br>   |
| 171|[0x80003768]<br>0x767DEDF505D03A61|- rs1_val == 0xd75739f82ac177c6 and rs2_val == 0xaa6bb2bde9ed477d #nosat<br>                                                                     |[0x80001438]:clmulh t6, t5, t4<br> [0x8000143c]:sd t6, 1152(t1)<br>   |
| 172|[0x80003770]<br>0x1743CEA23A143B7D|- rs1_val == 0x9a4e9ef10171f4df and rs2_val == 0x299c3bcf90efb625 #nosat<br>                                                                     |[0x80001480]:clmulh t6, t5, t4<br> [0x80001484]:sd t6, 1160(t1)<br>   |
| 173|[0x80003778]<br>0x09F404DE68F22F4B|- rs1_val == 0xd169a3f8cad5e297 and rs2_val == 0x1fc493caa371db42 #nosat<br>                                                                     |[0x800014c8]:clmulh t6, t5, t4<br> [0x800014cc]:sd t6, 1168(t1)<br>   |
| 174|[0x80003780]<br>0x4B560A5810E82C2B|- rs1_val == 0xd5b9fe5cf69bdcf3 and rs2_val == 0xf4c30307672f666d #nosat<br>                                                                     |[0x80001510]:clmulh t6, t5, t4<br> [0x80001514]:sd t6, 1176(t1)<br>   |
| 175|[0x80003788]<br>0x6EEE003594B7E8C7|- rs1_val == 0xe4921bf73047c198 and rs2_val == 0xa0569d765ebc64cb #nosat<br>                                                                     |[0x80001558]:clmulh t6, t5, t4<br> [0x8000155c]:sd t6, 1184(t1)<br>   |
| 176|[0x80003790]<br>0x1B15633738B49FC3|- rs1_val == 0xfcc1b543c49cd65b and rs2_val == 0x2daf9ac7f5faf207 #nosat<br>                                                                     |[0x800015a0]:clmulh t6, t5, t4<br> [0x800015a4]:sd t6, 1192(t1)<br>   |
| 177|[0x80003798]<br>0x0D401E055FE88CB9|- rs1_val == 0x436f40f274b8de87 and rs2_val == 0x3459294ef273b44c #nosat<br>                                                                     |[0x800015e8]:clmulh t6, t5, t4<br> [0x800015ec]:sd t6, 1200(t1)<br>   |
| 178|[0x800037a0]<br>0x2600CF4CC98FCA73|- rs1_val == 0x75a3adb3254a9493 and rs2_val == 0xc5521660f3a3c571 #nosat<br>                                                                     |[0x80001630]:clmulh t6, t5, t4<br> [0x80001634]:sd t6, 1208(t1)<br>   |
| 179|[0x800037a8]<br>0x66666666666664CC|- rs2_val == 12297829382473034410<br>                                                                                                            |[0x8000165c]:clmulh t6, t5, t4<br> [0x80001660]:sd t6, 1216(t1)<br>   |
| 180|[0x800037b0]<br>0x3333333333333266|- rs2_val == 6148914691236517205<br>                                                                                                             |[0x80001688]:clmulh t6, t5, t4<br> [0x8000168c]:sd t6, 1224(t1)<br>   |
| 181|[0x800037b8]<br>0x66666666666664CC|- rs1_val == 12297829382473034410<br>                                                                                                            |[0x800016b4]:clmulh t6, t5, t4<br> [0x800016b8]:sd t6, 1232(t1)<br>   |
| 182|[0x800037c0]<br>0x3333333333333266|- rs1_val == 6148914691236517205<br>                                                                                                             |[0x800016e0]:clmulh t6, t5, t4<br> [0x800016e4]:sd t6, 1240(t1)<br>   |
| 183|[0x800037c8]<br>0x0000000000000000|- rs2_val == 4096<br> - rs1_val==0 and rs2_val==0x1000<br>                                                                                       |[0x800016f0]:clmulh t6, t5, t4<br> [0x800016f4]:sd t6, 1248(t1)<br>   |
| 184|[0x800037d0]<br>0x0000000000000000|- rs2_val == 1<br> - rs1_val==0 and rs2_val==1<br>                                                                                               |[0x80001700]:clmulh t6, t5, t4<br> [0x80001704]:sd t6, 1256(t1)<br>   |
| 185|[0x800037d8]<br>0x0000000000000000|- rs1_val==1 and rs2_val==0<br>                                                                                                                  |[0x80001710]:clmulh t6, t5, t4<br> [0x80001714]:sd t6, 1264(t1)<br>   |
| 186|[0x800037e0]<br>0x0000000000000000|- rs1_val==1 and rs2_val==0x1000<br>                                                                                                             |[0x80001720]:clmulh t6, t5, t4<br> [0x80001724]:sd t6, 1272(t1)<br>   |
| 187|[0x800037e8]<br>0x0000000000000000|- rs1_val==1 and rs2_val==1<br>                                                                                                                  |[0x80001730]:clmulh t6, t5, t4<br> [0x80001734]:sd t6, 1280(t1)<br>   |
| 188|[0x800037f0]<br>0x00000001FFFFFFFF|- rs2_val == 8589934592<br>                                                                                                                      |[0x80001744]:clmulh t6, t5, t4<br> [0x80001748]:sd t6, 1288(t1)<br>   |
| 189|[0x800037f8]<br>0x00000000FFFFFFFF|- rs2_val == 4294967296<br>                                                                                                                      |[0x80001758]:clmulh t6, t5, t4<br> [0x8000175c]:sd t6, 1296(t1)<br>   |
| 190|[0x80003800]<br>0x000000007FFFFFFF|- rs2_val == 2147483648<br>                                                                                                                      |[0x8000176c]:clmulh t6, t5, t4<br> [0x80001770]:sd t6, 1304(t1)<br>   |
| 191|[0x80003808]<br>0x000000003FFFFFFF|- rs2_val == 1073741824<br>                                                                                                                      |[0x8000177c]:clmulh t6, t5, t4<br> [0x80001780]:sd t6, 1312(t1)<br>   |
| 192|[0x80003810]<br>0x000000001FFFFFFF|- rs2_val == 536870912<br>                                                                                                                       |[0x8000178c]:clmulh t6, t5, t4<br> [0x80001790]:sd t6, 1320(t1)<br>   |
| 193|[0x80003818]<br>0x000000000FFFFFFF|- rs2_val == 268435456<br>                                                                                                                       |[0x8000179c]:clmulh t6, t5, t4<br> [0x800017a0]:sd t6, 1328(t1)<br>   |
| 194|[0x80003820]<br>0x0000000007FFFFFF|- rs2_val == 134217728<br>                                                                                                                       |[0x800017ac]:clmulh t6, t5, t4<br> [0x800017b0]:sd t6, 1336(t1)<br>   |
| 195|[0x80003828]<br>0x0000000003FFFFFF|- rs2_val == 67108864<br>                                                                                                                        |[0x800017bc]:clmulh t6, t5, t4<br> [0x800017c0]:sd t6, 1344(t1)<br>   |
| 196|[0x80003830]<br>0x0000000001FFFFFF|- rs2_val == 33554432<br>                                                                                                                        |[0x800017cc]:clmulh t6, t5, t4<br> [0x800017d0]:sd t6, 1352(t1)<br>   |
| 197|[0x80003838]<br>0x0000000000FFFFFF|- rs2_val == 16777216<br>                                                                                                                        |[0x800017dc]:clmulh t6, t5, t4<br> [0x800017e0]:sd t6, 1360(t1)<br>   |
| 198|[0x80003840]<br>0x00000000007FFFFF|- rs2_val == 8388608<br>                                                                                                                         |[0x800017ec]:clmulh t6, t5, t4<br> [0x800017f0]:sd t6, 1368(t1)<br>   |
| 199|[0x80003848]<br>0x00000000003FFFFF|- rs2_val == 4194304<br>                                                                                                                         |[0x800017fc]:clmulh t6, t5, t4<br> [0x80001800]:sd t6, 1376(t1)<br>   |
| 200|[0x80003850]<br>0x00000000001FFFFF|- rs2_val == 2097152<br>                                                                                                                         |[0x8000180c]:clmulh t6, t5, t4<br> [0x80001810]:sd t6, 1384(t1)<br>   |
| 201|[0x80003858]<br>0x00000000000FFFFF|- rs2_val == 1048576<br>                                                                                                                         |[0x8000181c]:clmulh t6, t5, t4<br> [0x80001820]:sd t6, 1392(t1)<br>   |
| 202|[0x80003860]<br>0x000000000007FFFF|- rs2_val == 524288<br>                                                                                                                          |[0x8000182c]:clmulh t6, t5, t4<br> [0x80001830]:sd t6, 1400(t1)<br>   |
| 203|[0x80003868]<br>0x000000000003FFFF|- rs2_val == 262144<br>                                                                                                                          |[0x8000183c]:clmulh t6, t5, t4<br> [0x80001840]:sd t6, 1408(t1)<br>   |
| 204|[0x80003870]<br>0x000000000001FFFF|- rs2_val == 131072<br>                                                                                                                          |[0x8000184c]:clmulh t6, t5, t4<br> [0x80001850]:sd t6, 1416(t1)<br>   |
| 205|[0x80003878]<br>0x000000000000FFFF|- rs2_val == 65536<br>                                                                                                                           |[0x8000185c]:clmulh t6, t5, t4<br> [0x80001860]:sd t6, 1424(t1)<br>   |
| 206|[0x80003880]<br>0x0000000000007FFF|- rs2_val == 32768<br>                                                                                                                           |[0x8000186c]:clmulh t6, t5, t4<br> [0x80001870]:sd t6, 1432(t1)<br>   |
| 207|[0x80003888]<br>0x0000000000003FFF|- rs2_val == 16384<br>                                                                                                                           |[0x8000187c]:clmulh t6, t5, t4<br> [0x80001880]:sd t6, 1440(t1)<br>   |
| 208|[0x80003890]<br>0x0000000000001FFF|- rs2_val == 8192<br>                                                                                                                            |[0x8000188c]:clmulh t6, t5, t4<br> [0x80001890]:sd t6, 1448(t1)<br>   |
| 209|[0x80003898]<br>0x00000000000007FF|- rs2_val == 2048<br>                                                                                                                            |[0x800018a0]:clmulh t6, t5, t4<br> [0x800018a4]:sd t6, 1456(t1)<br>   |
| 210|[0x800038a0]<br>0x00000000000003FF|- rs2_val == 1024<br>                                                                                                                            |[0x800018b0]:clmulh t6, t5, t4<br> [0x800018b4]:sd t6, 1464(t1)<br>   |
| 211|[0x800038a8]<br>0x00000000000001FF|- rs2_val == 512<br>                                                                                                                             |[0x800018c0]:clmulh t6, t5, t4<br> [0x800018c4]:sd t6, 1472(t1)<br>   |
| 212|[0x800038b0]<br>0x00000000000000FF|- rs2_val == 256<br>                                                                                                                             |[0x800018d0]:clmulh t6, t5, t4<br> [0x800018d4]:sd t6, 1480(t1)<br>   |
| 213|[0x800038b8]<br>0x000000000000007F|- rs2_val == 128<br>                                                                                                                             |[0x800018e0]:clmulh t6, t5, t4<br> [0x800018e4]:sd t6, 1488(t1)<br>   |
| 214|[0x800038c0]<br>0x000000000000003F|- rs2_val == 64<br>                                                                                                                              |[0x800018f0]:clmulh t6, t5, t4<br> [0x800018f4]:sd t6, 1496(t1)<br>   |
| 215|[0x800038c8]<br>0x000000000000001F|- rs2_val == 32<br>                                                                                                                              |[0x80001900]:clmulh t6, t5, t4<br> [0x80001904]:sd t6, 1504(t1)<br>   |
| 216|[0x800038d0]<br>0x000000000000000F|- rs2_val == 16<br>                                                                                                                              |[0x80001910]:clmulh t6, t5, t4<br> [0x80001914]:sd t6, 1512(t1)<br>   |
| 217|[0x800038d8]<br>0x0000000000000007|- rs2_val == 8<br>                                                                                                                               |[0x80001920]:clmulh t6, t5, t4<br> [0x80001924]:sd t6, 1520(t1)<br>   |
| 218|[0x800038e0]<br>0x0000000000000003|- rs2_val == 4<br>                                                                                                                               |[0x80001930]:clmulh t6, t5, t4<br> [0x80001934]:sd t6, 1528(t1)<br>   |
| 219|[0x800038e8]<br>0x0000000000000001|- rs2_val == 2<br>                                                                                                                               |[0x80001940]:clmulh t6, t5, t4<br> [0x80001944]:sd t6, 1536(t1)<br>   |
| 220|[0x800038f0]<br>0x7FFFFFFFFFFFFDFF|- rs1_val == 9223372036854775808<br>                                                                                                             |[0x80001954]:clmulh t6, t5, t4<br> [0x80001958]:sd t6, 1544(t1)<br>   |
| 221|[0x800038f8]<br>0x3FFFFFFFFFFFFEFF|- rs1_val == 4611686018427387904<br>                                                                                                             |[0x80001968]:clmulh t6, t5, t4<br> [0x8000196c]:sd t6, 1552(t1)<br>   |
| 222|[0x80003900]<br>0x1FFFFFFFFFFFFF7F|- rs1_val == 2305843009213693952<br>                                                                                                             |[0x8000197c]:clmulh t6, t5, t4<br> [0x80001980]:sd t6, 1560(t1)<br>   |
| 223|[0x80003908]<br>0x0FFFFFFFFFFFFFBF|- rs1_val == 1152921504606846976<br>                                                                                                             |[0x80001990]:clmulh t6, t5, t4<br> [0x80001994]:sd t6, 1568(t1)<br>   |
| 224|[0x80003910]<br>0x07FFFFFFFFFFFFDF|- rs1_val == 576460752303423488<br>                                                                                                              |[0x800019a4]:clmulh t6, t5, t4<br> [0x800019a8]:sd t6, 1576(t1)<br>   |
| 225|[0x80003918]<br>0x03FFFFFFFFFFFFEF|- rs1_val == 288230376151711744<br>                                                                                                              |[0x800019b8]:clmulh t6, t5, t4<br> [0x800019bc]:sd t6, 1584(t1)<br>   |
| 226|[0x80003920]<br>0x01FFFFFFFFFFFFF7|- rs1_val == 144115188075855872<br>                                                                                                              |[0x800019cc]:clmulh t6, t5, t4<br> [0x800019d0]:sd t6, 1592(t1)<br>   |
| 227|[0x80003928]<br>0x00FFFFFFFFFFFFFB|- rs1_val == 72057594037927936<br>                                                                                                               |[0x800019e0]:clmulh t6, t5, t4<br> [0x800019e4]:sd t6, 1600(t1)<br>   |
| 228|[0x80003930]<br>0x007FFFFFFFFFFFFD|- rs1_val == 36028797018963968<br>                                                                                                               |[0x800019f4]:clmulh t6, t5, t4<br> [0x800019f8]:sd t6, 1608(t1)<br>   |
| 229|[0x80003938]<br>0x003FFFFFFFFFFFFE|- rs1_val == 18014398509481984<br>                                                                                                               |[0x80001a08]:clmulh t6, t5, t4<br> [0x80001a0c]:sd t6, 1616(t1)<br>   |
| 230|[0x80003940]<br>0x001FFFFFFFFFFFFF|- rs1_val == 9007199254740992<br>                                                                                                                |[0x80001a1c]:clmulh t6, t5, t4<br> [0x80001a20]:sd t6, 1624(t1)<br>   |
| 231|[0x80003948]<br>0x000FFFFFFFFFFFFF|- rs1_val == 4503599627370496<br>                                                                                                                |[0x80001a30]:clmulh t6, t5, t4<br> [0x80001a34]:sd t6, 1632(t1)<br>   |
| 232|[0x80003950]<br>0x0007FFFFFFFFFFFF|- rs1_val == 2251799813685248<br>                                                                                                                |[0x80001a44]:clmulh t6, t5, t4<br> [0x80001a48]:sd t6, 1640(t1)<br>   |
| 233|[0x80003958]<br>0x0003FFFFFFFFFFFF|- rs1_val == 1125899906842624<br>                                                                                                                |[0x80001a58]:clmulh t6, t5, t4<br> [0x80001a5c]:sd t6, 1648(t1)<br>   |
| 234|[0x80003960]<br>0x0001FFFFFFFFFFFF|- rs1_val == 562949953421312<br>                                                                                                                 |[0x80001a6c]:clmulh t6, t5, t4<br> [0x80001a70]:sd t6, 1656(t1)<br>   |
| 235|[0x80003968]<br>0x0000FFFFFFFFFFFF|- rs1_val == 281474976710656<br>                                                                                                                 |[0x80001a80]:clmulh t6, t5, t4<br> [0x80001a84]:sd t6, 1664(t1)<br>   |
| 236|[0x80003970]<br>0x00007FFFFFFFFFFF|- rs1_val == 140737488355328<br>                                                                                                                 |[0x80001a94]:clmulh t6, t5, t4<br> [0x80001a98]:sd t6, 1672(t1)<br>   |
| 237|[0x80003978]<br>0x00003FFFFFFFFFFF|- rs1_val == 70368744177664<br>                                                                                                                  |[0x80001aa8]:clmulh t6, t5, t4<br> [0x80001aac]:sd t6, 1680(t1)<br>   |
| 238|[0x80003980]<br>0x00001FFFFFFFFFFF|- rs1_val == 35184372088832<br>                                                                                                                  |[0x80001abc]:clmulh t6, t5, t4<br> [0x80001ac0]:sd t6, 1688(t1)<br>   |
| 239|[0x80003988]<br>0x00000FFFFFFFFFFF|- rs1_val == 17592186044416<br>                                                                                                                  |[0x80001ad0]:clmulh t6, t5, t4<br> [0x80001ad4]:sd t6, 1696(t1)<br>   |
| 240|[0x80003990]<br>0x000007FFFFFFFFFF|- rs1_val == 8796093022208<br>                                                                                                                   |[0x80001ae4]:clmulh t6, t5, t4<br> [0x80001ae8]:sd t6, 1704(t1)<br>   |
| 241|[0x80003998]<br>0x000003FFFFFFFFFF|- rs1_val == 4398046511104<br>                                                                                                                   |[0x80001af8]:clmulh t6, t5, t4<br> [0x80001afc]:sd t6, 1712(t1)<br>   |
| 242|[0x800039a0]<br>0x000001FFFFFFFFFF|- rs1_val == 2199023255552<br>                                                                                                                   |[0x80001b0c]:clmulh t6, t5, t4<br> [0x80001b10]:sd t6, 1720(t1)<br>   |
| 243|[0x800039a8]<br>0x000000FFFFFFFFFF|- rs1_val == 1099511627776<br>                                                                                                                   |[0x80001b20]:clmulh t6, t5, t4<br> [0x80001b24]:sd t6, 1728(t1)<br>   |
| 244|[0x800039b0]<br>0x0000007FFFFFFFFF|- rs1_val == 549755813888<br>                                                                                                                    |[0x80001b34]:clmulh t6, t5, t4<br> [0x80001b38]:sd t6, 1736(t1)<br>   |
| 245|[0x800039b8]<br>0x0000003FFFFFFFFF|- rs1_val == 274877906944<br>                                                                                                                    |[0x80001b48]:clmulh t6, t5, t4<br> [0x80001b4c]:sd t6, 1744(t1)<br>   |
| 246|[0x800039c0]<br>0x0000001FFFFFFFFF|- rs1_val == 137438953472<br>                                                                                                                    |[0x80001b5c]:clmulh t6, t5, t4<br> [0x80001b60]:sd t6, 1752(t1)<br>   |
| 247|[0x800039c8]<br>0x0000000FFFFFFFFF|- rs1_val == 68719476736<br>                                                                                                                     |[0x80001b70]:clmulh t6, t5, t4<br> [0x80001b74]:sd t6, 1760(t1)<br>   |
| 248|[0x800039d0]<br>0x00000007FFFFFFFF|- rs1_val == 34359738368<br>                                                                                                                     |[0x80001b84]:clmulh t6, t5, t4<br> [0x80001b88]:sd t6, 1768(t1)<br>   |
| 249|[0x800039d8]<br>0x00000003FFFFFFFF|- rs1_val == 17179869184<br>                                                                                                                     |[0x80001b98]:clmulh t6, t5, t4<br> [0x80001b9c]:sd t6, 1776(t1)<br>   |
| 250|[0x800039e0]<br>0x00000001FFFFFFFF|- rs1_val == 8589934592<br>                                                                                                                      |[0x80001bac]:clmulh t6, t5, t4<br> [0x80001bb0]:sd t6, 1784(t1)<br>   |
| 251|[0x800039e8]<br>0x00000000FFFFFFFF|- rs1_val == 4294967296<br>                                                                                                                      |[0x80001bc0]:clmulh t6, t5, t4<br> [0x80001bc4]:sd t6, 1792(t1)<br>   |
| 252|[0x800039f0]<br>0x000000007FFFFFFF|- rs1_val == 2147483648<br>                                                                                                                      |[0x80001bd4]:clmulh t6, t5, t4<br> [0x80001bd8]:sd t6, 1800(t1)<br>   |
| 253|[0x800039f8]<br>0x000000003FFFFFFF|- rs1_val == 1073741824<br>                                                                                                                      |[0x80001be4]:clmulh t6, t5, t4<br> [0x80001be8]:sd t6, 1808(t1)<br>   |
| 254|[0x80003a00]<br>0x000000001FFFFFFF|- rs1_val == 536870912<br>                                                                                                                       |[0x80001bf4]:clmulh t6, t5, t4<br> [0x80001bf8]:sd t6, 1816(t1)<br>   |
| 255|[0x80003a08]<br>0x000000000FFFFFFF|- rs1_val == 268435456<br>                                                                                                                       |[0x80001c04]:clmulh t6, t5, t4<br> [0x80001c08]:sd t6, 1824(t1)<br>   |
| 256|[0x80003a10]<br>0x0000000007FFFFFF|- rs1_val == 134217728<br>                                                                                                                       |[0x80001c14]:clmulh t6, t5, t4<br> [0x80001c18]:sd t6, 1832(t1)<br>   |
| 257|[0x80003a18]<br>0x0000000003FFFFFF|- rs1_val == 67108864<br>                                                                                                                        |[0x80001c24]:clmulh t6, t5, t4<br> [0x80001c28]:sd t6, 1840(t1)<br>   |
| 258|[0x80003a20]<br>0x0000000001FFFFFF|- rs1_val == 33554432<br>                                                                                                                        |[0x80001c34]:clmulh t6, t5, t4<br> [0x80001c38]:sd t6, 1848(t1)<br>   |
| 259|[0x80003a28]<br>0x0000000000FFFFFF|- rs1_val == 16777216<br>                                                                                                                        |[0x80001c44]:clmulh t6, t5, t4<br> [0x80001c48]:sd t6, 1856(t1)<br>   |
| 260|[0x80003a30]<br>0x00000000007FFFFF|- rs1_val == 8388608<br>                                                                                                                         |[0x80001c54]:clmulh t6, t5, t4<br> [0x80001c58]:sd t6, 1864(t1)<br>   |
| 261|[0x80003a38]<br>0x00000000003FFFFF|- rs1_val == 4194304<br>                                                                                                                         |[0x80001c64]:clmulh t6, t5, t4<br> [0x80001c68]:sd t6, 1872(t1)<br>   |
| 262|[0x80003a40]<br>0x00000000001FFFFF|- rs1_val == 2097152<br>                                                                                                                         |[0x80001c74]:clmulh t6, t5, t4<br> [0x80001c78]:sd t6, 1880(t1)<br>   |
| 263|[0x80003a48]<br>0x00000000000FFFFF|- rs1_val == 1048576<br>                                                                                                                         |[0x80001c84]:clmulh t6, t5, t4<br> [0x80001c88]:sd t6, 1888(t1)<br>   |
| 264|[0x80003a50]<br>0x000000000007FFFF|- rs1_val == 524288<br>                                                                                                                          |[0x80001c94]:clmulh t6, t5, t4<br> [0x80001c98]:sd t6, 1896(t1)<br>   |
| 265|[0x80003a58]<br>0x000000000003FFFF|- rs1_val == 262144<br>                                                                                                                          |[0x80001ca4]:clmulh t6, t5, t4<br> [0x80001ca8]:sd t6, 1904(t1)<br>   |
| 266|[0x80003a60]<br>0x000000000001FFFF|- rs1_val == 131072<br>                                                                                                                          |[0x80001cb4]:clmulh t6, t5, t4<br> [0x80001cb8]:sd t6, 1912(t1)<br>   |
| 267|[0x80003a68]<br>0x000000000000FFFF|- rs1_val == 65536<br>                                                                                                                           |[0x80001cc4]:clmulh t6, t5, t4<br> [0x80001cc8]:sd t6, 1920(t1)<br>   |
| 268|[0x80003a70]<br>0x0000000000007FFF|- rs1_val == 32768<br>                                                                                                                           |[0x80001cd4]:clmulh t6, t5, t4<br> [0x80001cd8]:sd t6, 1928(t1)<br>   |
| 269|[0x80003a78]<br>0x0000000000003FFF|- rs1_val == 16384<br>                                                                                                                           |[0x80001ce4]:clmulh t6, t5, t4<br> [0x80001ce8]:sd t6, 1936(t1)<br>   |
| 270|[0x80003a80]<br>0x0000000000001FFF|- rs1_val == 8192<br>                                                                                                                            |[0x80001cf4]:clmulh t6, t5, t4<br> [0x80001cf8]:sd t6, 1944(t1)<br>   |
| 271|[0x80003a88]<br>0x0000000000000FFF|- rs1_val == 4096<br>                                                                                                                            |[0x80001d04]:clmulh t6, t5, t4<br> [0x80001d08]:sd t6, 1952(t1)<br>   |
| 272|[0x80003a90]<br>0x00000000000007FF|- rs1_val == 2048<br>                                                                                                                            |[0x80001d18]:clmulh t6, t5, t4<br> [0x80001d1c]:sd t6, 1960(t1)<br>   |
| 273|[0x80003a98]<br>0x00000000000003FF|- rs1_val == 1024<br>                                                                                                                            |[0x80001d28]:clmulh t6, t5, t4<br> [0x80001d2c]:sd t6, 1968(t1)<br>   |
| 274|[0x80003aa0]<br>0x00000000000001FF|- rs1_val == 512<br>                                                                                                                             |[0x80001d38]:clmulh t6, t5, t4<br> [0x80001d3c]:sd t6, 1976(t1)<br>   |
| 275|[0x80003aa8]<br>0x00000000000000FF|- rs1_val == 256<br>                                                                                                                             |[0x80001d48]:clmulh t6, t5, t4<br> [0x80001d4c]:sd t6, 1984(t1)<br>   |
| 276|[0x80003ab0]<br>0x000000000000007F|- rs1_val == 128<br>                                                                                                                             |[0x80001d58]:clmulh t6, t5, t4<br> [0x80001d5c]:sd t6, 1992(t1)<br>   |
| 277|[0x80003ab8]<br>0x000000000000003F|- rs1_val == 64<br>                                                                                                                              |[0x80001d68]:clmulh t6, t5, t4<br> [0x80001d6c]:sd t6, 2000(t1)<br>   |
| 278|[0x80003ac0]<br>0x000000000000001F|- rs1_val == 32<br>                                                                                                                              |[0x80001d78]:clmulh t6, t5, t4<br> [0x80001d7c]:sd t6, 2008(t1)<br>   |
| 279|[0x80003ac8]<br>0x000000000000000F|- rs1_val == 16<br>                                                                                                                              |[0x80001d88]:clmulh t6, t5, t4<br> [0x80001d8c]:sd t6, 2016(t1)<br>   |
| 280|[0x80003ad0]<br>0x0000000000000007|- rs1_val == 8<br>                                                                                                                               |[0x80001d98]:clmulh t6, t5, t4<br> [0x80001d9c]:sd t6, 2024(t1)<br>   |
| 281|[0x80003ad8]<br>0x0000000000000003|- rs1_val == 4<br>                                                                                                                               |[0x80001da8]:clmulh t6, t5, t4<br> [0x80001dac]:sd t6, 2032(t1)<br>   |
| 282|[0x80003ae8]<br>0x6AAAAAAAAAAAA855|- rs2_val == 13835058055282163711<br>                                                                                                            |[0x80001ddc]:clmulh t6, t5, t4<br> [0x80001de0]:sd t6, 0(t1)<br>      |
| 283|[0x80003af0]<br>0x5AAAAAAAAAAAA915|- rs2_val == 17293822569102704639<br>                                                                                                            |[0x80001dfc]:clmulh t6, t5, t4<br> [0x80001e00]:sd t6, 0(t1)<br>      |
| 284|[0x80003af8]<br>0x55555552AAAAA955|- rs2_val == 18446744039349813247<br>                                                                                                            |[0x80001e14]:clmulh t6, t5, t4<br> [0x80001e18]:sd t6, 8(t1)<br>      |
