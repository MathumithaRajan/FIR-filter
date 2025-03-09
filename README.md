# **FIR FILTER**

## Objective:
This project aims to design a low-pass FIR filter in Verilog. 

## Instructions to run
**Step 1:** Getting the Filter coefficients from MATLAB 
To obtain the filter coefficients, MATLAB’s FDA Tool is used. It can be accessed using the following command - filterDesigner

![MATLAB FDA Tool](https://raw.githubusercontent.com/MathumithaRajan/FIR-filter/main/Results/matlab_fda.jpg)

This opens a graphical interface (as shown below) where the filter parameters can be configured and export the coefficients 

we are using Fixed fixed-point arithmetic so let us apply some other preprocessing steps before using these values
1.	Replace all negative values with zeros.
2.	Scale all numbers by a factor of 255. This number was chosen because all coefficients had to be represented in 8 bits according to the specifications
3.	Round all numbers to the nearest integer.

**Step 2**: Generating test signal   
Generate a noisy data sequence (or noisy sine wave) using MATLAB that the FIR filter will filter. 
Save the test data, as a file to be used for the testbench

**Step 3:** Implement the FIR filter in Verilog 

The FIR filter is implemented in Verilog, where we translate the designed filter coefficients into hardware logic. The core design consists of:

•	Delay elements to store past input samples.

•	Multipliers to multiply the filter coefficients and inputs

•	Adders to sum the weighted values.

**Step 4:** Write the test bench and set up the test bench environment 

To validate the FIR filter’s performance, we write a Verilog testbench that does the following:

•	Reads the noisy signal test data from a file and stores it in a memory array (RAMM).

•	Feeds the test signal into the FIR filter by sequentially reading data from memory. 

•	Captures the FIR filter’s output and writes it to a file for verification.

This ensures that the filter correctly removes noise while preserving the desired signal.

## Simulation 

![SIm_results](https://github.com/MathumithaRajan/FIR-filter/blob/main/Results/sim.jpg)

## Future Work

While this project successfully demonstrates the fundamentals of digital filtering using a Direct Form-I FIR filter in Verilog, several optimizations can enhance its performance. Future improvements include:

Optimized Arithmetic Units: Implementing more efficient adders such as Carry-Select Adders (CSAs) or Approximate Adders, alongside advanced multipliers like the Booth Multiplier or Approximate Multipliers, can significantly reduce computational latency and hardware complexity. Carefully introducing approximation techniques in select areas can help balance precision and efficiency.

Pipelining and Parallelism: Incorporating pipelining and parallel computation can improve throughput by enabling multiple operations to be executed simultaneously. This would lead to reduced processing delays and enhanced performance in high-speed digital applications.

Adaptive Filtering: Implementing adaptive filtering techniques where filter coefficients dynamically adjust based on the input signal characteristics can make the system more robust for real-time applications. This is particularly beneficial for speech enhancement, biomedical signal processing, and noise cancellation.

