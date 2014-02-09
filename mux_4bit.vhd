----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Taylor Bodin
-- 
-- Create Date:    14:42:55 02/09/2014 
-- Design Name: 
-- Module Name:    mux_4bit - Behavioral 
-- Project Name:   Lab2
-- Target Devices: none
-- Tool versions: 
-- Description:   4 bit multiplexer
--
-- Dependencies:   None
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

entity mux_4bit is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (3 downto 0));
end mux_4bit;

architecture Behavioral of mux_4bit is

begin
	mux: process(X, Y, S)
	begin
		
		if s = '0' then
			O <= X;
		
		else
			O <= Y;
			
		end if;
	end process mux;

end Behavioral;

