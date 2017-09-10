--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:45:54 12/11/2016
-- Design Name:   
-- Module Name:   C:/Users/Windows 8/Desktop/AHD Examples/DecodeUnit/DecodeUnit_TB.vhd
-- Project Name:  DecodeUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecodeUnit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DecodeUnit_TB IS
END DecodeUnit_TB;
 
ARCHITECTURE behavior OF DecodeUnit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DecodeUnit
    PORT(
         i_DecodeUnit_Opcode : IN  std_logic_vector(5 downto 0);
         i_DecodeUnit_Func : IN  std_logic_vector(5 downto 0);
         o_DecodeUnit_JMP : OUT  std_logic;
         o_DecodeUnit_HAL : OUT  std_logic;
         o_DecodeUnit_SW : OUT  std_logic;
         o_DecodeUnit_LW : OUT  std_logic;
         o_DecodeUnit_RegSel : OUT  std_logic;
         o_DecodeUnit_RegWrite : OUT  std_logic;
         o_DecodeUnit_Branch : OUT  std_logic_vector(1 downto 0);
         o_DecodeUnit_Operation : OUT  std_logic_vector(1 downto 0);
         o_DecodeUnit_AndOr : OUT  std_logic;
         o_DecodeUnit_Neg : OUT  std_logic;
         o_DecodeUnit_SecondOp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i_DecodeUnit_Opcode : std_logic_vector(5 downto 0) := (others => '0');
   signal i_DecodeUnit_Func : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal o_DecodeUnit_JMP : std_logic;
   signal o_DecodeUnit_HAL : std_logic;
   signal o_DecodeUnit_SW : std_logic;
   signal o_DecodeUnit_LW : std_logic;
   signal o_DecodeUnit_RegSel : std_logic;
   signal o_DecodeUnit_RegWrite : std_logic;
   signal o_DecodeUnit_Branch : std_logic_vector(1 downto 0);
   signal o_DecodeUnit_Operation : std_logic_vector(1 downto 0);
   signal o_DecodeUnit_AndOr : std_logic;
   signal o_DecodeUnit_Neg : std_logic;
   signal o_DecodeUnit_SecondOp : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecodeUnit PORT MAP (
          i_DecodeUnit_Opcode => i_DecodeUnit_Opcode,
          i_DecodeUnit_Func => i_DecodeUnit_Func,
          o_DecodeUnit_JMP => o_DecodeUnit_JMP,
          o_DecodeUnit_HAL => o_DecodeUnit_HAL,
          o_DecodeUnit_SW => o_DecodeUnit_SW,
          o_DecodeUnit_LW => o_DecodeUnit_LW,
          o_DecodeUnit_RegSel => o_DecodeUnit_RegSel,
          o_DecodeUnit_RegWrite => o_DecodeUnit_RegWrite,
          o_DecodeUnit_Branch => o_DecodeUnit_Branch,
          o_DecodeUnit_Operation => o_DecodeUnit_Operation,
          o_DecodeUnit_AndOr => o_DecodeUnit_AndOr,
          o_DecodeUnit_Neg => o_DecodeUnit_Neg,
          o_DecodeUnit_SecondOp => o_DecodeUnit_SecondOp
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000101";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "110011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "110101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000101";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "110011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "110001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "010111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011100";
		wait for 20 ns;
      -- insert stimulus here 
i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000101";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "110011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "110101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000101";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "110011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "110001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "010111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011100";
		wait for 20 ns;
		
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000101";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "110011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "110101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000101";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "010010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010101";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000001";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "110011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "000110";
		wait for 20 ns;
		i_DecodeUnit_Func <= "110001";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "010111";
		wait for 20 ns;
		i_DecodeUnit_Func <= "111110";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101000";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010111";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101010";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010100";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "000000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "001100";
		wait for 20 ns;
		i_DecodeUnit_Func <= "010000";
		wait for 20 ns;
		i_DecodeUnit_Opcode <= "101011";
		wait for 20 ns;
		i_DecodeUnit_Func <= "011100";
		wait for 20 ns;
      wait;
   end process;

END;
