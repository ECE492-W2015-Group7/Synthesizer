# TCL File Generated by Component Editor 12.1sp1
# Tue Mar 24 23:28:30 MDT 2015
# DO NOT MODIFY


# 
# Synthesizer "Synthesizer" v1.0
# null 2015.03.24.23:28:30
# 
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module Synthesizer
# 
set_module_property NAME Synthesizer
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME Synthesizer
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL SynthesizerTopLevel
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file SynthesizerTopLevel.vhd VHDL PATH SynthesizerVhdl/SynthesizerTopLevel.vhd
add_fileset_file SynthesizerPackage.vhd VHDL PATH SynthesizerVhdl/SynthesizerPackage.vhd
add_fileset_file Synthesizer.vhd VHDL PATH SynthesizerVhdl/Synthesizer.vhd
add_fileset_file SinLut.vhd VHDL PATH SynthesizerVhdl/SinLut.vhd
add_fileset_file AddressIncrementor.vhd VHDL PATH SynthesizerVhdl/AddressIncrementor.vhd


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock_sink
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset reset_n reset_n Input 1


# 
# connection point phase_increments_voice0
# 
add_interface phase_increments_voice0 avalon end
set_interface_property phase_increments_voice0 addressUnits WORDS
set_interface_property phase_increments_voice0 associatedClock clock_sink
set_interface_property phase_increments_voice0 associatedReset reset
set_interface_property phase_increments_voice0 bitsPerSymbol 8
set_interface_property phase_increments_voice0 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice0 burstcountUnits WORDS
set_interface_property phase_increments_voice0 explicitAddressSpan 0
set_interface_property phase_increments_voice0 holdTime 0
set_interface_property phase_increments_voice0 linewrapBursts false
set_interface_property phase_increments_voice0 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice0 readLatency 0
set_interface_property phase_increments_voice0 readWaitTime 1
set_interface_property phase_increments_voice0 setupTime 0
set_interface_property phase_increments_voice0 timingUnits Cycles
set_interface_property phase_increments_voice0 writeWaitTime 0
set_interface_property phase_increments_voice0 ENABLED true

add_interface_port phase_increments_voice0 avs_write_n_phase_increments_voice0 write_n Input 1
add_interface_port phase_increments_voice0 avs_writedata_phase_increments_voice0 writedata Input 32
set_interface_assignment phase_increments_voice0 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 50000000
set_interface_property clock_sink ENABLED true

add_interface_port clock_sink csi_clk50M clk Input 1


# 
# connection point clock_sink_1
# 
add_interface clock_sink_1 clock end
set_interface_property clock_sink_1 clockRate 32000
set_interface_property clock_sink_1 ENABLED true

add_interface_port clock_sink_1 csi_clk32k clk Input 1


# 
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clock_sink_1
set_interface_property avalon_streaming_source associatedReset reset
set_interface_property avalon_streaming_source dataBitsPerSymbol 32
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 0
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true

add_interface_port avalon_streaming_source aso_data_audio_out data Output 32
add_interface_port avalon_streaming_source aso_valid_audio_out valid Output 1


# 
# connection point phase_increments_voice1
# 
add_interface phase_increments_voice1 avalon end
set_interface_property phase_increments_voice1 addressUnits WORDS
set_interface_property phase_increments_voice1 associatedClock clock_sink
set_interface_property phase_increments_voice1 associatedReset reset
set_interface_property phase_increments_voice1 bitsPerSymbol 8
set_interface_property phase_increments_voice1 burstOnBurstBoundariesOnly false
set_interface_property phase_increments_voice1 burstcountUnits WORDS
set_interface_property phase_increments_voice1 explicitAddressSpan 0
set_interface_property phase_increments_voice1 holdTime 0
set_interface_property phase_increments_voice1 linewrapBursts false
set_interface_property phase_increments_voice1 maximumPendingReadTransactions 0
set_interface_property phase_increments_voice1 readLatency 0
set_interface_property phase_increments_voice1 readWaitTime 1
set_interface_property phase_increments_voice1 setupTime 0
set_interface_property phase_increments_voice1 timingUnits Cycles
set_interface_property phase_increments_voice1 writeWaitTime 0
set_interface_property phase_increments_voice1 ENABLED true

add_interface_port phase_increments_voice1 avs_writedata_phase_increments_voice1 writedata Input 32
add_interface_port phase_increments_voice1 avs_write_n_phase_increments_voice1 write_n Input 1
set_interface_assignment phase_increments_voice1 embeddedsw.configuration.isFlash 0
set_interface_assignment phase_increments_voice1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment phase_increments_voice1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment phase_increments_voice1 embeddedsw.configuration.isPrintableDevice 0

