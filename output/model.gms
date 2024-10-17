--- Job _6ff680fe-196c-4110-b55b-a351e7eab401.gms Start 10/17/24 12:08:15 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpc2yqq774/_6ff680fe-196c-4110-b55b-a351e7eab401.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpc2yqq774/_6ff680fe-196c-4110-b55b-a351e7eab401.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpc2yqq774/tmpis64r_ng/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpc2yqq774/_6ff680fe-196c-4110-b55b-a351e7eab401.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpc2yqq774/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpc2yqq774/_6ff680fe-196c-4110-b55b-a351e7eab401out.gdx
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
--- _6ff680fe-196c-4110-b55b-a351e7eab401.gms(67) 5 Mb
--- Starting execution: elapsed 0:00:00.002
--- Generating LP model stochastic_solar
--- _6ff680fe-196c-4110-b55b-a351e7eab401.gms(238) 50 Mb
---   157,678 rows  157,683 columns  486,395 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 4.955E-01, 1.000E+00] - Zero values observed as well
--- Bound     [min, max] : [ 6.331E+00, 6.331E+00] - Zero values observed as well
--- Matrix    [min, max] : [ 1.000E-03, 7.884E+03]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:00.216

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 8.48 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 58.59 Mb (peak 59.79 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 4.81 Mb (peak 21.72 Mb)
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
LP Presolve eliminated 25832 rows and 12929 columns.
Aggregator did 3 substitutions.
Reduced LP has 131842 rows, 144751 columns, and 395523 nonzeros.
Presolve time = 0.22 sec. (196.29 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =             0.000000
Perturbation started.
Iteration:   202   Dual objective     =           124.692777
Iteration:  1213   Dual objective     =           223.386485
Iteration:  1592   Dual objective     =           273.758750
Iteration:  2146   Dual objective     =           347.457875
Iteration:  2717   Dual objective     =           395.160472
Iteration:  3279   Dual objective     =           463.675466
Iteration:  3842   Dual objective     =           497.931468
Iteration:  5049   Dual objective     =           537.017526
Iteration:  5894   Dual objective     =           565.435608
Iteration:  6872   Dual objective     =           601.275216
Iteration:  8135   Dual objective     =           642.644706
Iteration:  9944   Dual objective     =           691.636682
Iteration: 11530   Dual objective     =           715.291211
Iteration: 11836   Dual objective     =           717.605301
Iteration: 13839   Dual objective     =           738.634386
Iteration: 14735   Dual objective     =           743.826519
Iteration: 16731   Dual objective     =           767.335477
Iteration: 18544   Dual objective     =           780.797419
Iteration: 19046   Dual objective     =           781.962244
Iteration: 21094   Dual objective     =           790.390027
Iteration: 22886   Dual objective     =           790.978229
Iteration: 23349   Dual objective     =           797.039904
Iteration: 24941   Dual objective     =           797.293871
Iteration: 26420   Dual objective     =           797.295070
Iteration: 27271   Dual objective     =           797.957721
Iteration: 28862   Dual objective     =           798.281202
Iteration: 30328   Dual objective     =           798.282804
Iteration: 31821   Dual objective     =           798.284178
Iteration: 33289   Dual objective     =           798.285812
Iteration: 34719   Dual objective     =           798.287954
Iteration: 36115   Dual objective     =           798.290407
Iteration: 37389   Dual objective     =           799.064887
Iteration: 38804   Dual objective     =           799.237551
Iteration: 40185   Dual objective     =           799.240023
Iteration: 41186   Dual objective     =           800.004886
Iteration: 42493   Dual objective     =           800.178171
Iteration: 43835   Dual objective     =           800.181061
Iteration: 44462   Dual objective     =           801.106357
Iteration: 45910   Dual objective     =           806.863351
Iteration: 46284   Dual objective     =           807.063712
Iteration: 48441   Dual objective     =           815.479631
Iteration: 48753   Dual objective     =           816.416415
Iteration: 50687   Dual objective     =           824.717143
Iteration: 51634   Dual objective     =           824.909341
Iteration: 52832   Dual objective     =           825.748949
Iteration: 53253   Dual objective     =           826.205628
Iteration: 55378   Dual objective     =           834.750730
Iteration: 56662   Dual objective     =           835.118082
Iteration: 57725   Dual objective     =           847.549591
Iteration: 58625   Dual objective     =           861.511571
Iteration: 59838   Dual objective     =           862.365415
Iteration: 60860   Dual objective     =           876.525822
Iteration: 61809   Dual objective     =           880.203386
Iteration: 62798   Dual objective     =           886.990015
Iteration: 63707   Dual objective     =           897.409640
Iteration: 64572   Dual objective     =           912.577541
Iteration: 65385   Dual objective     =           927.854692
Iteration: 66052   Dual objective     =           928.100102
Iteration: 66885   Dual objective     =           943.288359
Iteration: 67574   Dual objective     =           957.235303
Iteration: 68506   Dual objective     =           972.986888
Iteration: 69313   Dual objective     =           981.073640
Iteration: 70339   Dual objective     =           982.104097
Iteration: 71042   Dual objective     =           992.343158
Iteration: 71613   Dual objective     =          1000.109609
Iteration: 72176   Dual objective     =          1006.560201
Elapsed time = 3.89 sec. (10000.86 ticks, 72893 iterations)
Iteration: 72915   Dual objective     =          1011.611601
Removing perturbation.

Barrier solved model.


--- LP status (1): optimal.
--- Cplex Time: 4.67sec (det. 4635.77 ticks)


Optimal solution found
Objective:         1011.920991

--- Reading solution for model stochastic_solar
--- Executing after solve: elapsed 0:00:05.230
--- _6ff680fe-196c-4110-b55b-a351e7eab401.gms(242) 50 Mb
--- _6ff680fe-196c-4110-b55b-a351e7eab401.gms(300) 50 Mb
--- GDX File /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpc2yqq774/_6ff680fe-196c-4110-b55b-a351e7eab401out.gdx
*** Status: Normal completion
--- Job _6ff680fe-196c-4110-b55b-a351e7eab401.gms Stop 10/17/24 12:08:20 elapsed 0:00:05.269
