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


Tre=13.25;
Tri=9.8;
RT=16.25;
Hti=5;
Hte=10;
Hrt=15;

Lt=100;

//Barrido
difference(){
    cylinder(Lt,AR,RT,center=false);
    cylinder(Lt,Ari,Tri,center=false);
}

//Acoplamiento Tubería

difference(){
    translate([0,0,Lt])cylinder(Hrt,RT,RT,center=false);
    translate([0,0,Lt])cylinder(Hti,Tri,Tri,center=false);
    translate([0,0,Lt+Hti])cylinder(Hte,Tre,Tre,center=false);
}