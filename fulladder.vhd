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
	port( KEY1, KEY2, KEY3 : IN STD_LOGIC;
		   LED : OUT STD_LOGIC_VECTOR(1 downto 0));
end fulladder;

architecture Behavioral of fulladder is
	signal cin, x, y: std_logic;
	signal s, cout: std_logic;
	
	--cin Carry in
	--x first bit
	--y second bit
	
	--s sum bit
	--cout carry out
begin
	cin <= not KEY1;
	x <= not KEY2;
	Y <= not KEY3;
	
	s <= (x xor y xor cin);
	cout <= (x and y) or (x and cin) or (y and cin);
	
	LED(0) <= s;
	LED(1) <= cout;

end Behavioral;

