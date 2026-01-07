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

package DebouncerPack is

	component debouncer
		port(CLK: in std_logic;
		  Button: in std_logic; 
		  PullType: in std_logic;
		  OnePulse: out std_logic); 
	end component;

end DebouncerPack;