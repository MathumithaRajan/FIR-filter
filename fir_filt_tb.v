module FIR_TB; 

    // Declare testbench signals
    reg clk, reset;
    reg [7:0] data_in;
    wire [16:0] data_out;

    // Instantiate FIR filter module
    filter inst0(clk, reset, data_in, data_out);  // Ensure module name matches

    // Define RAM to store input sine wave data
    reg [7:0] RAMM [300:0]; // 8-bit memory storage

    // Read data from file into RAM
    initial begin
        $readmemb("noisy_signal_testData.data", RAMM);
    end
 
    // Generate clock signal (50 MHz)
    initial clk = 0;
    always #10 clk = ~clk;  // 10ns period -> 50MHz clock

    // Reset the filter at startup
    initial begin
        reset = 1;  // Assert reset
        #50 reset = 0;  // Deassert reset after 50ns
    end

    // Address counter to read data sequentially
    reg [4:0] Address;
    initial Address = 0;
    
    always @(posedge clk) begin
        if (Address == 31)
            Address <= 0;
        else
            Address <= Address + 1;
    end

    // Read RAM data and send to filter
    always @(posedge clk) begin
        data_in <= RAMM[Address];
    end
endmodule
