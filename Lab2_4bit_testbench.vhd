--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:35:16 02/09/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Taylor.Bodin/Desktop/Programming/ECE_281/Lab2_Bodin/Lab2_4bit_testbench.vhd
-- Project Name:  Lab2_Bodin
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab2_4bit_adder
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
USE ieee.numeric_std.ALL;

USE ieee.std_logic_unsigned.all;
 
ENTITY Lab2_4bit_testbench IS
END Lab2_4bit_testbench;
 
ARCHITECTURE behavior OF Lab2_4bit_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab2_4bit_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Subtract : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Subtract : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab2_4bit_adder PORT MAP (
          A => A,
          B => B,
          Subtract => Subtract,
          Sum => Sum,
          Cout => Cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;	
		
		--Initialize inputs
		A <= "0000";
		B <= "0000";
		Subtract <= '0';

      -- insert stimulus here

		--Add
		
		for I in 0 to 15 loop
			
			for J in 0 to 15 loop
			
				wait for 1 ns;
				
				assert (Sum = A + B) report "Expected A + B = " &
					integer'image(to_integer(signed((A+B)))) & " for A = " &
					integer'image(to_integer(signed((A)))) & " and B = " &
					integer'image(to_integer(signed((B)))) & ", got " &
					integer'image(to_integer(signed((Sum)))) Severity ERROR;
					
				-- Increment A
				A <= A + "0001";
				
			end loop;
			
		--Increment B and reset A
		A <= "0000";
		B <= B + "0001";
		
		end loop;
		
		
		
		--Initialize inputs
		A <= "0000";
		B <= "0000";
		Subtract <= '1';

      -- insert stimulus here

		--Subtract
		
		for I in 0 to 15 loop
			
			for J in 0 to 15 loop
			
				wait for 1 ns;
				
				assert (Sum = A - B) report "Expected A - B = " &
					integer'image(to_integer(signed((A-B)))) & " for A = " &
					integer'image(to_integer(signed((A)))) & " and B = " &
					integer'image(to_integer(signed((B)))) & ", got " &
					integer'image(to_integer(signed((Sum)))) Severity ERROR;
					
				-- Increment A
				A <= A + "0001";
				
			end loop;
			
		--Increment B and reset A
		A <= "0000";
		B <= B + "0001";
		
		end loop;
		
		--Test Finished
		report "Test Finished!";

      wait;
   end process;

END;
