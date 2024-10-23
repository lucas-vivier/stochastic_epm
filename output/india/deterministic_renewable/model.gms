--- Job _de7e6282-1984-4e4e-80dc-f62ec36001c9.gms Start 10/23/24 10:13:57 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmppq17ev2m/_de7e6282-1984-4e4e-80dc-f62ec36001c9.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmppq17ev2m/_de7e6282-1984-4e4e-80dc-f62ec36001c9.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmppq17ev2m/tmp53b21duc/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmppq17ev2m/_de7e6282-1984-4e4e-80dc-f62ec36001c9.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmppq17ev2m/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmppq17ev2m/_de7e6282-1984-4e4e-80dc-f62ec36001c9out.gdx
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
--- _de7e6282-1984-4e4e-80dc-f62ec36001c9.gms(67) 6 Mb
--- Starting execution: elapsed 0:00:00.001
--- Generating LP model deterministic_renewable
--- _de7e6282-1984-4e4e-80dc-f62ec36001c9.gms(351) 52 Mb
---   192,721 rows  113,884 columns  521,330 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 4.955E-01, 1.000E+00] - Zero values observed as well
--- Bound     [min, max] : [ 6.331E+00, 6.331E+00] - Zero values observed as well
--- Matrix    [min, max] : [ 3.333E-04, 7.884E+03]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:00.213

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 9.80 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 58.79 Mb (peak 59.66 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 4.38 Mb (peak 22.40 Mb)
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
LP Presolve eliminated 87382 rows and 39313 columns.
Aggregator did 17520 substitutions.
Reduced LP has 87818 rows, 57051 columns, and 254909 nonzeros.
Presolve time = 0.59 sec. (697.86 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =           498.771108
Perturbation started.
Iteration:   101   Dual objective     =           498.771108
Iteration:   694   Dual objective     =           578.428058
Iteration:  1649   Dual objective     =           578.449491
Iteration:  2600   Dual objective     =           578.500936
Iteration:  3557   Dual objective     =           578.583405
Iteration:  4524   Dual objective     =           578.700696
Iteration:  5495   Dual objective     =           578.841277
Iteration:  6756   Dual objective     =           579.081180
Iteration:  8017   Dual objective     =           579.376348
Iteration:  9296   Dual objective     =           579.756531
Iteration: 10589   Dual objective     =           580.206560
Elapsed time = 3.60 sec. (10000.33 ticks, 10687 iterations)
Iteration: 11893   Dual objective     =           580.747806
Iteration: 13203   Dual objective     =           581.360963
Iteration: 14535   Dual objective     =           582.057946
Iteration: 15000   Dual objective     =           717.436957
Iteration: 15270   Dual objective     =           751.020478
Iteration: 15332   Dual objective     =           751.041700
Iteration: 15394   Dual objective     =           751.061369
Iteration: 15456   Dual objective     =           751.081437
Iteration: 15518   Dual objective     =           751.100493
Iteration: 15580   Dual objective     =           751.119280
Iteration: 15642   Dual objective     =           751.135386
Iteration: 15705   Dual objective     =           751.152042
Iteration: 15771   Dual objective     =           751.180564
Iteration: 15842   Dual objective     =           751.195323
Iteration: 15919   Dual objective     =           751.217946
Iteration: 16003   Dual objective     =           751.232025
Iteration: 16094   Dual objective     =           751.243665
Iteration: 16197   Dual objective     =           751.255429
Iteration: 16295   Dual objective     =           755.485192
Iteration: 16399   Dual objective     =           755.494452
Iteration: 16485   Dual objective     =           755.499381
Iteration: 16568   Dual objective     =           755.504441
Iteration: 16653   Dual objective     =           755.509032
Iteration: 16738   Dual objective     =           755.514412
Iteration: 16823   Dual objective     =           755.519902
Iteration: 16911   Dual objective     =           755.525059
Iteration: 17004   Dual objective     =           755.530736
Iteration: 17100   Dual objective     =           755.535980
Iteration: 17191   Dual objective     =           755.540860
Iteration: 17285   Dual objective     =           755.545322
Iteration: 17388   Dual objective     =           755.550116
Iteration: 17488   Dual objective     =           755.554055
Iteration: 17591   Dual objective     =           755.557827
Iteration: 17695   Dual objective     =           755.561214
Iteration: 17807   Dual objective     =           755.564425
Iteration: 17913   Dual objective     =           755.567280
Iteration: 18025   Dual objective     =           755.570321
Iteration: 18145   Dual objective     =           755.572776
Elapsed time = 6.45 sec. (20018.52 ticks, 18268 iterations)
Iteration: 18268   Dual objective     =           755.574993
Iteration: 19159   Dual objective     =           759.955543
Iteration: 19307   Dual objective     =           759.958299
Iteration: 19527   Dual objective     =           759.960780
Iteration: 19706   Dual objective     =           759.962827
Iteration: 20368   Dual objective     =           759.977812
Iteration: 21278   Dual objective     =           760.137321
Iteration: 22203   Dual objective     =           769.228723
Iteration: 22737   Dual objective     =           769.631100
Iteration: 23036   Dual objective     =           788.805081
Iteration: 23271   Dual objective     =           788.810369
Iteration: 23669   Dual objective     =           795.615013
Iteration: 23857   Dual objective     =           795.617060
Iteration: 24344   Dual objective     =           799.380246
Iteration: 24899   Dual objective     =           799.843983
Iteration: 25381   Dual objective     =           803.464381
Iteration: 26020   Dual objective     =           812.330665
Iteration: 26701   Dual objective     =           819.931046
Iteration: 26963   Dual objective     =           823.974849
Iteration: 27617   Dual objective     =           825.362645
Iteration: 28168   Dual objective     =           825.603259
Iteration: 28728   Dual objective     =           828.878038
Iteration: 29374   Dual objective     =           842.353886
Iteration: 29994   Dual objective     =           846.003875
Iteration: 30745   Dual objective     =           850.104528
Iteration: 31545   Dual objective     =           854.805167
Iteration: 32347   Dual objective     =           859.311945
Iteration: 33069   Dual objective     =           860.145680
Iteration: 33958   Dual objective     =           862.053078
Iteration: 35230   Dual objective     =           862.328620
Iteration: 36240   Dual objective     =           862.396888
Iteration: 37024   Dual objective     =           865.226792
Iteration: 37827   Dual objective     =           865.675617
Iteration: 38657   Dual objective     =           866.130385
Removing perturbation.

Barrier solved model.


--- LP status (1): optimal.
--- Cplex Time: 8.11sec (det. 4759.91 ticks)


Optimal solution found
Objective:          866.212795

--- Reading solution for model deterministic_renewable
--- _de7e6282-1984-4e4e-80dc-f62ec36001c9.gms(351) 52 Mb  8 secs
--- Executing after solve: elapsed 0:00:08.646
--- _de7e6282-1984-4e4e-80dc-f62ec36001c9.gms(355) 52 Mb
--- _de7e6282-1984-4e4e-80dc-f62ec36001c9.gms(413) 52 Mb
--- GDX File /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmppq17ev2m/_de7e6282-1984-4e4e-80dc-f62ec36001c9out.gdx
*** Status: Normal completion
--- Job _de7e6282-1984-4e4e-80dc-f62ec36001c9.gms Stop 10/23/24 10:14:06 elapsed 0:00:08.679
