----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:55:20 12/03/2016 
-- Design Name: 
-- Module Name:    data-mem - rtl 
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
use ieee.std_logic_unsigned.all;

entity data_mem is
generic (
    DATA    : integer := 32;
    ADDR    : integer := 9
);
port(	
	   clk   : in  std_logic;
      wr    : in  std_logic;
      addr_in  : in  std_logic_vector(ADDR-1 downto 0);
      din   : in  std_logic_vector(DATA-1 downto 0);
      dout  : out std_logic_vector(DATA-1 downto 0)
		);
end data_mem;

architecture rtl of data_mem is

type mem_type is array ( (2**ADDR)-1 downto 0 ) of std_logic_vector(DATA-1 downto 0);
shared variable mem : mem_type;

begin
dout <= mem(conv_integer(addr_in));
process(clk,clr)
begin
    if(clk'event and clk='1') then
	if(wr='1') then
		mem(conv_integer(addr_in)) := din;
	end if;
    end if;
end process;

end rtl;

