--- Job _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms Start 10/22/24 16:47:09 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_f72_5rc/_4b1aed9c-da65-4075-a92f-3d3b94674a70.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_f72_5rc/_4b1aed9c-da65-4075-a92f-3d3b94674a70.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_f72_5rc/tmpi61qbxoi/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_f72_5rc/_4b1aed9c-da65-4075-a92f-3d3b94674a70.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_f72_5rc/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_f72_5rc/_4b1aed9c-da65-4075-a92f-3d3b94674a70out.gdx
    SolPrint 0
    PreviousWork 1
    gdxSymbols newOrChanged
Licensee: Academic User                                  G241015+0003Ac-GEN
          lucas.vivier@enpc.fr                                    GPA101374
          /Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt
          node:63860601                                                    
          Time-limited free academic license
          The evaluation period of the license will expire on Oct 10, 2025
Processor information: 1 socket(s), 8 core(s), and 8 thread(s) available
--- Starting compilation
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(67) 6 Mb
--- Starting execution: elapsed 0:00:00.002
--- Generating LP model stochastic_emission_cstr
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(252) 60 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(252) 69 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(296) 101 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(296) 116 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(351) 161 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(362) 164 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(384) 214 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(384) 215 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(406) 216 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(406) 217 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(406) 221 Mb
--- _4b1aed9c-da65-4075-a92f-3d3b94674a70.gms(406) 223 Mb
---   840,959 rows  420,485 columns  2,456,941 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 4.955E-01, 6.672E+05] - Zero values observed as well
--- Bound     [min, max] : [        NA,        NA] - Zero values observed as well
--- Matrix    [min, max] : [ 6.125E-04, 7.884E+03]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:01.894

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 41.83 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 255.26 Mb (peak 258.47 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 17.64 Mb (peak 95.81 Mb)
--- Starting Cplex

Version identifier: 22.1.1.0 | 2022-11-28 | 9160aff4d
CPXPARAM_Advance                                 0
CPXPARAM_MIP_Display                             4
CPXPARAM_MIP_Pool_Capacity                       0
CPXPARAM_MIP_Tolerances_AbsMIPGap                0
Parallel mode: deterministic, using up to 8 threads for concurrent optimization:
 * Starting dual Simplex on 1 thread...
 * Starting Barrier on 6 threads...
 * Starting primal Simplex on 1 thread...
Tried aggregator 1 time.
LP Presolve eliminated 290242 rows and 118760 columns.
Aggregator did 26286 substitutions.
Reduced LP has 524430 rows, 275439 columns, and 1468149 nonzeros.
Presolve time = 6.16 sec. (5437.52 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =             0.000000
Perturbation started.
Iteration:   101   Dual objective     =             0.000000
Iteration:   719   Dual objective     =             1.980343
Iteration:  1349   Dual objective     =            44.665895
Iteration:  3462   Dual objective     =            81.665361
Iteration:  5865   Dual objective     =            87.973022
Iteration:  8314   Dual objective     =            89.326063
Iteration: 10745   Dual objective     =            90.504544
Iteration: 13174   Dual objective     =            93.646778
Iteration: 14701   Dual objective     =            95.472258
Iteration: 17200   Dual objective     =            95.494985
Iteration: 19684   Dual objective     =            96.114981
Iteration: 22179   Dual objective     =            96.932504
Iteration: 24678   Dual objective     =            98.476680
Iteration: 27533   Dual objective     =           103.851780
Iteration: 30853   Dual objective     =           104.093370
Iteration: 34117   Dual objective     =           104.252761
Iteration: 37137   Dual objective     =           104.617891
Iteration: 39284   Dual objective     =           105.553878
Iteration: 41877   Dual objective     =           110.432237
Iteration: 45448   Dual objective     =           115.041536
Iteration: 49860   Dual objective     =           115.116066
Elapsed time = 8.71 sec. (10002.79 ticks, 49876 iterations)
Iteration: 54365   Dual objective     =           115.281224
Iteration: 58808   Dual objective     =           115.287709
Iteration: 63058   Dual objective     =           115.287912
Iteration: 67472   Dual objective     =           115.289240
Iteration: 70925   Dual objective     =           115.289402
Iteration: 74378   Dual objective     =           115.312503
Iteration: 77874   Dual objective     =           115.312666
Iteration: 81362   Dual objective     =           115.313844
Iteration: 84866   Dual objective     =           115.315980
Iteration: 88367   Dual objective     =           115.318047
Iteration: 91815   Dual objective     =           115.344713
Iteration: 94939   Dual objective     =           115.362890
Iteration: 97566   Dual objective     =           115.369518
Iteration: 100072   Dual objective     =           115.372400
Iteration: 100909   Dual objective     =           115.498231
Iteration: 103714   Dual objective     =           115.507447
Iteration: 105443   Dual objective     =           116.783158
Elapsed time = 17.66 sec. (20003.43 ticks, 106214 iterations)
Iteration: 107169   Dual objective     =           119.287361
Iteration: 108320   Dual objective     =           120.772784
Iteration: 109277   Dual objective     =           121.923932
Iteration: 110025   Dual objective     =           122.986891
Elapsed time = 29.44 sec. (30016.75 ticks, 110596 iterations)
Iteration: 110761   Dual objective     =           124.507625
Iteration: 111542   Dual objective     =           125.701838
Iteration: 112519   Dual objective     =           126.629641
Iteration: 115248   Dual objective     =           126.631840
Iteration: 116722   Dual objective     =           126.946624
Elapsed time = 38.34 sec. (40016.82 ticks, 119090 iterations)
Iteration: 119740   Dual objective     =           126.946829
Iteration: 122362   Dual objective     =           126.947126
Iteration: 125055   Dual objective     =           126.947276
Iteration: 127144   Dual objective     =           126.949058
Elapsed time = 49.98 sec. (50020.84 ticks, 129497 iterations)
Iteration: 129497   Dual objective     =           126.949262
Iteration: 131987   Dual objective     =           126.949445
Iteration: 132821   Dual objective     =           127.184652
Iteration: 133575   Dual objective     =           127.989544
Iteration: 134989   Dual objective     =           128.670575
Iteration: 136370   Dual objective     =           129.363828
Iteration: 137864   Dual objective     =           130.511648
Elapsed time = 59.76 sec. (60021.90 ticks, 138096 iterations)
Iteration: 139065   Dual objective     =           131.848792
Iteration: 140941   Dual objective     =           132.904220
Iteration: 141965   Dual objective     =           134.022128
Iteration: 143048   Dual objective     =           134.735889
Iteration: 144008   Dual objective     =           135.986324
Iteration: 144910   Dual objective     =           137.133883
Iteration: 146400   Dual objective     =           140.270050
Elapsed time = 70.10 sec. (70022.44 ticks, 146721 iterations)
Iteration: 147193   Dual objective     =           142.713584
Iteration: 148795   Dual objective     =           143.424592
Iteration: 149585   Dual objective     =           145.047422
Iteration: 150696   Dual objective     =           147.784332
Iteration: 151527   Dual objective     =           150.005522
Elapsed time = 80.02 sec. (80023.39 ticks, 151571 iterations)
Iteration: 152437   Dual objective     =           151.580653
Markowitz threshold set to 0.1
Iteration: 153706   Dual objective     =           152.229099
Iteration: 154600   Dual objective     =           154.296578
Iteration: 156363   Dual objective     =           154.432828
Iteration: 156640   Dual objective     =           154.650418
Iteration: 158377   Dual objective     =           156.185480
Elapsed time = 88.47 sec. (90028.71 ticks, 158437 iterations)
Iteration: 159613   Dual objective     =           157.271590
Iteration: 161095   Dual objective     =           159.418503
Iteration: 161981   Dual objective     =           161.535804
Iteration: 163042   Dual objective     =           163.396637
Elapsed time = 96.47 sec. (100029.93 ticks, 163465 iterations)
Iteration: 164037   Dual objective     =           164.310548
Iteration: 165774   Dual objective     =           165.517558
Iteration: 166648   Dual objective     =           167.643315
Iteration: 168600   Dual objective     =           168.430968
Elapsed time = 102.86 sec. (110029.97 ticks, 169332 iterations)
Iteration: 170402   Dual objective     =           168.730129
Iteration: 171550   Dual objective     =           169.910313
Iteration: 171748   Dual objective     =           170.326829
Iteration: 173058   Dual objective     =           173.255702
Elapsed time = 109.76 sec. (120035.51 ticks, 173881 iterations)
Iteration: 174136   Dual objective     =           175.478448
Iteration: 174886   Dual objective     =           176.615160
Elapsed time = 115.89 sec. (130046.55 ticks, 175377 iterations)
Iteration: 175543   Dual objective     =           181.264087
Iteration: 176128   Dual objective     =           184.164857
Elapsed time = 123.68 sec. (140059.83 ticks, 176465 iterations)
Iteration: 176770   Dual objective     =           185.177369
Iteration: 177333   Dual objective     =           186.332856
Elapsed time = 132.01 sec. (150064.39 ticks, 177485 iterations)
Iteration: 177918   Dual objective     =           188.125189
Iteration: 178417   Dual objective     =           189.729232
Elapsed time = 139.62 sec. (160069.09 ticks, 178419 iterations)
Iteration: 178957   Dual objective     =           190.892567
Elapsed time = 147.83 sec. (170069.91 ticks, 179333 iterations)
Iteration: 179505   Dual objective     =           192.200469
Iteration: 180135   Dual objective     =           193.508680
Elapsed time = 155.76 sec. (180074.06 ticks, 180368 iterations)
Iteration: 180708   Dual objective     =           195.036841
Iteration: 181310   Dual objective     =           196.556207
Elapsed time = 164.24 sec. (190078.87 ticks, 181458 iterations)
Iteration: 181882   Dual objective     =           197.985788
Iteration: 182498   Dual objective     =           200.282942
Elapsed time = 173.03 sec. (200079.98 ticks, 182833 iterations)
Iteration: 183225   Dual objective     =           200.849408
Iteration: 183962   Dual objective     =           202.403673
Elapsed time = 182.48 sec. (210089.69 ticks, 184331 iterations)
Iteration: 184596   Dual objective     =           204.016754
Iteration: 185432   Dual objective     =           208.585558
Iteration: 186451   Dual objective     =           212.148778
Elapsed time = 192.97 sec. (220102.61 ticks, 186702 iterations)
Iteration: 187171   Dual objective     =           217.222181
Iteration: 188324   Dual objective     =           219.493943
Iteration: 189509   Dual objective     =           220.115047
Elapsed time = 204.63 sec. (230103.08 ticks, 189623 iterations)
Iteration: 190254   Dual objective     =           224.747294
Iteration: 190989   Dual objective     =           226.059169
Elapsed time = 214.57 sec. (240104.47 ticks, 191414 iterations)
Iteration: 191705   Dual objective     =           227.869187
Iteration: 192358   Dual objective     =           229.698468
Elapsed time = 224.29 sec. (250117.94 ticks, 192964 iterations)
Iteration: 193142   Dual objective     =           230.695982
Iteration: 193839   Dual objective     =           231.823266
Elapsed time = 234.16 sec. (260707.36 ticks, 194701 iterations)
Iteration: 194701   Dual objective     =           234.194953
Iteration: 195465   Dual objective     =           248.915651
Iteration: 196114   Dual objective     =           254.215999
Elapsed time = 243.53 sec. (270716.68 ticks, 196213 iterations)
Iteration: 196807   Dual objective     =           259.572396
Iteration: 197871   Dual objective     =           263.039271
Elapsed time = 252.52 sec. (280720.76 ticks, 198283 iterations)
Iteration: 198543   Dual objective     =           265.820617
Iteration: 199322   Dual objective     =           268.166751
Elapsed time = 261.88 sec. (290727.98 ticks, 199968 iterations)
Iteration: 199993   Dual objective     =           270.410220
Iteration: 200747   Dual objective     =           275.233785
Iteration: 201569   Dual objective     =           278.161164
Elapsed time = 272.11 sec. (300729.12 ticks, 201721 iterations)
Iteration: 202256   Dual objective     =           290.188662
Iteration: 202887   Dual objective     =           292.952195
Elapsed time = 280.99 sec. (310737.91 ticks, 203223 iterations)
Iteration: 203832   Dual objective     =           295.140720
Iteration: 204580   Dual objective     =           296.972288
Elapsed time = 291.50 sec. (321131.90 ticks, 205340 iterations)
Iteration: 205340   Dual objective     =           299.648441
Iteration: 206075   Dual objective     =           301.692125
Iteration: 206772   Dual objective     =           303.158619
Elapsed time = 300.66 sec. (331139.45 ticks, 206998 iterations)
Iteration: 207696   Dual objective     =           304.552593
Iteration: 208437   Dual objective     =           306.147560
Elapsed time = 310.98 sec. (341152.71 ticks, 208863 iterations)
Iteration: 209065   Dual objective     =           310.045211
Iteration: 209730   Dual objective     =           313.123156
Elapsed time = 319.82 sec. (351156.27 ticks, 210298 iterations)
Iteration: 210402   Dual objective     =           315.146021
Iteration: 211010   Dual objective     =           316.889682
Elapsed time = 328.12 sec. (361158.46 ticks, 211513 iterations)
Iteration: 211830   Dual objective     =           318.841318
Iteration: 212441   Dual objective     =           322.516481
Elapsed time = 337.22 sec. (371175.68 ticks, 213010 iterations)
Iteration: 213049   Dual objective     =           326.612582
Iteration: 213686   Dual objective     =           328.431963
Elapsed time = 345.62 sec. (381685.71 ticks, 214546 iterations)
Iteration: 214546   Dual objective     =           329.513753
Iteration: 215213   Dual objective     =           331.971282
Iteration: 215960   Dual objective     =           333.741580
Elapsed time = 354.49 sec. (391688.67 ticks, 216142 iterations)
Iteration: 216918   Dual objective     =           336.048886
Iteration: 217746   Dual objective     =           337.835207
Elapsed time = 365.62 sec. (401694.56 ticks, 218297 iterations)
Iteration: 218421   Dual objective     =           341.497177
Iteration: 219084   Dual objective     =           343.996377
Elapsed time = 374.57 sec. (411698.21 ticks, 219731 iterations)
Iteration: 219802   Dual objective     =           346.417526
Iteration: 222253   Dual objective     =           347.737285
Iteration: 223383   Dual objective     =           348.730556
Elapsed time = 381.97 sec. (421710.02 ticks, 223553 iterations)
Iteration: 224137   Dual objective     =           350.374248
Iteration: 225050   Dual objective     =           351.592343
Elapsed time = 390.16 sec. (431713.35 ticks, 225750 iterations)
Iteration: 226149   Dual objective     =           352.504701
Iteration: 227037   Dual objective     =           353.489928
Elapsed time = 398.47 sec. (441713.99 ticks, 227509 iterations)
Iteration: 227754   Dual objective     =           355.218781
Iteration: 228393   Dual objective     =           357.019396
Elapsed time = 406.90 sec. (451722.78 ticks, 228804 iterations)
Iteration: 229001   Dual objective     =           359.551164
Iteration: 229621   Dual objective     =           361.629237
Elapsed time = 415.49 sec. (461732.66 ticks, 230305 iterations)
Iteration: 230411   Dual objective     =           364.631846
Iteration: 231079   Dual objective     =           366.624527
Elapsed time = 423.96 sec. (472381.48 ticks, 231770 iterations)
Iteration: 231770   Dual objective     =           369.101419
Iteration: 233307   Dual objective     =           372.137941
Iteration: 234408   Dual objective     =           376.229865
Elapsed time = 431.31 sec. (482386.38 ticks, 234668 iterations)
Iteration: 236189   Dual objective     =           376.674778
Iteration: 237280   Dual objective     =           377.585002
Elapsed time = 445.02 sec. (492388.78 ticks, 237694 iterations)
Iteration: 238061   Dual objective     =           380.532893
Iteration: 238799   Dual objective     =           382.909938
Elapsed time = 452.01 sec. (502392.30 ticks, 239111 iterations)
Iteration: 239392   Dual objective     =           385.651750
Iteration: 240115   Dual objective     =           387.105482
Elapsed time = 459.24 sec. (512398.46 ticks, 240580 iterations)
Iteration: 240826   Dual objective     =           388.634180
Iteration: 241413   Dual objective     =           393.370589
Elapsed time = 466.67 sec. (522399.93 ticks, 241772 iterations)
Iteration: 242098   Dual objective     =           395.367196
Iteration: 242755   Dual objective     =           397.651452
Elapsed time = 474.60 sec. (532400.00 ticks, 243027 iterations)
Iteration: 243511   Dual objective     =           399.680214
Iteration: 244340   Dual objective     =           401.813082
Elapsed time = 481.28 sec. (542400.45 ticks, 244587 iterations)
Iteration: 245042   Dual objective     =           403.824716
Iteration: 245744   Dual objective     =           405.310456
Elapsed time = 488.56 sec. (552403.27 ticks, 245890 iterations)
Iteration: 246496   Dual objective     =           407.291204
Iteration: 247223   Dual objective     =           408.763617
Elapsed time = 495.40 sec. (562408.37 ticks, 247345 iterations)
Iteration: 247900   Dual objective     =           412.757925
Iteration: 248619   Dual objective     =           414.613678
Elapsed time = 502.33 sec. (572412.23 ticks, 248624 iterations)
Iteration: 249229   Dual objective     =           417.564567
Elapsed time = 508.66 sec. (582412.61 ticks, 250018 iterations)
Iteration: 250086   Dual objective     =           419.725876
Iteration: 250741   Dual objective     =           421.709966
Elapsed time = 514.86 sec. (592415.69 ticks, 251240 iterations)
Iteration: 251482   Dual objective     =           424.402602
Iteration: 252145   Dual objective     =           428.337128
Elapsed time = 521.25 sec. (602416.55 ticks, 253036 iterations)
Iteration: 253334   Dual objective     =           430.217643
Iteration: 253988   Dual objective     =           432.697028
Elapsed time = 527.80 sec. (612419.57 ticks, 254390 iterations)
Iteration: 254712   Dual objective     =           435.468497
Iteration: 255487   Dual objective     =           436.583050
Elapsed time = 534.65 sec. (622420.55 ticks, 255918 iterations)
Iteration: 256186   Dual objective     =           439.711616
Iteration: 256974   Dual objective     =           441.413916
Elapsed time = 541.62 sec. (632430.47 ticks, 257354 iterations)
Iteration: 257556   Dual objective     =           443.068826
Iteration: 258451   Dual objective     =           444.808833
Elapsed time = 548.25 sec. (642432.12 ticks, 258835 iterations)
Iteration: 259470   Dual objective     =           445.983174
Iteration: 260390   Dual objective     =           447.297898
Elapsed time = 555.75 sec. (652432.98 ticks, 260902 iterations)
Iteration: 261192   Dual objective     =           449.127230
Iteration: 261963   Dual objective     =           449.128229
Iteration: 262974   Dual objective     =           450.133403
Elapsed time = 563.66 sec. (662434.65 ticks, 263573 iterations)
Iteration: 263746   Dual objective     =           451.980457
Iteration: 265068   Dual objective     =           452.737769
Elapsed time = 570.47 sec. (672716.53 ticks, 265848 iterations)
Iteration: 265848   Dual objective     =           454.138719
Iteration: 266528   Dual objective     =           456.166141
Iteration: 267344   Dual objective     =           457.710026
Elapsed time = 578.75 sec. (682717.34 ticks, 267432 iterations)
Iteration: 268150   Dual objective     =           459.218367
Iteration: 269101   Dual objective     =           459.710589
Elapsed time = 590.87 sec. (692718.60 ticks, 269563 iterations)
Iteration: 269934   Dual objective     =           463.579804
Iteration: 270589   Dual objective     =           465.553429
Elapsed time = 600.12 sec. (702720.02 ticks, 271301 iterations)
Iteration: 271400   Dual objective     =           467.683577
Iteration: 272498   Dual objective     =           468.103468
Iteration: 273197   Dual objective     =           469.981849
Elapsed time = 610.25 sec. (712733.56 ticks, 273527 iterations)
Iteration: 273912   Dual objective     =           471.039130
Iteration: 274651   Dual objective     =           473.082219
Elapsed time = 618.50 sec. (722735.64 ticks, 275112 iterations)
Iteration: 275377   Dual objective     =           474.540871
Iteration: 276151   Dual objective     =           475.774276
Elapsed time = 627.91 sec. (732741.96 ticks, 276899 iterations)
Iteration: 276930   Dual objective     =           476.921740
Iteration: 277597   Dual objective     =           478.767656
Iteration: 278322   Dual objective     =           481.163766
Elapsed time = 636.69 sec. (742744.41 ticks, 278378 iterations)
Iteration: 279069   Dual objective     =           482.126483
Iteration: 279835   Dual objective     =           483.107926
Elapsed time = 646.21 sec. (752753.50 ticks, 280108 iterations)
Iteration: 280439   Dual objective     =           485.982289
Iteration: 281178   Dual objective     =           487.697091
Elapsed time = 654.94 sec. (762765.25 ticks, 281684 iterations)
Iteration: 281898   Dual objective     =           489.713438
Iteration: 282520   Dual objective     =           491.960694
Elapsed time = 663.91 sec. (772766.10 ticks, 283188 iterations)
Iteration: 283367   Dual objective     =           493.906819
Iteration: 284347   Dual objective     =           495.308942
Iteration: 285164   Dual objective     =           496.284851
Elapsed time = 672.88 sec. (782774.35 ticks, 285304 iterations)
Iteration: 285970   Dual objective     =           497.479852
Iteration: 286620   Dual objective     =           499.453250
Elapsed time = 682.23 sec. (792774.73 ticks, 286965 iterations)
Iteration: 287306   Dual objective     =           501.408316
Iteration: 288799   Dual objective     =           501.761311
Iteration: 290689   Dual objective     =           501.930411
Elapsed time = 693.90 sec. (802775.72 ticks, 290765 iterations)
Iteration: 291482   Dual objective     =           503.424331
Iteration: 292402   Dual objective     =           504.319848
Elapsed time = 704.24 sec. (812778.41 ticks, 292824 iterations)
Iteration: 293159   Dual objective     =           505.777949
Iteration: 293953   Dual objective     =           506.926611
Elapsed time = 713.68 sec. (822779.03 ticks, 294622 iterations)
Iteration: 294756   Dual objective     =           508.389878
Iteration: 295492   Dual objective     =           510.707133
Iteration: 296216   Dual objective     =           511.798243
Elapsed time = 721.99 sec. (832784.47 ticks, 296251 iterations)
Iteration: 296924   Dual objective     =           513.341375
Elapsed time = 729.99 sec. (843303.54 ticks, 297516 iterations)
Iteration: 297516   Dual objective     =           515.600835
Iteration: 298298   Dual objective     =           516.809339
Iteration: 299099   Dual objective     =           517.675051
Elapsed time = 739.40 sec. (853303.62 ticks, 300311 iterations)
Iteration: 301010   Dual objective     =           518.252712
Iteration: 302013   Dual objective     =           519.488495
Iteration: 302782   Dual objective     =           520.791185
Elapsed time = 747.72 sec. (863306.90 ticks, 302800 iterations)
Iteration: 303480   Dual objective     =           523.164884
Iteration: 304210   Dual objective     =           524.358291
Elapsed time = 755.96 sec. (873307.86 ticks, 304401 iterations)
Iteration: 304877   Dual objective     =           526.361755
Iteration: 305675   Dual objective     =           527.654471
Elapsed time = 763.59 sec. (883313.47 ticks, 305846 iterations)
Iteration: 306289   Dual objective     =           529.990442
Iteration: 307403   Dual objective     =           530.715096
Elapsed time = 773.41 sec. (893320.84 ticks, 307843 iterations)
Iteration: 308047   Dual objective     =           532.938042
Iteration: 308665   Dual objective     =           534.538688
Elapsed time = 781.73 sec. (903321.97 ticks, 309200 iterations)
Iteration: 309360   Dual objective     =           536.363665
Iteration: 310088   Dual objective     =           538.031963
Elapsed time = 790.33 sec. (913327.00 ticks, 310812 iterations)
Iteration: 310844   Dual objective     =           539.500850
Iteration: 311740   Dual objective     =           540.874657
Elapsed time = 798.91 sec. (923352.33 ticks, 312855 iterations)
Iteration: 312855   Dual objective     =           541.666498
Iteration: 314266   Dual objective     =           542.858355
Iteration: 314901   Dual objective     =           545.427246
Elapsed time = 808.77 sec. (933352.41 ticks, 315183 iterations)
Iteration: 315612   Dual objective     =           546.807215
Iteration: 316210   Dual objective     =           549.338036
Elapsed time = 816.78 sec. (943365.84 ticks, 316453 iterations)
Iteration: 316860   Dual objective     =           550.947469
Iteration: 317609   Dual objective     =           552.950298
Elapsed time = 825.33 sec. (953373.10 ticks, 317955 iterations)
Iteration: 318295   Dual objective     =           554.789512
Iteration: 319120   Dual objective     =           556.384454
Elapsed time = 834.28 sec. (963733.61 ticks, 319949 iterations)
Iteration: 319949   Dual objective     =           558.298779
Iteration: 320599   Dual objective     =           561.056125
Iteration: 321327   Dual objective     =           563.247566
Elapsed time = 841.75 sec. (973735.17 ticks, 321475 iterations)
Iteration: 322023   Dual objective     =           564.734501
Iteration: 323372   Dual objective     =           565.337477
Elapsed time = 849.37 sec. (983735.62 ticks, 323893 iterations)
Iteration: 323995   Dual objective     =           567.323761
Iteration: 324848   Dual objective     =           568.215899
Iteration: 326630   Dual objective     =           568.819805
Elapsed time = 859.26 sec. (993736.79 ticks, 326794 iterations)
Iteration: 327511   Dual objective     =           570.058722
Iteration: 328326   Dual objective     =           571.304467
Elapsed time = 869.10 sec. (1003737.57 ticks, 329109 iterations)
Iteration: 329173   Dual objective     =           573.003303
Iteration: 330267   Dual objective     =           573.377941
Iteration: 330966   Dual objective     =           574.935486
Elapsed time = 878.11 sec. (1013738.38 ticks, 331323 iterations)
Iteration: 332403   Dual objective     =           575.455535
Iteration: 333375   Dual objective     =           577.129575
Iteration: 334786   Dual objective     =           579.621579
Elapsed time = 886.90 sec. (1023743.62 ticks, 335098 iterations)
Iteration: 335754   Dual objective     =           580.758088
Iteration: 336636   Dual objective     =           582.347548
Elapsed time = 895.43 sec. (1033743.76 ticks, 337406 iterations)
Iteration: 337476   Dual objective     =           583.405556
Iteration: 338202   Dual objective     =           584.726781
Iteration: 338966   Dual objective     =           585.499672
Elapsed time = 903.54 sec. (1043750.31 ticks, 339168 iterations)
Iteration: 339692   Dual objective     =           586.606842
Iteration: 340348   Dual objective     =           588.128208
Elapsed time = 911.71 sec. (1053756.21 ticks, 340713 iterations)
Iteration: 341041   Dual objective     =           589.312004
Iteration: 341673   Dual objective     =           590.744921
Elapsed time = 918.98 sec. (1063756.70 ticks, 342040 iterations)
Iteration: 342276   Dual objective     =           592.116412
Iteration: 342952   Dual objective     =           593.756905
Elapsed time = 927.16 sec. (1073768.97 ticks, 343684 iterations)
Iteration: 343730   Dual objective     =           594.394130
Iteration: 344590   Dual objective     =           594.884161
Iteration: 345303   Dual objective     =           595.627716
Elapsed time = 935.45 sec. (1083779.54 ticks, 345451 iterations)
Iteration: 346011   Dual objective     =           596.826150
Iteration: 346531   Dual objective     =           598.784515
Elapsed time = 942.93 sec. (1093782.65 ticks, 346911 iterations)
Iteration: 347410   Dual objective     =           599.756554
Iteration: 348381   Dual objective     =           600.664006
Elapsed time = 951.00 sec. (1104396.58 ticks, 349245 iterations)
Iteration: 349245   Dual objective     =           601.313394
Iteration: 350063   Dual objective     =           602.003744
Iteration: 350764   Dual objective     =           602.876091
Elapsed time = 959.51 sec. (1114396.73 ticks, 351289 iterations)
Iteration: 351661   Dual objective     =           603.400621
Iteration: 352352   Dual objective     =           604.891997
Elapsed time = 967.82 sec. (1124404.47 ticks, 352856 iterations)
Iteration: 352958   Dual objective     =           606.758219
Iteration: 353756   Dual objective     =           607.066970
Elapsed time = 976.04 sec. (1134691.03 ticks, 354360 iterations)
Iteration: 354360   Dual objective     =           608.888998
Iteration: 355029   Dual objective     =           610.232257
Iteration: 355840   Dual objective     =           611.135001
Elapsed time = 984.64 sec. (1144692.40 ticks, 356136 iterations)
Iteration: 356625   Dual objective     =           611.835431
Iteration: 357289   Dual objective     =           613.577010
Elapsed time = 992.27 sec. (1154704.02 ticks, 357869 iterations)
Iteration: 358141   Dual objective     =           614.008760
Iteration: 359017   Dual objective     =           614.629130
Iteration: 360083   Dual objective     =           614.793509
Elapsed time = 1001.35 sec. (1164717.29 ticks, 360424 iterations)
Iteration: 360691   Dual objective     =           616.653648
Iteration: 361312   Dual objective     =           618.650314
Elapsed time = 1008.54 sec. (1174718.12 ticks, 361544 iterations)
Iteration: 361994   Dual objective     =           619.865937
Iteration: 362627   Dual objective     =           621.518406
Elapsed time = 1015.69 sec. (1184719.03 ticks, 362852 iterations)
Iteration: 363415   Dual objective     =           622.113178
Iteration: 364101   Dual objective     =           623.908920
Elapsed time = 1023.06 sec. (1194724.67 ticks, 364422 iterations)
Iteration: 364810   Dual objective     =           625.591881
Iteration: 365941   Dual objective     =           626.219661
Elapsed time = 1029.72 sec. (1205380.05 ticks, 367033 iterations)
Iteration: 367033   Dual objective     =           627.744592
Iteration: 368393   Dual objective     =           628.620008
Iteration: 369545   Dual objective     =           628.958393
Iteration: 370640   Dual objective     =           629.204265
Elapsed time = 1036.01 sec. (1215381.60 ticks, 370744 iterations)
Iteration: 371235   Dual objective     =           630.919547
Elapsed time = 1043.67 sec. (1225999.43 ticks, 371818 iterations)
Iteration: 371818   Dual objective     =           632.698389
Iteration: 372555   Dual objective     =           633.353839
Iteration: 373142   Dual objective     =           635.172609
Elapsed time = 1051.10 sec. (1236001.25 ticks, 373493 iterations)
Iteration: 373818   Dual objective     =           636.153562
Iteration: 374428   Dual objective     =           638.001334
Elapsed time = 1058.01 sec. (1246003.18 ticks, 374817 iterations)
Iteration: 375183   Dual objective     =           638.700465
Iteration: 375778   Dual objective     =           639.430455
Elapsed time = 1065.07 sec. (1256006.44 ticks, 376126 iterations)
Iteration: 376358   Dual objective     =           641.306224
Iteration: 377109   Dual objective     =           642.295319
Elapsed time = 1072.03 sec. (1266017.44 ticks, 377504 iterations)
Iteration: 377684   Dual objective     =           644.045628
Iteration: 378506   Dual objective     =           644.769681
Elapsed time = 1079.19 sec. (1276028.57 ticks, 378940 iterations)
Iteration: 379041   Dual objective     =           646.988741
Iteration: 379638   Dual objective     =           648.547213
Elapsed time = 1085.57 sec. (1286032.67 ticks, 379782 iterations)
Iteration: 380210   Dual objective     =           650.799567
Iteration: 381313   Dual objective     =           651.295813
Elapsed time = 1092.39 sec. (1296036.09 ticks, 381719 iterations)
Iteration: 381952   Dual objective     =           652.997285
Iteration: 382450   Dual objective     =           653.890492
Elapsed time = 1101.12 sec. (1306942.62 ticks, 383614 iterations)
Iteration: 383614   Dual objective     =           654.164485
Iteration: 384186   Dual objective     =           656.027826
Elapsed time = 1108.34 sec. (1317262.55 ticks, 384808 iterations)
Iteration: 384808   Dual objective     =           657.491023
Iteration: 385398   Dual objective     =           658.586019
Elapsed time = 1115.16 sec. (1327266.39 ticks, 385897 iterations)
Iteration: 385938   Dual objective     =           660.319562
Iteration: 386480   Dual objective     =           661.930464
Elapsed time = 1122.58 sec. (1338295.66 ticks, 387282 iterations)
Iteration: 387282   Dual objective     =           663.027206
Iteration: 388513   Dual objective     =           663.383201
Iteration: 389730   Dual objective     =           664.048034
Iteration: 390152   Dual objective     =           664.652526
Elapsed time = 1128.48 sec. (1348299.30 ticks, 391119 iterations)
Iteration: 391332   Dual objective     =           665.343015
Iteration: 391537   Dual objective     =           665.432449
Iteration: 392260   Dual objective     =           666.535232
Elapsed time = 1135.23 sec. (1358313.82 ticks, 392558 iterations)
Iteration: 392933   Dual objective     =           667.774402
Iteration: 393535   Dual objective     =           669.266810
Elapsed time = 1141.77 sec. (1368321.77 ticks, 393665 iterations)
Iteration: 394023   Dual objective     =           671.476948
Elapsed time = 1147.94 sec. (1378322.76 ticks, 394323 iterations)
Iteration: 394555   Dual objective     =           673.003287
Iteration: 395273   Dual objective     =           673.990819
Elapsed time = 1154.84 sec. (1388326.30 ticks, 395616 iterations)
Iteration: 396171   Dual objective     =           675.095305
Iteration: 396647   Dual objective     =           675.208631
Iteration: 397744   Dual objective     =           675.892639
Iteration: 398771   Dual objective     =           676.164989
Elapsed time = 1161.91 sec. (1398333.68 ticks, 398851 iterations)
Iteration: 399757   Dual objective     =           676.564517
Iteration: 400754   Dual objective     =           677.235127
Elapsed time = 1168.84 sec. (1409328.67 ticks, 401538 iterations)
Iteration: 401538   Dual objective     =           677.708317
Iteration: 402643   Dual objective     =           678.063017
Iteration: 403402   Dual objective     =           679.430097
Elapsed time = 1175.87 sec. (1419343.13 ticks, 403561 iterations)
Iteration: 403893   Dual objective     =           681.691600
Elapsed time = 1182.45 sec. (1429348.77 ticks, 404398 iterations)
Iteration: 404441   Dual objective     =           683.802855
Iteration: 404886   Dual objective     =           687.505885
Elapsed time = 1188.58 sec. (1439349.64 ticks, 404976 iterations)
Iteration: 405340   Dual objective     =           690.174689
Elapsed time = 1194.96 sec. (1449359.86 ticks, 405609 iterations)
Iteration: 405815   Dual objective     =           692.254214
Elapsed time = 1200.87 sec. (1459375.95 ticks, 406235 iterations)
Iteration: 406300   Dual objective     =           694.243659
Elapsed time = 1206.61 sec. (1469701.25 ticks, 406777 iterations)
Iteration: 406777   Dual objective     =           695.728011
Iteration: 407287   Dual objective     =           698.262857
Elapsed time = 1212.40 sec. (1479701.38 ticks, 407714 iterations)
Iteration: 408171   Dual objective     =           699.799635
Iteration: 408787   Dual objective     =           701.274435
Elapsed time = 1218.09 sec. (1489712.89 ticks, 408884 iterations)
Iteration: 409406   Dual objective     =           703.029998
Elapsed time = 1224.00 sec. (1500723.19 ticks, 409945 iterations)
Iteration: 409945   Dual objective     =           704.837690
Iteration: 410606   Dual objective     =           706.005459
Elapsed time = 1229.70 sec. (1510736.13 ticks, 410898 iterations)
Iteration: 411056   Dual objective     =           707.352283
Elapsed time = 1235.73 sec. (1521836.20 ticks, 411547 iterations)
Iteration: 411547   Dual objective     =           709.491137
Iteration: 412046   Dual objective     =           711.529583
Elapsed time = 1241.20 sec. (1531844.46 ticks, 412301 iterations)
Iteration: 412595   Dual objective     =           712.731219
Elapsed time = 1246.67 sec. (1541848.65 ticks, 413045 iterations)
Iteration: 413111   Dual objective     =           714.050246
Iteration: 413606   Dual objective     =           716.511086
Elapsed time = 1252.35 sec. (1551855.43 ticks, 413783 iterations)
Iteration: 414277   Dual objective     =           717.568368
Iteration: 414980   Dual objective     =           718.442073
Elapsed time = 1258.31 sec. (1561857.44 ticks, 415026 iterations)
Iteration: 415645   Dual objective     =           719.438041
Elapsed time = 1264.24 sec. (1572503.02 ticks, 416186 iterations)
Iteration: 416186   Dual objective     =           721.145891
Iteration: 416944   Dual objective     =           722.304392
Elapsed time = 1269.74 sec. (1582513.55 ticks, 417329 iterations)
Iteration: 417461   Dual objective     =           723.604968
Iteration: 418148   Dual objective     =           724.389239
Elapsed time = 1275.27 sec. (1592514.12 ticks, 418238 iterations)
Iteration: 418651   Dual objective     =           726.442042
Elapsed time = 1280.71 sec. (1602523.61 ticks, 418894 iterations)
Iteration: 419095   Dual objective     =           729.212437
Elapsed time = 1286.45 sec. (1613459.50 ticks, 419836 iterations)
Iteration: 419836   Dual objective     =           730.523407
Iteration: 420364   Dual objective     =           731.979746
Elapsed time = 1292.08 sec. (1623466.68 ticks, 420563 iterations)
Iteration: 420838   Dual objective     =           733.115082
Elapsed time = 1297.72 sec. (1633471.04 ticks, 421121 iterations)
Iteration: 421310   Dual objective     =           734.315775
Elapsed time = 1303.51 sec. (1644141.66 ticks, 421927 iterations)
Iteration: 421927   Dual objective     =           735.499077
Iteration: 422500   Dual objective     =           737.216049
Elapsed time = 1309.12 sec. (1654142.73 ticks, 423010 iterations)
Iteration: 423114   Dual objective     =           738.399956
Elapsed time = 1314.90 sec. (1664864.45 ticks, 423596 iterations)
Iteration: 423596   Dual objective     =           740.552508
Iteration: 424043   Dual objective     =           741.995114
Elapsed time = 1320.42 sec. (1674866.44 ticks, 424117 iterations)
Iteration: 424484   Dual objective     =           743.162859
Elapsed time = 1325.61 sec. (1684876.97 ticks, 424605 iterations)
Iteration: 424936   Dual objective     =           744.144002
Elapsed time = 1330.41 sec. (1694877.89 ticks, 425135 iterations)
Iteration: 425447   Dual objective     =           745.776967
Elapsed time = 1335.27 sec. (1704888.43 ticks, 425743 iterations)
Iteration: 425891   Dual objective     =           746.472387
Elapsed time = 1340.11 sec. (1714898.34 ticks, 426234 iterations)
Iteration: 426334   Dual objective     =           747.088127
Elapsed time = 1344.88 sec. (1724909.27 ticks, 426723 iterations)
Iteration: 426777   Dual objective     =           747.767010
Elapsed time = 1350.02 sec. (1734919.43 ticks, 427207 iterations)
Iteration: 427219   Dual objective     =           748.456168
Elapsed time = 1356.06 sec. (1746453.30 ticks, 427661 iterations)
Iteration: 427661   Dual objective     =           749.131568
Iteration: 428105   Dual objective     =           749.698481
Elapsed time = 1360.82 sec. (1756461.13 ticks, 428159 iterations)
Iteration: 428549   Dual objective     =           750.258944
Elapsed time = 1365.63 sec. (1766473.80 ticks, 428627 iterations)
Iteration: 428923   Dual objective     =           750.725310
Elapsed time = 1370.45 sec. (1776477.33 ticks, 428986 iterations)
Iteration: 429297   Dual objective     =           751.065987
Elapsed time = 1375.32 sec. (1786485.76 ticks, 429349 iterations)
Iteration: 429672   Dual objective     =           751.426565
Elapsed time = 1380.51 sec. (1796494.38 ticks, 429712 iterations)
Iteration: 430046   Dual objective     =           751.790510
Elapsed time = 1385.27 sec. (1806512.05 ticks, 430075 iterations)
Iteration: 430423   Dual objective     =           752.101992
Elapsed time = 1390.08 sec. (1816530.81 ticks, 430443 iterations)
Iteration: 430797   Dual objective     =           752.404573
Elapsed time = 1394.90 sec. (1826540.69 ticks, 430803 iterations)
Elapsed time = 1400.00 sec. (1836696.67 ticks, 431171 iterations)
Iteration: 431171   Dual objective     =           752.707800
Elapsed time = 1405.63 sec. (1846987.56 ticks, 431545 iterations)
Iteration: 431545   Dual objective     =           753.010047
Iteration: 431977   Dual objective     =           753.282204
Elapsed time = 1411.40 sec. (1857007.48 ticks, 431994 iterations)
Iteration: 432433   Dual objective     =           754.542590
Elapsed time = 1416.98 sec. (1867011.14 ticks, 432507 iterations)
Iteration: 433239   Dual objective     =           755.656717
Elapsed time = 1423.74 sec. (1877012.95 ticks, 433458 iterations)
Iteration: 434012   Dual objective     =           756.868166
Elapsed time = 1429.51 sec. (1887018.18 ticks, 434123 iterations)
Iteration: 434760   Dual objective     =           757.710902
Elapsed time = 1434.95 sec. (1897026.39 ticks, 434810 iterations)
Elapsed time = 1440.81 sec. (1907403.66 ticks, 435599 iterations)
Iteration: 435599   Dual objective     =           758.339513
Elapsed time = 1446.69 sec. (1918649.98 ticks, 436277 iterations)
Iteration: 436277   Dual objective     =           759.196154
Iteration: 436985   Dual objective     =           767.886779
Elapsed time = 1452.06 sec. (1928664.19 ticks, 437568 iterations)
Iteration: 437764   Dual objective     =           768.861564
Iteration: 438838   Dual objective     =           769.577932
Elapsed time = 1457.66 sec. (1938664.29 ticks, 439373 iterations)
Iteration: 439614   Dual objective     =           770.086896
Iteration: 440556   Dual objective     =           770.360420
Elapsed time = 1463.48 sec. (1948666.15 ticks, 441172 iterations)
Iteration: 441507   Dual objective     =           770.659476
Iteration: 442277   Dual objective     =           771.068755
Elapsed time = 1469.07 sec. (1958667.32 ticks, 442609 iterations)
Iteration: 443156   Dual objective     =           771.242556
Iteration: 444041   Dual objective     =           771.463134
Elapsed time = 1475.10 sec. (1968668.01 ticks, 444286 iterations)
Iteration: 444833   Dual objective     =           771.793323
Elapsed time = 1481.17 sec. (1979233.20 ticks, 445616 iterations)
Iteration: 445616   Dual objective     =           772.025480
Iteration: 446567   Dual objective     =           772.159102
Elapsed time = 1487.89 sec. (1990042.44 ticks, 447466 iterations)
Iteration: 447466   Dual objective     =           772.284641
Iteration: 448342   Dual objective     =           772.373131
Elapsed time = 1494.25 sec. (2001231.62 ticks, 449419 iterations)
Iteration: 449419   Dual objective     =           772.390609
Removing perturbation.
Iteration: 449622    Objective     =           772.334353
