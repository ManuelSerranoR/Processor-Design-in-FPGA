----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:08:57 12/02/2016 
-- Design Name: 
-- Module Name:    sign_extension - Behavioral 
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

entity sign_extension is
port ( input_data_sign_extend: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		 clr : IN STD_LOGIC;
		 output_data_sign_extend: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		 );
end sign_extension;

architecture Behavioral of sign_extension is
SIGNAL MS_Bit: STD_LOGIC:= '0';
SIGNAL temp_0: STD_LOGIC_VECTOR (31 DOWNTO 0):= (others => '0');
SIGNAL temp_1: STD_LOGIC_VECTOR (31 DOWNTO 0):= (others => '1');
SIGNAL temp_out: STD_LOGIC_VECTOR (31 DOWNTO 0):= (others => '0');
begin

process(clr,input_data_sign_extend)
begin
temp_0 (15 DOWNTO 0) <= input_data_sign_extend(15 DOWNTO 0);
temp_1 (15 DOWNTO 0) <= input_data_sign_extend(15 DOWNTO 0);

	if(clr = '1') then
		MS_Bit <= '0';
		output_data_sign_extend (31 DOWNTO 0) <= (others => '0');
	else
		if(input_data_sign_extend(15) = '0') then
			output_data_sign_extend (31 DOWNTO 0) <= temp_0 (31 DOWNTO 0);
		else
			output_data_sign_extend (31 DOWNTO 0) <= temp_1 (31 DOWNTO 0);
		end if;
	end if;

end process;



			

end Behavioral;

