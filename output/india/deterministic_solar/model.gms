--- Job _4dc1d3e3-a487-487a-a150-1e9c9eac9377.gms Start 10/17/24 12:07:33 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpqy3rn6w9/_4dc1d3e3-a487-487a-a150-1e9c9eac9377.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpqy3rn6w9/_4dc1d3e3-a487-487a-a150-1e9c9eac9377.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpqy3rn6w9/tmp3zo6vp47/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpqy3rn6w9/_4dc1d3e3-a487-487a-a150-1e9c9eac9377.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpqy3rn6w9/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpqy3rn6w9/_4dc1d3e3-a487-487a-a150-1e9c9eac9377out.gdx
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
--- _4dc1d3e3-a487-487a-a150-1e9c9eac9377.gms(67) 5 Mb
--- Starting execution: elapsed 0:00:00.001
--- Generating LP model deterministic_solar
--- _4dc1d3e3-a487-487a-a150-1e9c9eac9377.gms(238) 20 Mb
---   52,560 rows  52,563 columns  162,168 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 4.955E-01, 1.000E+00] - Zero values observed as well
--- Bound     [min, max] : [ 6.331E+00, 6.331E+00] - Zero values observed as well
--- Matrix    [min, max] : [ 3.333E-04, 7.884E+03]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:00.064

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 2.73 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 19.53 Mb (peak 19.93 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 1.60 Mb (peak 7.14 Mb)
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
LP Presolve eliminated 8542 rows and 4276 columns.
Aggregator did 1 substitutions.
Reduced LP has 44016 rows, 48286 columns, and 132047 nonzeros.
Presolve time = 0.06 sec. (60.54 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =             0.000000
Perturbation started.
Iteration:   202   Dual objective     =           124.692777
Iteration:  1010   Dual objective     =           124.769994
Iteration:  1313   Dual objective     =           225.924538
Iteration:  1474   Dual objective     =           310.593316
Iteration:  1634   Dual objective     =           471.267402
Iteration:  1950   Dual objective     =           549.226217
Iteration:  2657   Dual objective     =           613.942430
Iteration:  3237   Dual objective     =           685.541443
Iteration:  3952   Dual objective     =           734.455981
Iteration:  4784   Dual objective     =           747.205550
Iteration:  5150   Dual objective     =           762.744067
Iteration:  5360   Dual objective     =           783.375917
Iteration:  5829   Dual objective     =           802.155287
Iteration:  6682   Dual objective     =           806.662802
Iteration:  7705   Dual objective     =           828.801521
Iteration:  8798   Dual objective     =           841.417368
Iteration:  9904   Dual objective     =           845.944377
Iteration: 10860   Dual objective     =           852.062131
Iteration: 11824   Dual objective     =           852.688038
Iteration: 12768   Dual objective     =           853.118678
Iteration: 13640   Dual objective     =           853.874699
Iteration: 14587   Dual objective     =           854.444567
Iteration: 15518   Dual objective     =           857.686197
Iteration: 16413   Dual objective     =           860.767494
Iteration: 17142   Dual objective     =           861.824705
Iteration: 17840   Dual objective     =           870.862884
Iteration: 18440   Dual objective     =           879.654430
Removing perturbation.

Barrier solved model.


--- LP status (1): optimal.
--- Cplex Time: 0.81sec (det. 1263.90 ticks)


Optimal solution found
Objective:          934.566473

--- Reading solution for model deterministic_solar
--- Executing after solve: elapsed 0:00:01.015
--- _4dc1d3e3-a487-487a-a150-1e9c9eac9377.gms(300) 20 Mb
--- GDX File /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpqy3rn6w9/_4dc1d3e3-a487-487a-a150-1e9c9eac9377out.gdx
*** Status: Normal completion
--- Job _4dc1d3e3-a487-487a-a150-1e9c9eac9377.gms Stop 10/17/24 12:07:34 elapsed 0:00:01.026
