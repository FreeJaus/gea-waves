//fn=numb of fragments; fa=min angle; fs=min size

$fn=100;
$fa=12;
$fs=2;

//Soporte
Rs=12.5;
Hs=95;
Rm=2.5;
Hm=3;
Rt=9.5;

//Base
Rb=50;
Hb=12;

Hi=10;


difference(){
    cylinder(Hs,Rs,Rs,false);
    translate([0,0,Hm])cylinder(Hs,Rt,Rt);
    cylinder(Hm,Rm,Rm,false);
}
