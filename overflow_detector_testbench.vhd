--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:44:08 02/09/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Taylor.Bodin/Desktop/Programming/ECE_281/Lab2_Bodin/overflow_detector_testbench.vhd
-- Project Name:  Lab2_Bodin
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: overflow_detector
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
 
ENTITY overflow_detector_testbench IS
END overflow_detector_testbench;
 
ARCHITECTURE behavior OF overflow_detector_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT overflow_detector
    PORT(
         A_msb : IN  std_logic;
         B_msb : IN  std_logic;
         Sum_msb : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_msb : std_logic := '0';
   signal B_msb : std_logic := '0';
   signal Sum_msb : std_logic := '0';

 	--Outputs
   signal O : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: overflow_detector PORT MAP (
          A_msb => A_msb,
          B_msb => B_msb,
          Sum_msb => Sum_msb,
          O => O
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

		A_msb <= '0';
		B_msb <= '0';
		Sum_msb <= '0';
		
		wait for 100 ns;
		
		assert O = '0' report "inncorrectly identified overflow at 000" severity ERROR;

		A_msb <= '0';
		B_msb <= '0';
		Sum_msb <= '1';
		
		wait for 100 ns;
		
		assert O = '1' report "missed overflow at 001" severity ERROR;
		
		A_msb <= '0';
		B_msb <= '1';
		Sum_msb <= '0';
		
		wait for 100 ns;
		
		assert O = '0' report "inncorrectly identified overflow at 010" severity ERROR;
		
		A_msb <= '0';
		B_msb <= '1';
		Sum_msb <= '1';
		
		wait for 100 ns;
		
		assert O = '0' report "inncorrectly identified overflow at 011" severity ERROR;
		
		A_msb <= '1';
		B_msb <= '0';
		Sum_msb <= '0';
		
		wait for 100 ns;
		
		assert O = '0' report "inncorrectly identified overflow at 100" severity ERROR;
		
		A_msb <= '1';
		B_msb <= '0';
		Sum_msb <= '1';
		
		wait for 100 ns;
		
		assert O = '0' report "inncorrectly identified overflow at 101" severity ERROR;
		
		A_msb <= '1';
		B_msb <= '1';
		Sum_msb <= '0';
		
		wait for 100 ns;
		
		assert O = '1' report "missed overflow at 110" severity ERROR;
		
		A_msb <= '1';
		B_msb <= '1';
		Sum_msb <= '1';
		
		wait for 100 ns;
		
		assert O = '0' report "inncorrectly identified overflow at 111" severity ERROR;
		
		--End Test
		
		report "Test Complete";

      wait;
   end process;

END;
