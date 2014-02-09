----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Taylor Bodin
-- 
-- Create Date:    23:52:03 02/08/2014 
-- Design Name:    Lab2
-- Module Name:    Full_Adder - Behavioral 
-- Project Name:   Lab2
-- Target Devices: None
-- Tool versions: 
-- Description:    1 bit full adder
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

entity Full_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

signal AxorB, AxorBandC, AandB : STD_LOGIC;

begin

AxorB <= A xor B;

AxorBandC <= AxorB and Cin;

AandB <= A and B;

Sum <= AxorB xor Cin;

Cout <= AxorBandC and AandB;

end Behavioral;

