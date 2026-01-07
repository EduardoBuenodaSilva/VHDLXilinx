----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:32 01/07/2026 
-- Design Name: 
-- Module Name:    Debouncer - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Debouncer is
	
	port(CLK: in std_logic;
		  Button: in std_logic; 
		  PullType: in std_logic;
		  OnePulse: out std_logic); 
		  
		  --PullType 0 if pull down e 1 if pull up 
	
end Debouncer;

architecture Behavioral of Debouncer is

begin

process(CLK)
	--Number for debounce
	variable debounceb1 : integer range 0 to 50000 := 0;
	
	--Constant for debounce
	constant debounce_max : integer := 49998;
	
	begin
		if rising_edge(CLK) then
			if (Button = '0' and PullType = '0') or (Button = '1' and PullType = '1') then
				if debounceb1 < 50000 then
					debounceb1 := debounceb1 + 1;
				end if;

				if debounceb1 = debounce_max then
					OnePulse <= '1';
				else
					OnePulse <= '0';
				end if;
			else
				debounceb1 := 0;
				OnePulse <= '0';
			end if;
		end if;
	end process;
	

end Behavioral;

