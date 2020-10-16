transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/brian/Documents/introtutorial {C:/Users/brian/Documents/introtutorial/t_processorV1.v}
vlog -vlog01compat -work work +incdir+C:/Users/brian/Documents/introtutorial {C:/Users/brian/Documents/introtutorial/processorV1.v}
vlog -vlog01compat -work work +incdir+C:/Users/brian/Documents/introtutorial {C:/Users/brian/Documents/introtutorial/register4x8.v}
vlog -vlog01compat -work work +incdir+C:/Users/brian/Documents/introtutorial {C:/Users/brian/Documents/introtutorial/alu.v}

