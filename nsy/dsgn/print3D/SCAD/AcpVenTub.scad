//fn=numb of fragments; fa=min angle; fs=min size

$fn=100;
$fa=12;
$fs=2;

Lc=40;
Hc=5;

Vre=20;
Vri=19;
Hve=5;
Hvi=10;

Vrt=2;
Lm=16.2;

Tre=13.4;
Tri=9.8;
RT=16.25;
Hti=5;
Hte=10;
Hrt=15;

Lt=50;

module M4(){
    cylinder(Hc,Vrt,Vrt, false);
}

//Acoplamiento Ventilador

difference(){
    translate([-Lc/2,-Lc/2,0])cube([Lc,Lc,Hc],center=false);
    translate([-Lm,-Lm,0])M4();
    translate([Lm,Lm,0])M4();
    translate([Lm,-Lm,0])M4();
    translate([-Lm,Lm,0])M4();
    cylinder(Hvi, Vri, Vri, center=false);
}
    
difference(){
    translate([0,0,Hc])cylinder(Hve, Vre, Vre, center=false);
    cylinder(Hvi, Vri, Vri, center=false);
}   
    
//Acoplamiento Tubería

difference(){
    translate([0,0,Hvi+Lt])cylinder(Hrt,RT,RT,center=false);
    translate([0,0,Hvi+Lt])cylinder(Hti,Tri,Tri,center=false);
    translate([0,0,Hvi+Lt+Hti])cylinder(Hte,Tre,Tre,center=false);
}

//Barrido
difference(){
    translate([0,0,Hvi])cylinder(Lt,Vre,RT,center=false);
    translate([0,0,Hvi])cylinder(Lt,Vri,Tri,center=false);
}