-- Author : Peter Crinklaw

-- Testbench for Synthesizer.vhd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
use work.SynthesizerPackage.all;

-- entity declaration for your testbench.Dont declare any ports here
ENTITY Synthesizer_tb IS
  
END Synthesizer_tb;

ARCHITECTURE behavior OF Synthesizer_tb IS
    -- Clock period definitions
	constant clk_period : time := 10 ns;
   
	signal clk 					: std_logic;
	signal reset_n       		: std_logic;
	signal phase_increments   	: PHASE_INCS  := (others=> (others=>'0'));	
	signal audio_output			: std_logic_vector(15 downto 0);
	signal audio_output_valid	: std_logic;
   
	component Synthesizer is
		port (
		clk         : in  std_logic;
		reset_n       : in  std_logic;
		phase_increments   		: in  PHASE_INCS;	
		audio_output			: out std_logic_vector(15 downto 0);
		audio_output_valid		: out std_logic
		);
	end component;
   
BEGIN

synth: Synthesizer
	port map(
		clk => clk,
		reset_n => reset_n,
		phase_increments => phase_increments,
		audio_output => audio_output,
		audio_output_valid => audio_output_valid
	);
   
	reset_n <= '1';	

   -- Stimulus process
	stim_proc: process
	begin        
        wait for 40 ns;
		
		l1: for i in 0 to 1 loop
			phase_increments(i) <= x"00000000";
		end loop;
		
        wait for 100 ns;
		
		
		phase_increments(0) <= x"0000" & x"0400";

        wait;
  end process;
  
  
     -- Clock process definitions( clock with 50% duty cycle is generated here.
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 0.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 0.5 ns signal is '1'.
   end process;

END;
