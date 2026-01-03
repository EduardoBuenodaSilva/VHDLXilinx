----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:34 12/27/2025 
-- Design Name: 
-- Module Name:    fulladder - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
	port( cin, x, y : IN STD_LOGIC;
		   s, cout: OUT std_logic);
end fulladder;

architecture Behavioral of fulladder is	
	--cin Carry in
	--x first bit
	--y second bit
	
	--s sum bit
	--cout carry out
begin
	
	s <= (x xor y xor cin);
	cout <= (x and y) or (x and cin) or (y and cin);
	
end Behavioral;

