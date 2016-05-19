//cm

Tw=22;
Tl=43;
Th=32;

tw=8;
tl=250;
th=26.5;

rotate([0,-90,-90]){
rotate([6,0,0]){
translate([Tw/2,Tl/2,Th/2]){
union(){
    cube([Tw,Tl,Th],true);
    translate([0,Tl/2+tl/2,Th/2-th/2])cube([tw,tl,th],true);
    translate([0,Tl+tl,0])cube([Tw,Tl,Th],true);
}
}
}
}