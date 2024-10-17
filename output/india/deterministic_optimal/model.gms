--- Job _9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.gms Start 10/17/24 12:06:50 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_ya7u1sm/_9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_ya7u1sm/_9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_ya7u1sm/tmpaoms6_62/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_ya7u1sm/_9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_ya7u1sm/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_ya7u1sm/_9beb0ee0-8a08-4b0a-ad72-cf9bc888417dout.gdx
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
--- _9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.gms(67) 4 Mb
--- Starting execution: elapsed 0:00:00.001
--- Generating LP model deterministic_optimal
--- _9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.gms(267) 34 Mb
---   105,120 rows  70,085 columns  311,088 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 4.955E-01, 1.000E+00] - Zero values observed as well
--- Bound     [min, max] : [        NA,        NA] - Zero values observed as well
--- Matrix    [min, max] : [ 3.333E-04, 7.884E+03]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:00.138

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 4.70 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 34.42 Mb (peak 34.95 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 2.54 Mb (peak 12.04 Mb)
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
LP Presolve eliminated 8540 rows and 4272 columns.
Aggregator did 2 substitutions.
Reduced LP has 96577 rows, 65811 columns, and 272209 nonzeros.
Presolve time = 0.13 sec. (100.39 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =             0.000000
Perturbation started.
Iteration:   101   Dual objective     =             0.000000
Iteration:   593   Dual objective     =             5.548049
Iteration:  1204   Dual objective     =            54.496178
Iteration:  1614   Dual objective     =            74.570900
Iteration:  2889   Dual objective     =            74.571221
Iteration:  4144   Dual objective     =            74.571527
Iteration:  5396   Dual objective     =            74.571839
Iteration:  6639   Dual objective     =            74.572137
Iteration:  7889   Dual objective     =            74.572435
Iteration:  9132   Dual objective     =            74.572723
Iteration: 10341   Dual objective     =            74.573002
Iteration: 11517   Dual objective     =            74.573283
Iteration: 12679   Dual objective     =            74.573558
Iteration: 13853   Dual objective     =            74.573820
Iteration: 14961   Dual objective     =            74.874070
Iteration: 15256   Dual objective     =           108.112746
Iteration: 15570   Dual objective     =           114.995663
Iteration: 16353   Dual objective     =           123.316318
Iteration: 16609   Dual objective     =           123.545468
Iteration: 16857   Dual objective     =           123.546203
Iteration: 17105   Dual objective     =           123.547034
Iteration: 17353   Dual objective     =           123.547847
Iteration: 17601   Dual objective     =           123.548823
Iteration: 17849   Dual objective     =           123.549941
Iteration: 18099   Dual objective     =           123.551441
Iteration: 18363   Dual objective     =           124.861558
Iteration: 18555   Dual objective     =           124.864486
Iteration: 18820   Dual objective     =           126.153705
Iteration: 19463   Dual objective     =           135.133341
Iteration: 20121   Dual objective     =           145.285770
Iteration: 20871   Dual objective     =           156.874205
Iteration: 21650   Dual objective     =           170.257791
Iteration: 22401   Dual objective     =           181.375146
Iteration: 23079   Dual objective     =           190.277660
Elapsed time = 4.27 sec. (10000.91 ticks, 23241 iterations)
Markowitz threshold set to 0.1
Iteration: 23299   Dual objective     =           192.179309
Iteration: 23735   Dual objective     =           194.434171
Iteration: 23791   Dual objective     =           194.453399
Iteration: 24227   Dual objective     =           197.655737
Iteration: 24960   Dual objective     =           201.764201
Iteration: 25609   Dual objective     =           206.921911
Iteration: 26099   Dual objective     =           209.875806
Iteration: 26650   Dual objective     =           212.644893
Iteration: 27075   Dual objective     =           215.549026
Iteration: 27544   Dual objective     =           217.768757
Iteration: 28207   Dual objective     =           218.258532
Iteration: 28802   Dual objective     =           220.958073
Iteration: 28988   Dual objective     =           221.580508
Iteration: 29436   Dual objective     =           223.142242
Iteration: 29853   Dual objective     =           224.459686
Iteration: 30450   Dual objective     =           227.442537
Iteration: 30816   Dual objective     =           228.031687
Iteration: 31365   Dual objective     =           228.406716
Iteration: 32010   Dual objective     =           229.355137
Iteration: 32314   Dual objective     =           230.875168
Iteration: 32847   Dual objective     =           232.837644
Iteration: 33622   Dual objective     =           234.340138
Iteration: 34198   Dual objective     =           236.100171
Iteration: 34777   Dual objective     =           237.098851
Elapsed time = 9.48 sec. (20001.05 ticks, 35091 iterations)
Iteration: 35178   Dual objective     =           237.736249
Iteration: 35819   Dual objective     =           238.551420
Iteration: 36235   Dual objective     =           240.438585
Iteration: 36837   Dual objective     =           242.221560
Iteration: 37239   Dual objective     =           243.438698
Iteration: 37669   Dual objective     =           244.548269
Iteration: 38220   Dual objective     =           247.517500
Iteration: 38705   Dual objective     =           249.075855
Iteration: 39290   Dual objective     =           250.971947
Iteration: 39938   Dual objective     =           252.619005
Iteration: 40358   Dual objective     =           254.140644
Iteration: 40581   Dual objective     =           254.450605
Iteration: 41063   Dual objective     =           256.967066
Iteration: 41683   Dual objective     =           258.188128
Iteration: 42104   Dual objective     =           259.120180
Iteration: 42660   Dual objective     =           260.502809
Iteration: 43218   Dual objective     =           262.542530
Iteration: 43583   Dual objective     =           263.547726
Iteration: 44331   Dual objective     =           266.015752
Iteration: 44817   Dual objective     =           268.065810
Elapsed time = 14.10 sec. (30001.15 ticks, 45134 iterations)
Iteration: 45479   Dual objective     =           271.094555
Iteration: 45914   Dual objective     =           272.081513
Iteration: 46262   Dual objective     =           272.574443
Iteration: 46640   Dual objective     =           273.788612
Iteration: 47218   Dual objective     =           275.433529
Iteration: 47816   Dual objective     =           277.051767
Iteration: 48409   Dual objective     =           278.602098
Iteration: 48962   Dual objective     =           279.472681
Iteration: 49416   Dual objective     =           280.870784
Iteration: 49926   Dual objective     =           282.785376
Iteration: 50483   Dual objective     =           284.446573
Iteration: 50974   Dual objective     =           285.900766
Iteration: 51561   Dual objective     =           287.759753
Iteration: 52111   Dual objective     =           289.054738
Iteration: 52636   Dual objective     =           290.044751
Iteration: 53125   Dual objective     =           291.570147
Iteration: 53654   Dual objective     =           293.029357
Iteration: 54291   Dual objective     =           295.810116
Iteration: 54793   Dual objective     =           297.864677
Iteration: 55346   Dual objective     =           299.441738
Elapsed time = 18.53 sec. (40001.87 ticks, 55614 iterations)
Iteration: 55951   Dual objective     =           300.776325
Iteration: 56525   Dual objective     =           301.781910
Iteration: 57054   Dual objective     =           303.343289
Iteration: 57654   Dual objective     =           304.862985
Iteration: 58169   Dual objective     =           306.619986
Iteration: 58759   Dual objective     =           307.855184
Iteration: 59395   Dual objective     =           309.100614
Iteration: 59965   Dual objective     =           310.625620
Iteration: 60515   Dual objective     =           311.716288
Iteration: 61006   Dual objective     =           312.435367
Iteration: 61565   Dual objective     =           313.446866
Iteration: 62096   Dual objective     =           314.467121
Iteration: 62367   Dual objective     =           315.210484
Iteration: 62875   Dual objective     =           316.599105
Iteration: 63460   Dual objective     =           317.475777
Iteration: 64025   Dual objective     =           318.445250
Iteration: 64573   Dual objective     =           319.560359
Iteration: 65004   Dual objective     =           320.178333
Iteration: 65621   Dual objective     =           320.875287
Elapsed time = 22.54 sec. (50002.20 ticks, 66171 iterations)
Iteration: 66188   Dual objective     =           321.781343
Iteration: 66786   Dual objective     =           322.720165
Iteration: 67245   Dual objective     =           323.782836
Iteration: 67760   Dual objective     =           324.463453
Iteration: 68336   Dual objective     =           325.450412
Iteration: 68875   Dual objective     =           326.494270
Iteration: 69392   Dual objective     =           327.132732
Iteration: 70082   Dual objective     =           328.047902
Iteration: 70461   Dual objective     =           328.703959
Iteration: 71100   Dual objective     =           329.769316
Iteration: 72216   Dual objective     =           330.149363
Iteration: 72817   Dual objective     =           330.769092
Iteration: 73394   Dual objective     =           331.721272
Iteration: 74079   Dual objective     =           332.495849
Iteration: 74639   Dual objective     =           332.933605
Iteration: 75421   Dual objective     =           334.182993
Iteration: 76119   Dual objective     =           335.424520
Iteration: 76855   Dual objective     =           336.532415
Iteration: 77434   Dual objective     =           337.381528
Iteration: 78286   Dual objective     =           338.275235
Iteration: 78932   Dual objective     =           338.785689
Iteration: 79720   Dual objective     =           339.458122
Elapsed time = 26.80 sec. (60002.71 ticks, 80237 iterations)
Iteration: 80388   Dual objective     =           340.009288
Iteration: 81018   Dual objective     =           340.733216
Iteration: 81600   Dual objective     =           341.120680
Iteration: 82604   Dual objective     =           342.050855
Iteration: 83175   Dual objective     =           342.692730
Iteration: 83960   Dual objective     =           343.198957
Iteration: 84578   Dual objective     =           343.560413
Iteration: 85249   Dual objective     =           343.927921
Iteration: 86017   Dual objective     =           344.455101
Iteration: 86699   Dual objective     =           344.952872
Iteration: 87406   Dual objective     =           345.305465
Iteration: 88214   Dual objective     =           345.515765
Iteration: 88974   Dual objective     =           345.729222
Iteration: 89819   Dual objective     =           345.840769
Iteration: 90597   Dual objective     =           345.917699
Iteration: 91328   Dual objective     =           345.967552
Iteration: 92125   Dual objective     =           345.999361
Iteration: 93027   Dual objective     =           346.004069
Iteration: 93881   Dual objective     =           346.004151
Removing perturbation.
Iteration: 93973    Objective     =           345.999088
Iteration: 94179   Dual objective     =           345.999088

Barrier solved model.


--- LP status (1): optimal.
--- Cplex Time: 34.57sec (det. 5427.28 ticks)


Optimal solution found
Objective:          345.999088

--- Reading solution for model deterministic_optimal
--- Executing after solve: elapsed 0:00:34.944
--- _9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.gms(271) 34 Mb
--- _9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.gms(329) 34 Mb
--- GDX File /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp_ya7u1sm/_9beb0ee0-8a08-4b0a-ad72-cf9bc888417dout.gdx
*** Status: Normal completion
--- Job _9beb0ee0-8a08-4b0a-ad72-cf9bc888417d.gms Stop 10/17/24 12:07:25 elapsed 0:00:34.967
