----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:17:14 11/30/2016 
-- Design Name: 
-- Module Name:    DecodeUnit - Behavioral 
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

entity DecodeUnit is
    Port ( i_DecodeUnit_Opcode : in STD_LOGIC_VECTOR (5 downto 0); --Corresponds to instr(31-25)
			  i_DecodeUnit_Func : in STD_LOGIC_VECTOR (5 downto 0); --Corresponds to instr(5-0)
           o_DecodeUnit_JMP : out STD_LOGIC; --Sel_mux_jmp in Shayan doc
           o_DecodeUnit_HAL : out STD_LOGIC;
           o_DecodeUnit_SW : out STD_LOGIC;
           o_DecodeUnit_LW : out STD_LOGIC;
			  o_DecodeUnit_RegSel : out STD_LOGIC;
			  o_DecodeUnit_RegWrite : out STD_LOGIC;
			  --Now, Shayan outputs
           o_DecodeUnit_Branch : out STD_LOGIC_VECTOR (1 downto 0); --Sel_mux_brnch (0downto1) in Shayan doc
			  o_DecodeUnit_Operation : out STD_LOGIC_VECTOR (1 downto 0); --Sel_mux_wb (0downto1) in Shayan doc
			  o_DecodeUnit_AndOr : out STD_LOGIC; --Sel_mux_andor in Shayan doc
			  o_DecodeUnit_Neg : out STD_LOGIC; --Sel_mux_neg in Shayan doc
			  o_DecodeUnit_SecondOp : out STD_LOGIC --Sel_mux_oprnd2 in Shayan doc
			  );
			  
end DecodeUnit;

architecture Behavioral of DecodeUnit is

begin

	DECODE_PROCESS: process (i_DecodeUnit_Opcode, i_DecodeUnit_Func)
		begin
			case i_DecodeUnit_Opcode is
				when "000000" => 
					case i_DecodeUnit_Func is
						--ADD
						when "010000" =>
							o_DecodeUnit_SecondOp <= '0';
							o_DecodeUnit_Neg  <= '0';
							o_DecodeUnit_AndOr <= '0';
							o_DecodeUnit_Operation <= "11"; 
							o_DecodeUnit_Branch <= "00"; 
							o_DecodeUnit_JMP <= '0';
							o_DecodeUnit_HAL <= '0';
							o_DecodeUnit_SW <= '0';
							o_DecodeUnit_LW <= '0';
							o_DecodeUnit_RegSel <= '0'; --1 if writing in Rt, 0 if writing in Rd
							o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
						
						--SUB
						when "010001" =>
							o_DecodeUnit_SecondOp <= '0';
							o_DecodeUnit_Neg  <= '1';
							o_DecodeUnit_AndOr <= '0';
							o_DecodeUnit_Operation <= "11"; 
							o_DecodeUnit_Branch <= "00"; 
							o_DecodeUnit_JMP <= '0';
							o_DecodeUnit_HAL <= '0';
							o_DecodeUnit_SW <= '0';
							o_DecodeUnit_LW <= '0';
							o_DecodeUnit_RegSel <= '0'; --1 if writing in Rt, 0 if writing in Rd
							o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
						
						--AND
						when "010010" =>
							o_DecodeUnit_SecondOp <= '0';
							o_DecodeUnit_Neg  <= '0';
							o_DecodeUnit_AndOr <= '0';
							o_DecodeUnit_Operation <= "10"; 
							o_DecodeUnit_Branch <= "00"; 
							o_DecodeUnit_JMP <= '0';
							o_DecodeUnit_HAL <= '0';
							o_DecodeUnit_SW <= '0';
							o_DecodeUnit_LW <= '0';
							o_DecodeUnit_RegSel <= '0'; --1 if writing in Rt, 0 if writing in Rd
							o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
						
						--OR
						when "010011" =>
							o_DecodeUnit_SecondOp <= '0';
							o_DecodeUnit_Neg  <= '0';
							o_DecodeUnit_AndOr <= '1';
							o_DecodeUnit_Operation <= "10"; 
							o_DecodeUnit_Branch <= "00"; 
							o_DecodeUnit_JMP <= '0';
							o_DecodeUnit_HAL <= '0';
							o_DecodeUnit_SW <= '0';
							o_DecodeUnit_LW <= '0';
							o_DecodeUnit_RegSel <= '0'; --1 if writing in Rt, 0 if writing in Rd
							o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
						
						--NOR
						when "010100" =>
							o_DecodeUnit_SecondOp <= '0';
							o_DecodeUnit_Neg  <= '1';
							o_DecodeUnit_AndOr <= '1';
							o_DecodeUnit_Operation <= "10"; 
							o_DecodeUnit_Branch <= "00"; 
							o_DecodeUnit_JMP <= '0';
							o_DecodeUnit_HAL <= '0';
							o_DecodeUnit_SW <= '0';
							o_DecodeUnit_LW <= '0';
							o_DecodeUnit_RegSel <= '0'; --1 if writing in Rt, 0 if writing in Rd
							o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
							
						when others =>  
							o_DecodeUnit_SecondOp <= '0';
							o_DecodeUnit_Neg  <= '0';
							o_DecodeUnit_AndOr <= '0';
							o_DecodeUnit_Operation <= "00"; 
							o_DecodeUnit_Branch <= "00"; 
							o_DecodeUnit_JMP <= '0';
							o_DecodeUnit_HAL <= '0';
							o_DecodeUnit_SW <= '0';
							o_DecodeUnit_LW <= '0';
							o_DecodeUnit_RegSel <= '0'; --Here is set to 0 because it does not matter
							o_DecodeUnit_RegWrite <= '0'; --Disable the register to write
					 end case;
					
				--ADD IMMEDIATE
				when "000001" =>  
					o_DecodeUnit_SecondOp <= '1';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "11"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '1'; --1 if writing in Rt, 0 if writing in Rd
					o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
					
				--SUBSTRACT IMMEDIATE
				when "000010" =>  
					o_DecodeUnit_SecondOp <= '1';
					o_DecodeUnit_Neg  <= '1';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "11"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '1'; --1 if writing in Rt, 0 if writing in Rd
					o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
				
				
				--AND IMMEDIATE
				when "000011" =>  
					o_DecodeUnit_SecondOp <= '1';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "10"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '1'; --1 if writing in Rt, 0 if writing in Rd
					o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
					
				--OR IMMEDIATE
				when "000100" =>  
					o_DecodeUnit_SecondOp <= '1';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '1';
					o_DecodeUnit_Operation <= "10"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '1'; --1 if writing in Rt, 0 if writing in Rd
					o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
					
				--SHL IMMEDIATE
				when "000101" =>  
					o_DecodeUnit_SecondOp <= '1';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "00"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '1'; --1 if writing in Rt, 0 if writing in Rd
					o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
					
				--SHR IMMEDIATE
				when "000110" =>  
					o_DecodeUnit_SecondOp <= '1';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "01"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '1'; --1 if writing in Rt, 0 if writing in Rd
					o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
					
				--LOAD WORD
				when "000111" =>  
					o_DecodeUnit_SecondOp <= '1';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "11"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '1';
					o_DecodeUnit_RegSel <= '1'; --Here it is supposed to not matter, but just in case I enable
					o_DecodeUnit_RegWrite <= '1'; --Enable the register to write
					
				--STORE WORD
				when "001000" =>  
					o_DecodeUnit_SecondOp <= '1';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "11"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '1';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '0'; --Here is set to 0 because it does not matter
					o_DecodeUnit_RegWrite <= '0'; --Disable the register to write
					
				--BRANCH IF LESS THAN
				when "001001" =>  
					o_DecodeUnit_SecondOp <= '0';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "00"; 
					o_DecodeUnit_Branch <= "11"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '0'; --Here is set to 0 because it does not matter
					o_DecodeUnit_RegWrite <= '0'; --Disable the register to write
					
				--BRANCH IF EQUAL
				when "001010" =>  
					o_DecodeUnit_SecondOp <= '0';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "00"; 
					o_DecodeUnit_Branch <= "10"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '0'; --Here is set to 0 because it does not matter
					o_DecodeUnit_RegWrite <= '0'; --Disable the register to write
					
				--BRANCH IF NOT EQUAL
				when "001011" =>  
					o_DecodeUnit_SecondOp <= '0';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "00"; 
					o_DecodeUnit_Branch <= "01"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '0'; --Here is set to 0 because it does not matter
					o_DecodeUnit_RegWrite <= '0'; --Disable the register to write
					
				--JUMP
				when "001100" =>  
					o_DecodeUnit_SecondOp <= '0';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "00"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '1';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '0'; --Here is set to 0 because it does not matter
					o_DecodeUnit_RegWrite <= '0'; --Disable the register to write
					
				--HALT
				when "111111" =>  
					o_DecodeUnit_SecondOp <= '0';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "00"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '1';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '0'; --Here is set to 0 because it does not matter
					o_DecodeUnit_RegWrite <= '0'; --Disable the register to write
					
				when others =>  
					o_DecodeUnit_SecondOp <= '0';
					o_DecodeUnit_Neg  <= '0';
					o_DecodeUnit_AndOr <= '0';
					o_DecodeUnit_Operation <= "00"; 
					o_DecodeUnit_Branch <= "00"; 
					o_DecodeUnit_JMP <= '0';
					o_DecodeUnit_HAL <= '0';
					o_DecodeUnit_SW <= '0';
					o_DecodeUnit_LW <= '0';
					o_DecodeUnit_RegSel <= '0'; --Here is set to 0 because it does not matter
					o_DecodeUnit_RegWrite <= '0'; --Disable the register to write
			end case;
		end process;

end Behavioral;

