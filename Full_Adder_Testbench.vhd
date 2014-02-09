--------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Taylor Bodin
-- 
-- Create Date:    00:06:03 02/09/2014 
-- Design Name:    Lab2
-- Module Name:    Full_Adder - Behavioral 
-- Project Name:   Lab2
-- Target Devices: None
-- Tool versions: 
-- Description:    1 bit full adder test bench
--
-- Dependencies:   None
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
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
USE ieee.numeric_std.ALL;
 
ENTITY Full_Adder_Testbench IS
END Full_Adder_Testbench;
 
ARCHITECTURE behavior OF Full_Adder_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         Sum : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic;
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		A <= '0';
		B <= '0';
		Cin <= '0';

		Assert (Sum = '0' and Cout = '0') report "Problem at A = " &
			std_logic'image(A) & " and B = " &
			std_logic'image(B) & " and Cin = " &
			std_logic'image(Cin) & ", got Sum = " &
			std_logic'image(Sum) & " and Cout = " &
			std_logic'image(Cout) 
			severity ERROR;
		

		
		report "Test completed";

      wait;
   end process;

END;
