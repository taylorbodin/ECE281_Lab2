----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Taylor Bodin
-- 
-- Create Date:    15:39:05 02/09/2014 
-- Design Name:    Overflow Detector
-- Module Name:    overflow_detector - Behavioral 
-- Project Name:   Lab2
-- Target Devices: none
-- Tool versions: 
-- Description: Detects overflow by comparing the MSB of the input and output	
--						assumes 2's complement signed values
-- Dependencies: None
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

entity overflow_detector is
    Port ( A_msb : in  STD_LOGIC;
           B_msb : in  STD_LOGIC;
           Sum_msb : in  STD_LOGIC;
           O : out  STD_LOGIC);
end overflow_detector;

architecture Behavioral of overflow_detector is

	signal AxnorB, AxorS : std_logic;

begin

	AxnorB <= A_msb xnor B_msb;
	AxorS <= A_msb xor Sum_msb;
	
	O <= AxnorB and AxorS;

end Behavioral;

