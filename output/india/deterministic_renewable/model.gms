--- Job _3f80d17a-d322-4f8f-8fa9-ae5840154b37.gms Start 10/17/24 12:07:27 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp0q0a1r9x/_3f80d17a-d322-4f8f-8fa9-ae5840154b37.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp0q0a1r9x/_3f80d17a-d322-4f8f-8fa9-ae5840154b37.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp0q0a1r9x/tmpzfi4crwl/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp0q0a1r9x/_3f80d17a-d322-4f8f-8fa9-ae5840154b37.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp0q0a1r9x/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp0q0a1r9x/_3f80d17a-d322-4f8f-8fa9-ae5840154b37out.gdx
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
--- _3f80d17a-d322-4f8f-8fa9-ae5840154b37.gms(67) 5 Mb
--- Starting execution: elapsed 0:00:00.001
--- Generating LP model deterministic_renewable
--- _3f80d17a-d322-4f8f-8fa9-ae5840154b37.gms(238) 26 Mb
---   70,081 rows  61,324 columns  214,730 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 4.955E-01, 1.000E+00] - Zero values observed as well
--- Bound     [min, max] : [ 6.331E+00, 6.331E+00] - Zero values observed as well
--- Matrix    [min, max] : [ 3.333E-04, 7.884E+03]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:00.082

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 3.48 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 25.00 Mb (peak 25.47 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 1.97 Mb (peak 9.05 Mb)
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
LP Presolve eliminated 8544 rows and 4277 columns.
Aggregator did 1 substitutions.
Reduced LP has 61535 rows, 57046 columns, and 184602 nonzeros.
Presolve time = 0.08 sec. (79.53 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =             0.000000
Perturbation started.
Iteration:   202   Dual objective     =           124.692777
Iteration:  1107   Dual objective     =           124.724584
Iteration:  1665   Dual objective     =           204.154011
Iteration:  2670   Dual objective     =           204.155318
Iteration:  3616   Dual objective     =           204.188539
Iteration:  4553   Dual objective     =           204.254942
Iteration:  5506   Dual objective     =           204.366824
Iteration:  6281   Dual objective     =           269.397797
Iteration:  6681   Dual objective     =           318.400999
Iteration:  7490   Dual objective     =           340.898504
Iteration:  7752   Dual objective     =           352.186297
Iteration:  7889   Dual objective     =           352.188419
Iteration:  8031   Dual objective     =           352.190123
Iteration:  8190   Dual objective     =           352.191655
Iteration:  9019   Dual objective     =           356.788704
Iteration: 10416   Dual objective     =           356.789103
Iteration: 11640   Dual objective     =           362.095138
Iteration: 12944   Dual objective     =           362.416766
Iteration: 13771   Dual objective     =           393.132075
Iteration: 14910   Dual objective     =           426.027876
Iteration: 16336   Dual objective     =           426.028241
Iteration: 17450   Dual objective     =           430.357203
Iteration: 17623   Dual objective     =           435.803533
Iteration: 17815   Dual objective     =           435.806004
Iteration: 18096   Dual objective     =           435.814719
Iteration: 18847   Dual objective     =           456.514237
Iteration: 19110   Dual objective     =           456.515835
Iteration: 19234   Dual objective     =           456.521043
Iteration: 19828   Dual objective     =           467.399227
Iteration: 20595   Dual objective     =           481.884371
Iteration: 21329   Dual objective     =           499.887346
Iteration: 22038   Dual objective     =           509.364909
Iteration: 22747   Dual objective     =           514.754201
Iteration: 23443   Dual objective     =           519.143652
Iteration: 23995   Dual objective     =           529.350540
Iteration: 24823   Dual objective     =           530.992627
Iteration: 25483   Dual objective     =           533.432650
Iteration: 26306   Dual objective     =           534.951327
Iteration: 26996   Dual objective     =           537.392869
Iteration: 27692   Dual objective     =           538.425541
Iteration: 28387   Dual objective     =           539.227583
Iteration: 29183   Dual objective     =           539.406993
Iteration: 30563   Dual objective     =           539.407744
Removing perturbation.

Barrier solved model.


--- LP status (1): optimal.
--- Cplex Time: 3.90sec (det. 2409.79 ticks)


Optimal solution found
Objective:          539.401596

--- Reading solution for model deterministic_renewable
--- Executing after solve: elapsed 0:00:04.157
--- _3f80d17a-d322-4f8f-8fa9-ae5840154b37.gms(242) 26 Mb
--- _3f80d17a-d322-4f8f-8fa9-ae5840154b37.gms(300) 26 Mb
--- GDX File /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmp0q0a1r9x/_3f80d17a-d322-4f8f-8fa9-ae5840154b37out.gdx
*** Status: Normal completion
--- Job _3f80d17a-d322-4f8f-8fa9-ae5840154b37.gms Stop 10/17/24 12:07:31 elapsed 0:00:04.170
