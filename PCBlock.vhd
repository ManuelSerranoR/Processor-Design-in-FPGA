----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:11 12/02/2016 
-- Design Name: 
-- Module Name:    PCBlock - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCBlock is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  in_address_imm : in STD_LOGIC_VECTOR (25 downto 0);
			  in_data_imm_sgnext : in STD_LOGIC_VECTOR (31 downto 0);
           in_sel_mux_jmp : in  STD_LOGIC;
           in_sel_mux_brnch : in  STD_LOGIC;
           in_sel_mux_halt : in  STD_LOGIC;
           pc : out  STD_LOGIC_VECTOR (31 downto 0));
end PCBlock;

architecture Behavioral of PCBlock is

signal nxt_pc, pcp0, pcp1  : STD_LOGIC_VECTOR (31 downto 0);
begin

--flop of pc
process (clk, clr, nxt_pc)
begin
if (clk' event and clk = '1' ) then
	 if (clr = '1' ) then pcp0 <= x"00000000";
	 else pcp0 <= nxt_pc;
	 end if;
end if;

end process;

pcp1 <= pcp0 + '1';

process (in_sel_mux_jmp, in_sel_mux_brnch, in_sel_mux_halt, in_data_imm_sgnext, pcp1, pcp0, in_address_imm)
begin

if ( in_sel_mux_jmp = '0' and in_sel_mux_brnch = '0' and in_sel_mux_halt = '0' ) then nxt_pc <= pcp1;
elsif ( in_sel_mux_jmp = '1' ) then nxt_pc <= pcp1(31 downto 28) & in_address_imm & "00";
elsif (in_sel_mux_brnch = '1' ) then nxt_pc <= pcp1 + in_data_imm_sgnext ;
elsif (in_sel_mux_halt = '1' ) then nxt_pc <= pcp0;
else nxt_pc <= pcp1;

end if;

end process;

pc <= pcp0;

end Behavioral;

