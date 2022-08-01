v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 220 -280 220 -230 {
lab=A}
N 220 -280 240 -280 {
lab=A}
N 220 -230 220 -130 {
lab=A}
N 220 -130 240 -130 {
lab=A}
N 280 -250 280 -180 {
lab=O}
N 280 -180 280 -160 {
lab=O}
N 280 -280 310 -280 {
lab=VDD}
N 310 -330 310 -280 {
lab=VDD}
N 280 -330 310 -330 {
lab=VDD}
N 280 -330 280 -310 {
lab=VDD}
N 280 -360 280 -330 {
lab=VDD}
N 280 -130 310 -130 {
lab=VSS}
N 310 -130 310 -70 {
lab=VSS}
N 280 -70 310 -70 {
lab=VSS}
N 280 -100 280 -50 {
lab=VSS}
N 280 -200 330 -200 {
lab=O}
N 150 -200 220 -200 {
lab=A}
C {sky130_fd_pr/nfet_01v8.sym} 260 -130 0 0 {name=M1
L=0.15
W=1
nf=1 
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 260 -280 0 0 {name=M2
L=0.15
W=1
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 150 -200 0 0 {name=l1 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} 280 -360 2 0 {name=l2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 280 -50 3 0 {name=l4 sig_type=std_logic lab=VSS}
C {devices/iopin.sym} 0 -240 0 0 {name=p1 lab=A}
C {devices/iopin.sym} 0 -200 0 0 {name=p2 lab=O}
C {devices/iopin.sym} 0 -160 0 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 0 -130 0 0 {name=p4 lab=VSS}
C {devices/code.sym} -260 20 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt_mm

"
spice_ignore=false}
C {devices/code_shown.sym} 30 30 0 0 {name=NGSPICE
only_toplevel=false
value="

.control

save all

tran 0.1n 200n
write inv.raw
.endc
"}
C {devices/lab_pin.sym} 330 -200 2 0 {name=l7 sig_type=std_logic lab=O}
