----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Taylor Bodin
-- 
-- Create Date:    01:15:03 02/09/2014 
-- Design Name:    Lab2
-- Module Name:    Lab2_4bit_adder - Behavioral 
-- Project Name:   Lab2
-- Target Devices: Spartan3E-500
-- Tool versions: 
-- Description:    4 bit adder/subtractor
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab2_4bit_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Subtract : in  STD_LOGIC;
           Sum : inout  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC;
			  Overflow : out STD_LOGIC);
end Lab2_4bit_adder;

architecture Structural of Lab2_4bit_adder is

	--Adder declaration
	COMPONENT Full_Adder
		PORT(
			A : IN std_logic;
			B : IN std_logic;
			Cin : IN std_logic;
			Sum : OUT std_logic;
			Cout : OUT std_logic
			);
	END COMPONENT;
	
	--Mux declaration
	COMPONENT mux_4bit
		PORT(
			X : IN std_logic_vector (3 downto 0);
			Y : IN std_logic_vector (3 downto 0);
			S : IN std_logic;
			O : OUT std_logic_vector (3 downto 0)
		);
	END COMPONENT;
	
	--Overflow detector declaration
	COMPONENT overflow_detector
		PORT(
			A_msb : IN std_logic;
			B_msb : IN std_logic;
			Sum_msb : IN std_logic;
			O : OUT std_logic
		);
	END COMPONENT;
	
	signal Cin1, Cin2, Cin3 : std_logic;
	
	signal Bnot, Binner : std_logic_vector (3 downto 0);
			
begin

	Bnot <= not B;
	
	Bmux : mux_4bit PORT MAP(
		X => B,
		Y => Bnot,
		S => Subtract,
		O => Binner
	);
	
	Ofdetector : overflow_detector PORT MAP(
		A_msb => A(3),
		B_msb => Binner(3),
		Sum_msb => Sum(3),
		O => Overflow
	);
	
	add0 : Full_Adder PORT MAP(
		A => A(0),
		B => Binner(0),
		Cin => Subtract,
		Sum => Sum(0),
		Cout => Cin1
	);
	
	add1 : Full_Adder PORT MAP(
		A => A(1),
		B => Binner(1),
		Cin => Cin1,
		Sum => Sum(1),
		Cout => Cin2
	);
	
	add2 : Full_Adder PORT MAP(
		A => A(2),
		B => Binner(2),
		Cin => Cin2,
		Sum => Sum(2),
		Cout => Cin3
	);
	
	add3 : Full_Adder PORT MAP(
		A => A(3),
		B => Binner(3),
		Cin => Cin3,
		Sum => Sum(3),
		Cout => Cout
	);
		
end Structural;

