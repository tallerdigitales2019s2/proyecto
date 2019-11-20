transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/gsegura/Documents/taller/proyecto/proyecto/Graphic_controller {/home/gsegura/Documents/taller/proyecto/proyecto/Graphic_controller/ImageComposer.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/proyecto/proyecto/Graphic_controller {/home/gsegura/Documents/taller/proyecto/proyecto/Graphic_controller/ImageComposer_aux.sv}
vlog -sv -work work +incdir+/home/gsegura/Documents/taller/proyecto/proyecto/Graphic_controller {/home/gsegura/Documents/taller/proyecto/proyecto/Graphic_controller/ImageComposer_tb.sv}

