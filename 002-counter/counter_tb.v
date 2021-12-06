/* Make Verilog Testbench RTL Diagram
Copyright (C) 2021 Make Verilog Testbench RTL Diagram Authors.
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
==============================================================================*/

`timescale 1ns / 100fs

module counter_tb;
    localparam width = 4;

    reg clk;
    reg rstn;
    wire [width - 1:0] out;

    always #1 clk = ~clk;
    
    counter #(
        .width (width)
    ) COUNTER (
        .clk(clk),
        .rstn(rstn),
        .out(out)
    );

    initial begin
        $display("Initialize to 0.");
        clk = 0;
        rstn = 0;

        $monitor ("[%0t] rstn=0x%0h out=0x%0h", $time, rstn, out);

        #10 rstn <= 1;
        #30 rstn <= 0;
        #70 rstn <= 1;
        #95 rstn <= 0;

        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb); // all vars dump

        #100 $finish;
    end 

endmodule
