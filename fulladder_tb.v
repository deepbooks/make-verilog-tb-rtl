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

`timescale 1ns / 10ps

module fulladd_tb;
    localparam width = 2;
    // 1. Declare testbench variables
    reg [width:0] a;
    reg [width:0] b;
    reg c_in;
    wire [width:0] sum;
    integer i;

    // 2. Instantiate the design and connect to testbench variables
    fulladd #(
        .width (width)
    ) fa0 (
        .a (a),
        .b (b),
        .c_in (c_in),
        .c_out (c_out),
        .sum (sum)
    );

    // 3. Provide stimulus to test the design
   initial begin
        a <= 0;
        b <= 0;
        c_in <= 0;

        $monitor ("a=0x%0h b=0x%0h c_in=0x%0h c_out=0x%0h sum=0x%0h", a, b, c_in, c_out, sum);

        // Use a for loop to apply random values to the input
        for (i = 0; i < 5; i = i+1) begin
            #10 a <= $random;
                b <= $random;
                    c_in <= $random;
        end

        $dumpfile("fulladder_tb.vcd");
        $dumpvars(0, fulladd_tb); // all vars dump

        #50 $finish;
    end
endmodule