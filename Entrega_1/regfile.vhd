LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;        --Esta libreria sera necesaria si usais conversiones TO_INTEGER
USE ieee.std_logic_unsigned.all; --Esta libreria sera necesaria si usais conversiones CONV_INTEGER

ENTITY regfile IS
    PORT (clk    : IN  STD_LOGIC;
          wrd    : IN  STD_LOGIC;
          d      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          a      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END regfile;


ARCHITECTURE Structure OF regfile IS
	 type BLOQUE_REG is array (7 downto 0) of std_logic_vector(15 downto 0);
    signal regs : BLOQUE_REG; -- Reg del banc
BEGIN

	process (clk) begin
		if rising_edge(clk) and wrd = '1' then
			regs(conv_integer(addr_d)) <= d;
		end if;
	end process;

	a <= regs(conv_integer(addr_a));

END Structure;