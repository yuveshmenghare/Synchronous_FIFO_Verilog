// ==========================================================
// Project : Synchronous FIFO
// Author  : Yuvesh R Menghare
//
// Description:
// This FIFO stores data in First-In First-Out order.
// Data written first will be read first.
//
// Features:
// - 64 locations
// - 8-bit data width
// - Single clock operation
// - Full and Empty indication
// - Simultaneous read/write support
// ==========================================================

module fifo(
    input clk,
    input rst,

    input wr_en,
    input rd_en,

    input [7:0] buf_in,

    output reg [7:0] buf_out,
    output reg buf_empty,
    output reg buf_full,

    output reg [7:0] fifo_cnt
);

reg [7:0] memory [63:0];

reg [5:0] write_ptr;
reg [5:0] read_ptr;

always @(fifo_cnt)
begin
    buf_empty = (fifo_cnt == 0);
    buf_full  = (fifo_cnt == 64);
end

always @(posedge clk or posedge rst)
begin
    if(rst)
        fifo_cnt <= 0;

    else begin

        if(wr_en && !buf_full && rd_en && !buf_empty)
            fifo_cnt <= fifo_cnt;

        else if(wr_en && !buf_full)
            fifo_cnt <= fifo_cnt + 1;

        else if(rd_en && !buf_empty)
            fifo_cnt <= fifo_cnt - 1;

        else
            fifo_cnt <= fifo_cnt;
    end
end

always @(posedge clk or posedge rst)
begin
    if(rst)
        buf_out <= 0;

    else if(rd_en && !buf_empty)
        buf_out <= memory[read_ptr];
end

always @(posedge clk)
begin
    if(wr_en && !buf_full)
        memory[write_ptr] <= buf_in;
end

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        write_ptr <= 0;
        read_ptr  <= 0;
    end

    else begin

        if(wr_en && !buf_full)
        begin
            if(write_ptr == 63)
                write_ptr <= 0;
            else
                write_ptr <= write_ptr + 1;
        end

        if(rd_en && !buf_empty)
        begin
            if(read_ptr == 63)
                read_ptr <= 0;
            else
                read_ptr <= read_ptr + 1;
        end

    end
end

endmodule
