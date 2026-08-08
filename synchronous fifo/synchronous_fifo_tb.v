`timescale 1ns/1ps

module synchronous_fifo_tb;

reg clk;
reg rst;

reg wr_en;
reg rd_en;

reg [7:0] din;
wire [7:0] dout;

wire full;
wire empty;

//---------------------------------------------------------
// DUT
//---------------------------------------------------------

synchronous_fifo uut (

    .clk(clk),
    .rst(rst),

    .wr_en(wr_en),
    .rd_en(rd_en),

    .din(din),
    .dout(dout),

    .full(full),
    .empty(empty)

);

//---------------------------------------------------------
// Clock Generation
//---------------------------------------------------------

initial begin
    clk = 0;

    forever #5 clk = ~clk;
end

//---------------------------------------------------------
// Test Sequence
//---------------------------------------------------------

initial begin

    $display("---------------------------------------------");
    $display("        SYNCHRONOUS FIFO TESTBENCH");
    $display("---------------------------------------------");

    $monitor(
        "Time=%0t | WR=%b RD=%b DIN=%h DOUT=%h FULL=%b EMPTY=%b",
        $time,
        wr_en,
        rd_en,
        din,
        dout,
        full,
        empty
    );

    // Reset
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    din = 0;

    #20;

    rst = 0;

    //-----------------------------------------------------
    // Write data
    //-----------------------------------------------------

    @(posedge clk);
    wr_en = 1;
    din = 8'h10;

    @(posedge clk);
    din = 8'h20;

    @(posedge clk);
    din = 8'h30;

    @(posedge clk);
    din = 8'h40;

    @(posedge clk);
    wr_en = 0;
    din = 0;

    //-----------------------------------------------------
    // Read data
    //-----------------------------------------------------

    @(posedge clk);
    rd_en = 1;

    @(posedge clk);

    @(posedge clk);

    @(posedge clk);

    @(posedge clk);
    rd_en = 0;

    #20;

    $display("---------------------------------------------");
    $display("             SIMULATION COMPLETE");
    $display("---------------------------------------------");

    $finish;

end

endmodule