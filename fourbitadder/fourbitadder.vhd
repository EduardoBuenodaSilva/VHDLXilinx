----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:33:56 12/27/2025 
-- Design Name: 
-- Module Name:    fourbitadder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use work.fulladder1bit.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fourbitadder is
	 port(CLK : in std_logic;
		  KEY1 : in  std_logic;
		  KEY2 : in  std_logic;
		  KEY3 : in  std_logic;
		  KEY4 : in  std_logic;
		  LED  : out  std_logic_vector(3 downto 0));
	
end fourbitadder;

architecture Behavioral of fourbitadder is
	--When pressed adds one to holder
	signal add1bit : std_logic := '0';
	
	--When pressed the value of the holder goes directly to output
	signal shvalue : std_logic;
	
	--When pressed adds the new value in the holder with the old value
	signal addup 	: std_logic := '0';
		
	--Reset the registers
	signal reset 	: std_logic := '0';
	
	
	--Holds the the incremental press of the button
	signal holder  : std_logic_vector(3 downto 0) := "0000";
	
	--Holds the value of holder when addup is pressed
	signal oldvalue: std_logic_vector(3 downto 0) := "0000";
	
	--Adds the value with the new value when addup is pressed
	signal newvalue  : std_logic_vector(3 downto 0) := "0000";
	
	--sginal for perform the addition
	signal carry 	: std_logic_vector(4 downto 0) := "00000";
	
	--Memory for last state;
	--signal buttonmem : std_logic_vector(2 downto 0) := "000";
	

	
begin
	
	--The preset of the input values
	carry(0) <= '0';

	process(CLK)
	--Number for debounce
	variable debounceb1 : integer range 0 to 50000 := 0;
	variable debounceb2 : integer range 0 to 50000 := 0;
	
	--Constant for debounce
	constant debounce_max : integer := 49998;
	
	begin
		if rising_edge(CLK) then
			if KEY1 = '0' then
				if debounceb1 < 50000 then
					debounceb1 := debounceb1 + 1;
				end if;

				if debounceb1 = debounce_max then
					add1bit <= '1';
				else
					add1bit <= '0';
				end if;
			else
				debounceb1 := 0;
				add1bit <= '0';
			end if;
			
			if KEY2 = '0' then
				if debounceb2 < 50000 then
					debounceb2 := debounceb2 + 1;
				end if;

				if debounceb2 = debounce_max then
					addup <= '1';
				else
					addup <= '0';
				end if;
			else
				debounceb2 := 0;
				addup <= '0';
			end if;
			
			if KEY3 = '0' then
				shvalue <= '1';
			else
				shvalue <= '0';
			end if;
			
			if KEY4 = '0' then
				reset <= '1';
			else
				reset <= '0';
			end if;
		end if;
	end process;
	
	gen_adders : for i in 0 to 3 generate
		fa_inst : fulladder
			port map(cin => carry(i),
						x => holder(i),
						y => oldvalue(i),
						s => newvalue (i),
						cout => carry(i+1));	
	end generate;
	
	
	
	process(CLK)
	begin
		if rising_edge(CLK) then
			if reset = '1' then
				holder <= "0000";
			elsif add1bit = '1' then
				holder <= std_logic_vector(unsigned(holder) + 1);
			else
				holder <= holder; -- explicit hold (optional but clarifies intent)
			end if;
		
			 if reset = '1' then
				  oldvalue <= "0000";
			 elsif addup = '1' then
				  oldvalue <= newvalue;
			 else
				  oldvalue <= oldvalue;
			 end if;
		end if;
	end process;
	

	
	--Output
	LED <= holder when shvalue = '1' else newvalue;
	
end Behavioral;

	