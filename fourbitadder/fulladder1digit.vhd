--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package fulladder1bit is
	
	component fulladder
		port( cin, x, y : IN STD_LOGIC;
		   s, cout: OUT std_logic);
	end component;

end fulladder1bit;
