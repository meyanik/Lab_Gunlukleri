v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 660 -120 660 -100 {
lab=GND}
N 740 -200 770 -200 {
lab=OUT}
N 690 -300 690 -280 {
lab=VDD}
N 90 -100 90 -90 {
lab=GND}
N 90 -110 90 -100 {
lab=GND}
N 90 -200 90 -170 {
lab=VDD}
N 340 -50 340 -40 {
lab=GND}
N 340 -60 340 -50 {
lab=GND}
N 340 -150 340 -120 {
lab=#net1}
N 560 -240 580 -240 {
lab=#net2}
N 770 -200 770 -170 {
lab=OUT}
N 770 -110 770 -70 {
lab=GND}
N 520 -240 560 -240 {
lab=#net2}
N 440 -210 440 -200 {
lab=#net1}
N 340 -170 340 -150 {
lab=#net1}
N 440 -200 440 -190 {
lab=#net1}
N 340 -180 340 -170 {
lab=#net1}
N 520 -160 580 -160 {
lab=#net3}
N 440 -130 440 -110 {
lab=#net3}
N 440 -290 440 -270 {
lab=#net2}
N 520 -270 520 -240 {
lab=#net2}
N 340 -200 340 -180 {
lab=#net1}
N 340 -200 440 -200 {
lab=#net1}
N 440 -290 520 -290 {
lab=#net2}
N 520 -290 520 -270 {
lab=#net2}
N 440 -110 520 -110 {
lab=#net3}
N 520 -160 520 -120 {
lab=#net3}
N 520 -120 520 -110 {
lab=#net3}
C {devices/code_shown.sym} 10 40 0 0 {name=NGSPICE
only_toplevel=true 
value="

.include ../netgen/five_T_OTA_pex.spice
.control

save all

op
write five_T_OTA_TB.raw

ac dec 10 1 10e9
set appendwrite
write five_T_OTA_TB.raw

plot db(v(out)) 180*cph(v(out))/pi

.endc
"}
C {devices/code.sym} -460 40 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {devices/launcher.sym} -210 60 0 0 {name=h1
descr=Backannotate 
tclcommand="ngspice::annotate"}
C {devices/launcher.sym} -210 100 0 0 {name=h2
descr="View Raw file" 
tclcommand="textwindow $netlist_dir/five_T_OTA_TB.raw"}
C {five_T_OTA.sym} 660 -200 0 0 {name=x1}
C {devices/gnd.sym} 660 -100 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 90 -140 0 0 {name=V1 value=1.8}
C {devices/gnd.sym} 90 -90 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 440 -240 2 0 {name=V2 value="0 AC 0.5"}
C {devices/vsource.sym} 340 -90 0 0 {name=V3 value=0.9}
C {devices/gnd.sym} 340 -40 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 770 -200 2 0 {name=l5 sig_type=std_logic lab=OUT}
C {devices/lab_pin.sym} 690 -300 1 0 {name=l7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 90 -200 1 0 {name=l8 sig_type=std_logic lab=VDD}
C {devices/capa.sym} 770 -140 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 770 -70 0 0 {name=l19 lab=GND}
C {devices/spice_probe.sym} 760 -200 0 0 {name=p1 attrs=""
voltage=0.8769}
C {devices/vsource.sym} 440 -160 2 0 {name=V4 value="0 AC 0.5"}
