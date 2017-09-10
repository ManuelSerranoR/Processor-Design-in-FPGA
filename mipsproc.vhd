----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:08 12/03/2016 
-- Design Name: 
-- Module Name:    mipsproc - Behavioral 
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

entity mipsproc is
generic (
    DATA    : integer := 32;
    ADDR    : integer := 9
);

    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC);
end mipsproc;

architecture Behavioral of mipsproc is

component alu
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
end component;

component PCBlock
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  in_address_imm : in STD_LOGIC_VECTOR (25 downto 0);
			  in_data_imm_sgnext : in STD_LOGIC_VECTOR (31 downto 0);
           in_sel_mux_jmp : in  STD_LOGIC;
           in_sel_mux_brnch : in  STD_LOGIC;
           in_sel_mux_halt : in  STD_LOGIC;
           pc : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component DecodeUnit
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
			  
end component;

component sign_extension 
port ( input_data_sign_extend: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		 clr : IN STD_LOGIC;
		 output_data_sign_extend: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		 );
end component;

component instruction_memory
port ( clr : IN STD_LOGIC;
		 input_address_instruction_mem: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		 output_instruction_mem: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		 );
		
end component;

component data_mem is
port(	
	   clk   : in  std_logic;
      wr    : in  std_logic;
      addr_in  : in  std_logic_vector(ADDR-1 downto 0);
      din   : in  std_logic_vector(DATA-1 downto 0);
      dout  : out std_logic_vector(DATA-1 downto 0)
		);
end component;

component register_file
port ( R1 : in std_logic_vector(4 downto 0);
       R2 : in std_logic_vector(4 downto 0);
       Rw : in std_logic_vector(4 downto 0);
       RegWr : in std_logic;
       clk : in std_logic;
		 clr : in std_logic;
       RegWrVal:in std_logic_vector(31 downto 0);
       op1 : out std_logic_vector(31 downto 0);
       op2 : out std_logic_vector(31 downto 0));
end component;

signal pc, instr, alu_op_data, mem_op_data, rs_read, rt_read, sign_ext_data : STD_LOGIC_VECTOR (31 downto 0); -- 32 bits outputs
signal JMP, HAL, SW, LW, RegSel, RegWrite, AndOr, Neg, SecondOp : STD_LOGIC; -- decoder outputs
signal branch, operation : STD_LOGIC_VECTOR (1 downto 0); --decoder outputs
signal sel_brnch2pc : STD_LOGIC; --alu2pc branch signal
signal rw : STD_LOGIC_VECTOR (4 downto 0); -- register file address for rw
signal RegWrVal : STD_LOGIC_VECTOR (31 downto 0); --register file write data

begin

--mux for Rw of register file
process (RegSel, instr(20 downto 11))
begin
if ( RegSel = '0' ) then rw <= instr( 15 downto 11); else rw <= instr (20 downto 16); end if;
end process;

--mux for RegWrVal to register file
process (LW, mem_op_data, alu_op_data)
begin
if ( LW = '1' ) then RegWrVal <= mem_op_data; else RegWrVal <= alu_op_data; end if;
end process;


instrmemcomp: instruction_memory  
port map ( clr => clr,
		 input_address_instruction_mem => pc,
		 output_instruction_mem => instr );

rfcomp: register_file
port map ( R1 => instr(25 downto 21),
       R2 => instr(20 downto 16),
       Rw => rw,
       RegWr => RegWrite,
       clk => clk,
		 clr => clr,
       RegWrVal => RegWrVal,
       op1 => rs_read,
       op2 => rt_read );

sgnextcomp: sign_extension 
port map( input_data_sign_extend => instr (15 downto 0),
		 clr => clr,
		 output_data_sign_extend => sign_ext_data);

pccomp: PCBlock
    Port map( clk => clk,
           clr => clr,
			  in_address_imm => instr(25 downto 0),
			  in_data_imm_sgnext => sign_ext_data,
           in_sel_mux_jmp => JMP,
           in_sel_mux_brnch => sel_brnch2pc,
           in_sel_mux_halt => HAL,
           pc => pc);

decodercomp: DecodeUnit
    Port map( i_DecodeUnit_Opcode => instr(31 downto 26),
			  i_DecodeUnit_Func => instr(5 downto 0),
           o_DecodeUnit_JMP => JMP,
           o_DecodeUnit_HAL => HAL,
           o_DecodeUnit_SW => SW,
           o_DecodeUnit_LW => LW,
			  o_DecodeUnit_RegSel => RegSel,
			  o_DecodeUnit_RegWrite => RegWrite,
			  o_DecodeUnit_Branch => branch,
			  o_DecodeUnit_Operation => operation,
			  o_DecodeUnit_AndOr => AndOr,
			  o_DecodeUnit_Neg => Neg,
			  o_DecodeUnit_SecondOp => SecondOp
			  );
			  
alucomp: alu
    Port map( in_data_oprnd1 => rs_read,
           in_data_oprnd_Rt => rt_read,
           in_data_imm_sgnext => sign_ext_data,
           in_sel_mux_oprnd2 => SecondOp,
           in_sel_mux_neg => Neg,
           in_sel_mux_andor => AndOr,
           in_sel_mux_wb => operation,
           in_sel_mux_brnch => branch,
           out_data_wb => alu_op_data,
           out_sel_brnch2pc => sel_brnch2pc);

datamemcomp: data_mem 
port map( clk   => clk,
      wr  => sw,
      addr_in  => alu_op_data (ADDR-1 downto 0),
      din   => rt_read,
      dout  => mem_op_data);


end Behavioral;

