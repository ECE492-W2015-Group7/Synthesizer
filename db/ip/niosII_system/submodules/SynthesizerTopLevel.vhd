-- Author: Peter Crinklaw

--Top Level file for Sythesizer component. Hides avalon interface specs
--from the main Synthesizer component.
library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.std_logic_textio.all;
    use IEEE.std_logic_arith.all;
    use IEEE.numeric_bit.all;
    use IEEE.numeric_std.all;
    use IEEE.std_logic_signed.all;
    --use IEEE.std_logic_unsigned.all;
	
use work.SynthesizerPackage.all;	
	
entity SynthesizerTopLevel is
port (
	-- system signals
	csi_clk50M		: in  std_logic;
	reset_n			: in  std_logic;
	csi_clk32k		: in  std_logic;
	
	-- Frequency control
	avs_writedata_phase_increments_voice0   : in  std_logic_vector(31 downto 0);
	avs_write_n_phase_increments_voice0   	: in  std_logic;
	
	avs_writedata_phase_increments_voice1   : in  std_logic_vector(31 downto 0);
	avs_write_n_phase_increments_voice1   	: in  std_logic;	
	
	aso_data_audio_out		: out std_logic_vector(31 downto 0);
	aso_valid_audio_out		: out std_logic
	);
end entity;

architecture additionalSynthesizer of SynthesizerTopLevel is

	--signal phase_increments_writedata	: PHASE_INCS;
	--signal phase_increments_write_n		: STD_LOGIC_ARRAY;
	signal phase_increments_stable		: PHASE_INCS := (others=> (others=>'0'));	

	component Synthesizer is
		port (
		-- system signals
		clk         : in  std_logic;
		reset_n       : in  std_logic;
	  
		-- Frequency control
		--Bottom 16 bits are for first oscillator, next 16 are for second, next 16 are for third
		phase_increments   		: in  PHASE_INCS;	
		audio_output			: out std_logic_vector(15 downto 0);
		audio_output_valid		: out std_logic
		);
	end component;
		
begin

	-- phase_increments_writedata(0) <= avs_writedata_phase_increments_voice0;
	-- phase_increments_writedata(1) <= avs_writedata_phase_increments_voice1;
		
	-- phase_increments_write_n(0) <= avs_write_n_phase_increments_voice0;
	-- phase_increments_write_n(1) <= avs_write_n_phase_increments_voice1;	


	-- read_phase_increments: process(phase_increments_write_n, reset_n)
	-- begin
		-- if reset_n = '0' then
			-- phase_increments_stable <= (others=> (others=>'0'));
		-- else
			-- ll: for i in 0 to N-1 loop
				-- if falling_edge(phase_increments_write_n(i)) then
					-- phase_increments_stable(i) <= phase_increments_writedata(i);
				-- end if;
			-- end loop;
		-- end if;
	-- end process read_phase_increments;
	
	-- gen: for i in 0 to N-1 generate
	-- begin
		-- read_phase_increments: process(phase_increments_write_n(i), reset_n)
		-- begin
			-- if reset_n = '0' then
				-- phase_increments_stable(i) <= (others=>'0');
			-- else
				-- if falling_edge(phase_increments_write_n(i)) then
					-- phase_increments_stable(i) <= phase_increments_writedata(i);
				-- end if;
			-- end if;
		-- end process read_phase_increments;
	-- end generate;
	

	read_phase_increments0: process(avs_write_n_phase_increments_voice0, reset_n) is
	begin
			if reset_n = '0' then
				phase_increments_stable(0) <= (others=>'0');
			elsif falling_edge(avs_write_n_phase_increments_voice0) then
					phase_increments_stable(0) <= avs_writedata_phase_increments_voice0;
			end if;
		end process read_phase_increments0;
	
	read_phase_increments1: process(avs_write_n_phase_increments_voice1, reset_n) is
		begin
			if reset_n = '0' then
				phase_increments_stable(1) <= (others=>'0');
			elsif falling_edge(avs_write_n_phase_increments_voice1) then
					phase_increments_stable(1) <= avs_writedata_phase_increments_voice1;
			end if;
		end process read_phase_increments1;
	
	laserHarpSynthesizer: Synthesizer
	port map(
		clk => csi_clk32k,
		reset_n => reset_n,
		phase_increments => phase_increments_stable,
		audio_output => aso_data_audio_out(31 downto 16),
		audio_output_valid => aso_valid_audio_out
	);
	
	aso_data_audio_out(15 downto 0) <= x"0000";
	
end additionalSynthesizer;