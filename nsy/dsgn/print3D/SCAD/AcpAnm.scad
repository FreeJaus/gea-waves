//fn=numb of fragments; fa=min angle; fs=min size

$fn=100;
$fa=12;
$fs=2;

Are=35.1;
Ari=33.3;
Hae=10;
Hai=5;
AR=38.1;
Har=Hae+Hai;

Lx=25.6;
Ly=28.5;
Lyr=25;

Tre=13.25;
Tri=9.8;
RT=16.25;
Hti=5;
Hte=10;
Hrt=15;

Lt=100;


//Acoplamiento Anemómetro
difference(){
    union(){
        translate([-Lx/2,-Lyr-Are,0])cube([Lx,Ly,Hai], center=false);
        cylinder(Har,AR,AR,center=false);
    }

    cylinder(Hai,Ari,Ari,center=false);
    translate([0,0,Hai])cylinder(Hae,Are,Are,center=false);
translate([-Lx/2,-Lyr-Are,Hai])cube([Lx,Ly,Har], center = false);

}        

