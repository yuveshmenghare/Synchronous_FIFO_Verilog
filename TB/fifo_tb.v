`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] buf_in;

wire [7:0] buf_out;
wire buf_empty;
wire buf_full;
wire [7:0] fifo_cnt;

fifo dut(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .buf_in(buf_in),
    .buf_out(buf_out),
    .buf_empty(buf_empty),
    .buf_full(buf_full),
    .fifo_cnt(fifo_cnt)
);

always #5 clk = ~clk;

integer i;

initial
begin

    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    buf_in = 0;

    //------------------------------
    // RESET
    //------------------------------
    #20;
    rst = 0;

    //------------------------------
    // WRITE TEST
    //------------------------------
    repeat(4)
    begin
        @(posedge clk);
        wr_en = 1;
        buf_in = buf_in + 8'd10;
    end

    @(posedge clk);
    wr_en = 0;

    //------------------------------
    // READ TEST
    //------------------------------
    repeat(4)
    begin
        @(posedge clk);
        rd_en = 1;
    end

    @(posedge clk);
    rd_en = 0;

    //------------------------------
    // SIMULTANEOUS READ WRITE
    //------------------------------
    @(posedge clk);
    wr_en = 1;
    rd_en = 1;
    buf_in = 8'hAA;

    @(posedge clk);
    wr_en = 0;
    rd_en = 0;

    //------------------------------
    // FULL CONDITION
    //------------------------------
    for(i=0;i<64;i=i+1)
    begin
        @(posedge clk);
        wr_en = 1;
        buf_in = i;
    end

    @(posedge clk);
    wr_en = 0;

    //------------------------------
    // EMPTY CONDITION
    //------------------------------
    for(i=0;i<64;i=i+1)
    begin
        @(posedge clk);
        rd_en = 1;
    end

    @(posedge clk);
    rd_en = 0;

    #50;
    $finish;

end

endmodule
