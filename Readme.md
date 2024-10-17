
# Overview

Very simple Energy Planning Stochastic Model to estimate the marginal impact of an additional 1 kW demand. 

# Installation

1. **Open Terminal** and create a new environment with Python 3.8:
   ```bash
   conda create -n epm_wb python=3.8
   ```

2. **Activate the environment**:
   ```bash
   conda activate epm_wb
   ```

3. **Install packages**:
   ```bash
   conda install pandas
   pip install gamspy
   ```

# Method

## Post-treatment of Wind Data 

Renewable Ninja.
Location Kanaganapalle, Andhra Pradesh
 Gamesa G114 2.0 MW turbine with hub height of 106 Mts and nameplate capacity of 2000 KW

- Extract historical period. 
- Calculate average Capacity Utilization Factor (CUF).
- Scale RE data with



## Limitation

Wind generation data:
- La Nina effect which often makes it difficult to predict the estimated generation of any wind project as an annual or seasonal basis
- Wind turbines often have limited slip differential type technologies which provide extra output at peak output (since the generators are always oversized - 2.1 MW rated capacity vs 2.25 MW actual generator rating is common).

Solar generation data:
- Solar fields are often oversized by 40% to maximise revenue, especially in E-reverse auction type procurement models.