--- Job _aa0cefc1-9b8d-424b-8b04-54860e44795b.gms Start 10/22/24 14:26:42 47.6.0 c2de9d6d DEX-DEG x86 64bit/macOS
--- Applying:
    /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/gmsprmun.txt
--- GAMS Parameters defined
    Input /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpcqlc0fzr/_aa0cefc1-9b8d-424b-8b04-54860e44795b.gms
    Output /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpcqlc0fzr/_aa0cefc1-9b8d-424b-8b04-54860e44795b.lst
    ScrDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpcqlc0fzr/tmp8r2pq4ph/
    SysDir /Users/lucas/opt/anaconda3/envs/epm_wb/lib/python3.8/site-packages/gamspy_base/
    LogOption 3
    Trace /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpcqlc0fzr/_aa0cefc1-9b8d-424b-8b04-54860e44795b.txt
    License "/Users/lucas/Library/Application Support/GAMSPy/gamspy_license.txt"
    OptDir /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpcqlc0fzr/
    LimRow 0
    LimCol 0
    TraceOpt 3
    GDX /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpcqlc0fzr/_aa0cefc1-9b8d-424b-8b04-54860e44795bout.gdx
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
--- _aa0cefc1-9b8d-424b-8b04-54860e44795b.gms(67) 4 Mb
--- Starting execution: elapsed 0:00:00.001
--- Generating LP model deterministic_400
--- _aa0cefc1-9b8d-424b-8b04-54860e44795b.gms(406) 4 Mb
---   769 rows  389 columns  2,241 non-zeroes
--- Range statistics (absolute non-zero finite values)
--- RHS       [min, max] : [ 8.630E-01, 3.253E+06] - Zero values observed as well
--- Bound     [min, max] : [        NA,        NA] - Zero values observed as well
--- Matrix    [min, max] : [ 1.000E-03, 3.285E+05]
--- Executing CPLEX (Solvelink=2): elapsed 0:00:00.007

IBM ILOG CPLEX   47.6.0 c2de9d6d Sep 12, 2024          DEG x86 64bit/macOS    

--- GAMS/CPLEX licensed for continuous and discrete problems.
--- GMO setup time: 0.00s
--- Space for names approximately 0.03 Mb
--- Use option 'names no' to turn use of names off
--- GMO memory 0.63 Mb (peak 0.63 Mb)
--- Dictionary memory 0.00 Mb
--- Cplex 22.1.1.0 link memory 0.02 Mb (peak 0.08 Mb)
--- Starting Cplex

Version identifier: 22.1.1.0 | 2022-11-28 | 9160aff4d
CPXPARAM_Advance                                 0
CPXPARAM_MIP_Display                             4
CPXPARAM_MIP_Pool_Capacity                       0
CPXPARAM_MIP_Tolerances_AbsMIPGap                0
Tried aggregator 1 time.
LP Presolve eliminated 270 rows and 114 columns.
Aggregator did 26 substitutions.
Reduced LP has 472 rows, 249 columns, and 1311 nonzeros.
Presolve time = 0.00 sec. (0.73 ticks)
Initializing dual steep norms . . .

Iteration log . . .
Iteration:     1   Dual objective     =             0.000000
Iteration:    62   Dual objective     =           228.940389
Iteration:   124   Dual objective     =           353.104566
Iteration:   186   Dual objective     =           380.700810

--- LP status (1): optimal.
--- Cplex Time: 0.01sec (det. 4.43 ticks)


Optimal solution found
Objective:          383.345671

--- Reading solution for model deterministic_400
--- Executing after solve: elapsed 0:00:00.067
--- _aa0cefc1-9b8d-424b-8b04-54860e44795b.gms(468) 4 Mb
--- GDX File /var/folders/p9/3r4_fgzd72j7b469xxshgfnh0000gn/T/tmpcqlc0fzr/_aa0cefc1-9b8d-424b-8b04-54860e44795bout.gdx
*** Status: Normal completion
--- Job _aa0cefc1-9b8d-424b-8b04-54860e44795b.gms Stop 10/22/24 14:26:42 elapsed 0:00:00.067
