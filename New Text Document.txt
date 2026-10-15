testbench.vhd
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 5
--
-- Create Date: 11:41:02 11/12/2025 
-- Design Name: 
-- Module Name: testbench - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
// Verilog Testbench for Digital Lock
`timescale 1ns/1ps
module tb_digital_lock;
 // Signals for inputs and outputs
 reg clk;
 reg reset;
 reg [3:0] key_input;
 wire locked;
 wire unlocked;
 // Instantiate the Digital Lock Module
 digital_lock DUT (
 .clk(clk), 6
 .reset(reset),
 .key_input(key_input),
 .locked(locked),
 .unlocked(unlocked)
 );
 // Clock generation
 initial clk = 0;
 always #5 clk = ~clk; // 100 MHz clock
// Test sequence
 initial begin
 reset = 1; key_input = 0;
 #10 reset = 0;
 
 // Enter correct code sequence (example 1-2-3-4)
 key_input = 4'b0001; #10;
 key_input = 4'b0010; #10;
 key_input = 4'b0011; #10;
 key_input = 4'b0100; #10;
// Wait and check outputs
 #20;
 $display("Locked = %b, Unlocked = %b", locked, unlocked);
 
 // Enter incorrect code sequence
 key_input = 4'b0101; #10;
 key_input = 4'b0110; #10;
 #20;
 $display("Locked = %b, Unlocked = %b", locked, unlocked);
 
 $stop;
 end 7
endmodule