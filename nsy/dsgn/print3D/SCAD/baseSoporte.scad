//fn=numb of fragments; fa=min angle; fs=min size

$fn=100;
$fa=12;
$fs=2;

//Soporte
Rs=12.8;
Hs=95;
Rm=2.5;
Hm=3;
Rt=9.5;

//Base
Rb=50;
Hb=12;

Hi=10;


difference(){
    cylinder(Hb,Rb,Rb,false);
    translate([0,0,Hb-Hi])cylinder(Hi,Rs,Rs,false);
    for(n=[1:6])
        {
        rotate([0,0,n*60])
        {
            difference(){
            translate([((Rb-Rs)/2)+Rs,0,0]) cylinder(Hb,Rs,Rs,false);
        }
     }
}
    
}
