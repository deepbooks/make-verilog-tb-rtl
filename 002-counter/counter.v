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

`timescale 1ns/10ps

module counter # (
    parameter width = 4
) (
        input   clk,
        input   rstn,
        output  reg [width - 1:0]       out
);
    always @ (posedge clk) begin
        if (!rstn) begin
            out <= out + 1;
        end else
            out <= 0;
    end

endmodule
