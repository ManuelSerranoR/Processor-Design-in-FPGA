----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:51:48 12/02/2016 
-- Design Name: 
-- Module Name:    register-file - RTL 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_file is
port ( R1 : in std_logic_vector(4 downto 0);
       R2 : in std_logic_vector(4 downto 0);
       Rw : in std_logic_vector(4 downto 0);
       RegWr : in std_logic;
       clk : in std_logic;
		 clr : in std_logic;
       RegWrVal:in std_logic_vector(31 downto 0);
       op1 : out std_logic_vector(31 downto 0);
       op2 : out std_logic_vector(31 downto 0));
end register_file;

architecture RTL of register_file is

type reg_file is array (31 downto 0) of std_logic_vector(31 downto 0);
signal regarr:reg_file;

begin

process(clk,clr,R1,R2,Rw,RegWr,RegWrVal)

begin


op1 <= regarr(CONV_INTEGER(R1));
op2 <= regarr(CONV_INTEGER(R2));
	
if (clk'EVENT and clk = '1') then
		if (clr = '1') then
			regarr(31 downto 0)<=(x"00000000",x"00000000",x"00000000",x"00000000",
									x"00000000",x"00000000",x"00000000",x"00000000",
									x"00000000",x"00000000",x"00000000",x"00000000",
									x"00000000",x"00000000",x"00000000",x"00000000",
									x"00000000",x"00000000",x"00000000",x"00000000",
									x"00000000",x"00000000",x"00000000",x"00000000",
									x"00000000",x"00000000",x"00000000",x"00000000",
									x"00000000",x"00000000",x"00000000",x"00000000");
									
			op1 <= (others => '0');
			op2 <= (others => '0');
		
		elsif (clr = '0') then
			
			if (RegWr = '1') then
				regarr(CONV_INTEGER(Rw)) <= RegWrVal;
			end if;
		
		end if;

end if;


end process;

end RTL;

