----------------------------------------------------------------------------------
-- Company:
-- Engineer: ANIRUDH DINESH
--
-- Create Date:    19:31:49 12/01/2016
-- Design Name: 	INSTRUCTION MEMORY MODULE
-- Module Name:    instruction_memory - Behavioral
-- Project Name:  FINAL PROJECT ACHD
-- Target Devices:
-- Tool versions:
-- Description: OUTPUT ADDOUTPUT BECOMES AVAILABLE AT THE NEXT CLOCK EDGE.
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_memory is
port ( clr : IN STD_LOGIC;
		 input_address_instruction_mem: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		 output_instruction_mem: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		 );

end instruction_memory;



architecture Behavioral of instruction_memory is
TYPE rom IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(31 DOWNTO 0); --Change 3 to however many instructions need to be stored in memory. 3 is only for testing.
-- CONSTANT ins_mem: rom:= (others => (others => '0'));  -- comment this line only for testing. otherwise, put the instructions in this array
CONSTANT ins_mem: rom:= rom'("00000100000000010000000000000010" ,"00000100000000110000000000001010", "00000100000001000000000000001110" , "00000100000001010000000000000010" ,"00100000011000110000000000000001" ,"00000000011001000010000000010001" ,"00001000000001000000000000000001" ,"00000000011000100010000000010010" ,"00001100010001000000000000001010","00000000011000100010000000010011","00011100011000100000000000000001","00010000010001000000000000001010", "00000000011000100010000000010100" ,"00010100010001000000000000001010","00011000010001000000000000001010", "00100000001001000000000000000010", "00101000000001011111111111111110","00100100100001011111111111111110","00101100100001010000000000000000" ,"00110000000000000000000000010110" ,"11111100000000000000000000000000");       ); -- Used only for testing (currently using test case 2 from pdf uploaded in newclasses (7 + 8 = 15). Otherwise, comment this line
SIGNAL ins: STD_LOGIC_VECTOR(31 DOWNTO 0):= (others => '0');

-- DESIGN: INSTRUCTION BECOMES AVAILABLE ON OUTPUT LINE AT THE NEXT CLOCK EDGE.
begin
process (input_address_instruction_mem, clr)
begin

		if(clr = '1') then
			output_instruction_mem (31 DOWNTO 0) <= (others => '0');
		else
			output_instruction_mem (31 DOWNTO 0) <= ins_mem (conv_integer(input_address_instruction_mem));
		end if;

end process;


end Behavioral;
