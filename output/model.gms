--- Job _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms Start 10/23/24 10:14:32 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjihfd1_1/_5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjihfd1_1/_5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjihfd1_1/tmp7sqsov8r/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjihfd1_1/_5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjihfd1_1/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjihfd1_1/_5aed3ffb-afcc-42a6-a1cb-ad61e2cf3feeout.gdx
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
--- _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms(67) 5 Mb
--- Starting execution: elapsed 0:00:00.002
--- Generating LP model stochastic_solar
--- _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms(336) 85 Mb
--- _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms(346) 91 Mb
--- _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms(351) 94 Mb
---   394,198 rows  262,803 columns  1,011,995 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 4.955E-01, 1.000E+00] - Zero values observed as well
--- Bound     [min, max] : [ 6.331E+00, 6.331E+00] - Zero values observed as well
--- Matrix    [min, max] : [ 1.000E-03, 7.884E+03]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:00.488

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 21.10 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 121.19 Mb (peak 123.19 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 9.52 Mb (peak 47.29 Mb)
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
LP Presolve eliminated 169697 rows and 78405 columns.
Aggregator did 39644 substitutions.
Reduced LP has 184856 rows, 144754 columns, and 514915 nonzeros.
Presolve time = 2.57 sec. (3137.15 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =           498.771108
Perturbation started.
Iteration:   101   Dual objective     =           498.771108
Iteration:  1233   Dual objective     =           594.897232
Iteration:  2796   Dual objective     =           600.401632
Iteration:  4290   Dual objective     =           600.402795
Iteration:  5790   Dual objective     =           606.268854
Iteration:  7262   Dual objective     =           607.572525
Iteration:  8762   Dual objective     =           613.084989
Iteration: 10224   Dual objective     =           627.013529
Iteration: 11725   Dual objective     =           628.331609
Iteration: 13216   Dual objective     =           636.840089
Iteration: 14667   Dual objective     =           657.097354
Iteration: 16120   Dual objective     =           675.591741
Iteration: 17608   Dual objective     =           690.590873
Iteration: 19099   Dual objective     =           709.393215
Iteration: 20570   Dual objective     =           732.968405
Iteration: 22047   Dual objective     =           750.645468
Iteration: 23906   Dual objective     =           783.214532
Iteration: 25755   Dual objective     =           818.010770
Iteration: 27603   Dual objective     =           852.459755
Iteration: 29071   Dual objective     =           884.632587
Iteration: 30542   Dual objective     =           916.206367
Iteration: 30864   Dual objective     =           924.642294
Iteration: 32663   Dual objective     =           924.643953
Iteration: 34228   Dual objective     =           924.645705
Iteration: 35710   Dual objective     =           924.647835
Iteration: 37254   Dual objective     =           924.937964
Iteration: 38855   Dual objective     =           924.940228
Iteration: 40440   Dual objective     =           925.782046
Iteration: 41991   Dual objective     =           926.331068
Iteration: 43508   Dual objective     =           927.144927
Iteration: 45255   Dual objective     =           928.113753
Iteration: 46955   Dual objective     =           930.447792
Iteration: 47661   Dual objective     =           993.588996
Iteration: 48894   Dual objective     =          1130.992250
Iteration: 50052   Dual objective     =          1217.204427
Iteration: 51417   Dual objective     =          1221.519753
Iteration: 52147   Dual objective     =          1229.383815
Iteration: 54139   Dual objective     =          1242.178970
Iteration: 55584   Dual objective     =          1244.447577
Iteration: 56656   Dual objective     =          1244.666351
Iteration: 57204   Dual objective     =          1244.999782
Iteration: 59658   Dual objective     =          1247.978115
Iteration: 60720   Dual objective     =          1253.287944
Iteration: 61209   Dual objective     =          1257.083533
Iteration: 62470   Dual objective     =          1287.086336
Iteration: 63588   Dual objective     =          1295.398850
Iteration: 64429   Dual objective     =          1313.322627
Iteration: 65670   Dual objective     =          1350.628043
Iteration: 66628   Dual objective     =          1380.090905
Iteration: 67744   Dual objective     =          1403.462292
Iteration: 68726   Dual objective     =          1427.250511
Iteration: 69835   Dual objective     =          1435.565519
Iteration: 70990   Dual objective     =          1439.226755
Elapsed time = 5.44 sec. (10002.15 ticks, 71198 iterations)
Iteration: 72003   Dual objective     =          1445.113745
Iteration: 72739   Dual objective     =          1455.197793
Iteration: 73432   Dual objective     =          1467.058893
Iteration: 74030   Dual objective     =          1476.748551
Iteration: 74766   Dual objective     =          1483.781413
Iteration: 75390   Dual objective     =          1490.654348
Iteration: 76087   Dual objective     =          1494.084805
Removing perturbation.

Barrier solved model.


--- LP status (1): optimal.
--- Cplex Time: 10.65sec (det. 9886.59 ticks)


Optimal solution found
Objective:         1494.982939

--- Reading solution for model stochastic_solar
--- _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms(351) 94 Mb  11 secs
--- Executing after solve: elapsed 0:00:11.797
--- _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms(355) 94 Mb
--- _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms(413) 94 Mb
--- GDX File /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjihfd1_1/_5aed3ffb-afcc-42a6-a1cb-ad61e2cf3feeout.gdx
*** Status: Normal completion
--- Job _5aed3ffb-afcc-42a6-a1cb-ad61e2cf3fee.gms Stop 10/23/24 10:14:44 elapsed 0:00:11.892
