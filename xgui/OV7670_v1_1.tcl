
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/OV7670_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  #Adding Group
  set Data_Format [ipgui::add_group $IPINST -name "Data Format" -parent ${Page_0}]
  set DATA_FORMATED [ipgui::add_param $IPINST -name "DATA_FORMATED" -parent ${Data_Format}]
  set_property tooltip {Format the output data to use them with a Xilinx AXI-Stream Video DMA} ${DATA_FORMATED}
  set DATA_RGB888_CONVERTED [ipgui::add_param $IPINST -name "DATA_RGB888_CONVERTED" -parent ${Data_Format}]
  set_property tooltip {Format the output data to be converted to full 8-bit range rgb888} ${DATA_RGB888_CONVERTED}
  set TDATA_WIDTH [ipgui::add_param $IPINST -name "TDATA_WIDTH" -parent ${Data_Format} -widget comboBox]
  set_property tooltip {Choose whether you want the rgb565 output data to be packaged in 16 or 24 bits} ${TDATA_WIDTH}

  #Adding Group
  set Resolution [ipgui::add_group $IPINST -name "Resolution" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "C_IMAGE_RES" -parent ${Resolution} -widget comboBox



}

proc update_PARAM_VALUE.DATA_RGB888_CONVERTED { PARAM_VALUE.DATA_RGB888_CONVERTED PARAM_VALUE.DATA_FORMATED } {
	# Procedure called to update DATA_RGB888_CONVERTED when any of the dependent parameters in the arguments change
	
	set DATA_RGB888_CONVERTED ${PARAM_VALUE.DATA_RGB888_CONVERTED}
	set DATA_FORMATED ${PARAM_VALUE.DATA_FORMATED}
	set values(DATA_FORMATED) [get_property value $DATA_FORMATED]
	if { [gen_USERPARAMETER_DATA_RGB888_CONVERTED_ENABLEMENT $values(DATA_FORMATED)] } {
		set_property enabled true $DATA_RGB888_CONVERTED
	} else {
		set_property enabled false $DATA_RGB888_CONVERTED
	}
}

proc validate_PARAM_VALUE.DATA_RGB888_CONVERTED { PARAM_VALUE.DATA_RGB888_CONVERTED } {
	# Procedure called to validate DATA_RGB888_CONVERTED
	return true
}

proc update_PARAM_VALUE.TDATA_WIDTH { PARAM_VALUE.TDATA_WIDTH PARAM_VALUE.DATA_RGB888_CONVERTED PARAM_VALUE.DATA_FORMATED } {
	# Procedure called to update TDATA_WIDTH when any of the dependent parameters in the arguments change
	
	set TDATA_WIDTH ${PARAM_VALUE.TDATA_WIDTH}
	set DATA_RGB888_CONVERTED ${PARAM_VALUE.DATA_RGB888_CONVERTED}
	set DATA_FORMATED ${PARAM_VALUE.DATA_FORMATED}
	set values(DATA_RGB888_CONVERTED) [get_property value $DATA_RGB888_CONVERTED]
	set values(DATA_FORMATED) [get_property value $DATA_FORMATED]
	if { [gen_USERPARAMETER_TDATA_WIDTH_ENABLEMENT $values(DATA_RGB888_CONVERTED) $values(DATA_FORMATED)] } {
		set_property enabled true $TDATA_WIDTH
	} else {
		set_property enabled false $TDATA_WIDTH
	}
}

proc validate_PARAM_VALUE.TDATA_WIDTH { PARAM_VALUE.TDATA_WIDTH } {
	# Procedure called to validate TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_IMAGE_RES { PARAM_VALUE.C_IMAGE_RES } {
	# Procedure called to update C_IMAGE_RES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_IMAGE_RES { PARAM_VALUE.C_IMAGE_RES } {
	# Procedure called to validate C_IMAGE_RES
	return true
}

proc update_PARAM_VALUE.DATA_FORMATED { PARAM_VALUE.DATA_FORMATED } {
	# Procedure called to update DATA_FORMATED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_FORMATED { PARAM_VALUE.DATA_FORMATED } {
	# Procedure called to validate DATA_FORMATED
	return true
}


proc update_MODELPARAM_VALUE.DATA_FORMATED { MODELPARAM_VALUE.DATA_FORMATED PARAM_VALUE.DATA_FORMATED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_FORMATED}] ${MODELPARAM_VALUE.DATA_FORMATED}
}

proc update_MODELPARAM_VALUE.DATA_RGB888_CONVERTED { MODELPARAM_VALUE.DATA_RGB888_CONVERTED PARAM_VALUE.DATA_RGB888_CONVERTED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_RGB888_CONVERTED}] ${MODELPARAM_VALUE.DATA_RGB888_CONVERTED}
}

proc update_MODELPARAM_VALUE.TDATA_WIDTH { MODELPARAM_VALUE.TDATA_WIDTH PARAM_VALUE.TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDATA_WIDTH}] ${MODELPARAM_VALUE.TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_IMAGE_RES { MODELPARAM_VALUE.C_IMAGE_RES PARAM_VALUE.C_IMAGE_RES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_IMAGE_RES}] ${MODELPARAM_VALUE.C_IMAGE_RES}
}

