v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 877.5 0 895 0 {
lab=out}
N 590 -300 600 -300 {
lab=VDD}
N 600 -300 600 -260 {
lab=VDD}
N -80 -0 -80 70 {
lab=in}
N -180 30 -180 60 {
lab=VDD}
N -180 60 -180 70 {
lab=VDD}
N 210 0 290 0 {
lab=in}
N 895 -0 900 0 {
lab=out}
C {inv.sym} 600 0 0 0 {}
C {devices/vsource.sym} -80 100 0 0 {name=V1 value="pulse 0 1.8 2n 1n 1n 10n 20n"}
C {devices/gnd.sym} 600 262.5 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -180 100 0 0 {name=V2 value=1.8}
C {devices/gnd.sym} -180 130 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -80 130 0 0 {name=l3 lab=GND}
C {devices/code.sym} -380 300 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt_mm

"
spice_ignore=false}
C {devices/code_shown.sym} -90 310 0 0 {name=NGSPICE
only_toplevel=false
value="
.include ../netgen/inv_pex.spice
.control

save all

tran 0.1n 200n
write inv_TB.raw
plot v(out) v(in)+3
.endc
"}
C {devices/lab_pin.sym} -180 30 2 0 {name=l13 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 590 -300 1 0 {name=l4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -80 0 2 0 {name=l5 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 210 0 0 0 {name=l6 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 900 0 2 0 {name=l7 sig_type=std_logic lab=out}
