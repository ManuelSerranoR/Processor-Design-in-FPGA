----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:46 11/25/2016 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( in_data_oprnd1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in_data_oprnd_Rt : in  STD_LOGIC_VECTOR (31 downto 0);
           in_data_imm_sgnext : in  STD_LOGIC_VECTOR (31 downto 0);
           in_sel_mux_oprnd2 : in  STD_LOGIC;
           in_sel_mux_neg : in  STD_LOGIC;
           in_sel_mux_andor : in  STD_LOGIC;
           in_sel_mux_wb : in  STD_LOGIC_VECTOR (1 downto 0);
           in_sel_mux_brnch : in  STD_LOGIC_VECTOR (1 downto 0);
           out_data_wb : out  STD_LOGIC_VECTOR (31 downto 0);
           out_sel_brnch2pc : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

signal sig_data_oprnd2, sig_data_addsub, sig_data_ornor, sig_data_andor, sig_data_addinp2, sig_data_and, 
			sig_data_rshft, sig_data_lshft, sig_data_imm_sgnext : STD_LOGIC_VECTOR (31 downto 0);
signal sig_comp_less, sig_comp_eq, sig_comp_nteq : STD_LOGIC;

begin

--calculating operand 2
----sign extention begin
--process ( in_data_imm(15) )
--begin
-- if ( in_data_imm(15) = '1' ) then sig_data_imm_sgnext( 31 downto 16) <= x"FFFF";
-- else sig_data_imm_sgnext( 31 downto 16) <= x"0000";
-- end if;
--end process;
--
--sig_data_imm_sgnext( 15 downto 0) <= in_data_imm;
----sign extention end

process ( in_data_imm_sgnext, in_data_oprnd_Rt, in_sel_mux_oprnd2 )
begin
	if ( in_sel_mux_oprnd2 = '1' ) then sig_data_oprnd2 <= in_data_imm_sgnext;
	else sig_data_oprnd2 <= in_data_oprnd_Rt;
	end if;
end process;

--calculated opreand 2

--adder substraction block

process (sig_data_oprnd2, in_data_oprnd1, in_sel_mux_neg, sig_data_addinp2 )
begin
	if ( in_sel_mux_neg = '1' ) then sig_data_addinp2 <= not (sig_data_oprnd2) + '1';
	else sig_data_addinp2 <= sig_data_oprnd2;
	end if;
	
	sig_data_addsub <= in_data_oprnd1 + sig_data_addinp2;
end process;
--adder block ends

--and or block

process (sig_data_oprnd2, in_data_oprnd1, in_sel_mux_neg, sig_data_ornor, in_sel_mux_andor)	
begin
 if ( in_sel_mux_neg = '1') then sig_data_ornor <= sig_data_oprnd2 nor in_data_oprnd1;
 else sig_data_ornor <= sig_data_oprnd2 or in_data_oprnd1;
 end if;
 
 if (in_sel_mux_andor = '1' ) then sig_data_andor <= sig_data_ornor;
 else sig_data_andor <= sig_data_oprnd2 and in_data_oprnd1;
 end if;
end process;

--end of and or block

-- shifter blocks
--left shift

with in_data_imm_sgnext( 4 downto 0) select
sig_data_lshft <= in_data_oprnd1 when "00000",
	in_data_oprnd1( 30 downto 0 ) & '0' when "00001",
	in_data_oprnd1(29 downto 0) & "00" when "00010",
	in_data_oprnd1(28 downto 0) & "000" when "00011",
	in_data_oprnd1(27 downto 0) & "0000" when "00100",
	in_data_oprnd1(26 downto 0) & "00000" when "00101",
	in_data_oprnd1(25 downto 0) & "000000" when "00110",
	in_data_oprnd1(24 downto 0) & "0000000" when "00111",
	in_data_oprnd1(23 downto 0) & "00000000" when "01000",
	in_data_oprnd1(22 downto 0) & "000000000" when "01001",
	in_data_oprnd1(21 downto 0) & "0000000000" when "01010",
	in_data_oprnd1(20 downto 0) & "00000000000" when "01011",
	in_data_oprnd1(19 downto 0) & "000000000000" when "01100",
	in_data_oprnd1(18 downto 0) & "0000000000000" when "01101",
	in_data_oprnd1(17 downto 0) & "00000000000000" when "01110",
	in_data_oprnd1(16 downto 0) & "000000000000000" when "01111",
	in_data_oprnd1(15 downto 0) & "0000000000000000" when "10000",
	in_data_oprnd1(14 downto 0) & "00000000000000000" when "10001",
	in_data_oprnd1(13 downto 0) & "000000000000000000" when "10010",
	in_data_oprnd1(12 downto 0) & "0000000000000000000" when "10011",
	in_data_oprnd1(11 downto 0) & "00000000000000000000" when "10100",
	in_data_oprnd1(10 downto 0) & "000000000000000000000" when "10101",
	in_data_oprnd1(9 downto 0) & "0000000000000000000000" when "10110",
	in_data_oprnd1(8 downto 0) & "00000000000000000000000" when "10111",
	in_data_oprnd1(7 downto 0) & "000000000000000000000000" when "11000",
	in_data_oprnd1(6 downto 0) & "0000000000000000000000000" when "11001",
	in_data_oprnd1(5 downto 0) & "00000000000000000000000000" when "11010",
	in_data_oprnd1(4 downto 0) & "000000000000000000000000000" when "11011",
	in_data_oprnd1(3 downto 0) & "0000000000000000000000000000" when "11100",
	in_data_oprnd1(2 downto 0) & "00000000000000000000000000000" when "11101",
	in_data_oprnd1(1 downto 0) & "000000000000000000000000000000" when "11110",
	in_data_oprnd1(0) & "0000000000000000000000000000000" when "11111";
--left shift done
--right shift

with in_data_imm_sgnext( 4 downto 0) select
sig_data_rshft <= in_data_oprnd1 when "00000",
	 '0' & in_data_oprnd1(31 downto 1) when "00001",
	 "00" & in_data_oprnd1(31 downto 2) when "00010",
	 "000" & in_data_oprnd1(31 downto 3) when "00011",
	 "0000" & in_data_oprnd1(31 downto 4) when "00100",
	 "00000" & in_data_oprnd1(31 downto 5) when "00101",
	 "000000" & in_data_oprnd1(31 downto 6) when "00110",
	 "0000000" & in_data_oprnd1(31 downto 7) when "00111",
	 "00000000" & in_data_oprnd1(31 downto 8) when "01000",
	 "000000000" & in_data_oprnd1(31 downto 9) when "01001",
	 "0000000000" & in_data_oprnd1(31 downto 10) when "01010",
	 "00000000000" & in_data_oprnd1(31 downto 11) when "01011",
	 "000000000000" & in_data_oprnd1(31 downto 12) when "01100",
	 "0000000000000" & in_data_oprnd1(31 downto 13) when "01101",
	 "00000000000000" & in_data_oprnd1(31 downto 14) when "01110",
	 "000000000000000" & in_data_oprnd1(31 downto 15) when "01111",
	 "0000000000000000" & in_data_oprnd1(31 downto 16) when "10000",
	 "00000000000000000" & in_data_oprnd1(31 downto 17) when "10001",
	 "000000000000000000" & in_data_oprnd1(31 downto 18) when "10010",
	 "0000000000000000000" & in_data_oprnd1(31 downto 19) when "10011",
	 "00000000000000000000" & in_data_oprnd1(31 downto 20) when "10100",
	 "000000000000000000000" & in_data_oprnd1(31 downto 21) when "10101",
	 "0000000000000000000000" & in_data_oprnd1(31 downto 22) when "10110",
	 "00000000000000000000000" & in_data_oprnd1(31 downto 23) when "10111",
	 "000000000000000000000000" & in_data_oprnd1(31 downto 24) when "11000",
	 "0000000000000000000000000" & in_data_oprnd1(31 downto 25) when "11001",
	 "00000000000000000000000000" & in_data_oprnd1(31 downto 26) when "11010",
	 "000000000000000000000000000" & in_data_oprnd1(31 downto 27) when "11011",
	 "0000000000000000000000000000" & in_data_oprnd1(31 downto 28) when "11100",
	 "00000000000000000000000000000" & in_data_oprnd1(31 downto 29) when "11101",
	 "000000000000000000000000000000" & in_data_oprnd1(31 downto 30) when "11110",
	 "0000000000000000000000000000000" & in_data_oprnd1(31) when "11111";
	 
--end of right shift
--shifter block ended

--comparators
process (sig_data_oprnd2, in_data_oprnd1, in_sel_mux_brnch, sig_comp_less, sig_comp_eq, sig_comp_nteq)
begin

if (in_data_oprnd1 < sig_data_oprnd2) then sig_comp_less <= '1'; else sig_comp_less <= '0'; end if;

if ( in_data_oprnd1 = sig_data_oprnd2) then sig_comp_eq <= '1'; else sig_comp_eq <= '0'; end if;

sig_comp_nteq <= not sig_comp_eq;

	if ( in_sel_mux_brnch = "11" ) then out_sel_brnch2pc <= sig_comp_less;
	elsif ( in_sel_mux_brnch = "10" ) then out_sel_brnch2pc <= sig_comp_eq;
	elsif ( in_sel_mux_brnch = "01" ) then out_sel_brnch2pc <= sig_comp_nteq;
	else out_sel_brnch2pc <= '0';
	end if;
end process;
--jump comaprsisons done

--wb mux

process ( sig_data_addsub, sig_data_andor, sig_data_rshft, sig_data_lshft, in_sel_mux_wb )
begin
 if (in_sel_mux_wb = "11" ) then out_data_wb <= sig_data_addsub;
 elsif (in_sel_mux_wb = "10" ) then out_data_wb <= sig_data_andor;
 elsif (in_sel_mux_wb = "01" ) then out_data_wb <= sig_data_rshft;
 else out_data_wb <= sig_data_lshft;
 end if;
end process;
--wb mux done
end Behavioral;

