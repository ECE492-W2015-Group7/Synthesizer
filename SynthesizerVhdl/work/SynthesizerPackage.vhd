library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package SynthesizerPackage is
	constant N : integer;
    type PHASE_INCS is array(0 to 1) of std_logic_vector (31 downto 0);
	type STD_LOGIC_ARRAY is array(0 to 1) of std_logic;
    type LUT_ADDRESSES is array(0 to 1) of std_logic_vector (11 downto 0);	
    type WAVE_ARRAY is array(0 to 1) of std_logic_vector (15 downto 0);
end package SynthesizerPackage;

package body SynthesizerPackage is
	constant N : integer := 2;
end SynthesizerPackage;