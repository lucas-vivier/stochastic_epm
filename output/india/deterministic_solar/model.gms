--- Job _e29a47b6-4411-4d44-af05-3d1d2313f346.gms Start 10/23/24 10:14:29 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjrcc2gic/_e29a47b6-4411-4d44-af05-3d1d2313f346.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjrcc2gic/_e29a47b6-4411-4d44-af05-3d1d2313f346.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjrcc2gic/tmp2t435v35/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjrcc2gic/_e29a47b6-4411-4d44-af05-3d1d2313f346.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjrcc2gic/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjrcc2gic/_e29a47b6-4411-4d44-af05-3d1d2313f346out.gdx
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
--- _e29a47b6-4411-4d44-af05-3d1d2313f346.gms(67) 5 Mb
--- Starting execution: elapsed 0:00:00.001
--- Generating LP model deterministic_solar
--- _e29a47b6-4411-4d44-af05-3d1d2313f346.gms(351) 35 Mb
---   131,400 rows  87,603 columns  337,368 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 4.955E-01, 1.000E+00] - Zero values observed as well
--- Bound     [min, max] : [ 6.331E+00, 6.331E+00] - Zero values observed as well
--- Matrix    [min, max] : [ 3.333E-04, 7.884E+03]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:00.135

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 6.82 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 40.40 Mb (peak 41.06 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 3.17 Mb (peak 15.56 Mb)
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
LP Presolve eliminated 56394 rows and 26067 columns.
Aggregator did 13249 substitutions.
Reduced LP has 61756 rows, 48287 columns, and 172016 nonzeros.
Presolve time = 0.36 sec. (432.02 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =           498.771108
Perturbation started.
Iteration:   101   Dual objective     =           498.771108
Iteration:   365   Dual objective     =           601.852068
Iteration:  1260   Dual objective     =           608.987540
Iteration:  2168   Dual objective     =           608.988327
Iteration:  3069   Dual objective     =           608.989017
Iteration:  3989   Dual objective     =           617.453994
Iteration:  4900   Dual objective     =           635.332948
Iteration:  5812   Dual objective     =           666.101701
Iteration:  6654   Dual objective     =           682.336478
Iteration:  7095   Dual objective     =           816.788797
Iteration:  7788   Dual objective     =           911.702462
Iteration:  8533   Dual objective     =          1020.695039
Iteration:  9672   Dual objective     =          1106.504777
Iteration: 10835   Dual objective     =          1196.657843
Iteration: 11305   Dual objective     =          1216.703849
Iteration: 12552   Dual objective     =          1219.298644
Iteration: 13655   Dual objective     =          1223.433498
Iteration: 14492   Dual objective     =          1232.964881
Iteration: 15166   Dual objective     =          1234.950272
Iteration: 16726   Dual objective     =          1246.915843
Iteration: 17202   Dual objective     =          1249.545460
Iteration: 18643   Dual objective     =          1259.060084
Iteration: 19356   Dual objective     =          1273.149966
Iteration: 20180   Dual objective     =          1295.587348
Iteration: 20749   Dual objective     =          1327.103067
Iteration: 21373   Dual objective     =          1370.000624
Iteration: 22257   Dual objective     =          1376.549753
Iteration: 22790   Dual objective     =          1388.921804
Iteration: 23232   Dual objective     =          1400.426244
Iteration: 23765   Dual objective     =          1410.733418
Iteration: 24200   Dual objective     =          1418.621422
Removing perturbation.

Barrier solved model.


--- LP status (1): optimal.
--- Cplex Time: 1.15sec (det. 1966.50 ticks)


Optimal solution found
Objective:         1419.632555

--- Reading solution for model deterministic_solar
--- Executing after solve: elapsed 0:00:01.525
--- _e29a47b6-4411-4d44-af05-3d1d2313f346.gms(355) 35 Mb
--- _e29a47b6-4411-4d44-af05-3d1d2313f346.gms(413) 35 Mb
--- GDX File /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpjrcc2gic/_e29a47b6-4411-4d44-af05-3d1d2313f346out.gdx
*** Status: Normal completion
--- Job _e29a47b6-4411-4d44-af05-3d1d2313f346.gms Stop 10/23/24 10:14:30 elapsed 0:00:01.546
