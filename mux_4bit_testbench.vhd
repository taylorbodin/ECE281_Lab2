--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:46:42 02/09/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Taylor.Bodin/Desktop/Programming/ECE_281/Lab2_Bodin/mux_4bit_testbench.vhd
-- Project Name:  Lab2_Bodin
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_4bit
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
 
ENTITY mux_4bit_testbench IS
END mux_4bit_testbench;
 
ARCHITECTURE behavior OF mux_4bit_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_4bit
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         Y : IN  std_logic_vector(3 downto 0);
         S : IN  std_logic;
         O : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');
   signal Y : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic := '0';

 	--Outputs
   signal O : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_4bit PORT MAP (
          X => X,
          Y => Y,
          S => S,
          O => O
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		X <= "1010";
		Y <= "0101";
		S <= '0';
		
		wait for 100 ns;
		
		assert O = X report "O does not equal X with S = 0" severity ERROR;
		
		S <= '1';
		
		wait for 100 ns;
		
		assert O = Y report "O does not equal Y with S = 0" severity ERROR;
		
		--End Test
		
		report "test complete";
		

      wait;
   end process;

END;
