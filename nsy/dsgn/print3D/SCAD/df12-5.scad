//fn=numb of fragments; fa=min angle; fs=min size

$fn=100;
$fa=12;
$fs=2;

//D tubo para la base
Dte=31;
//Altura base exterior
He=2;

//D diafragma
Df=12.5;
Hf=2;

difference(){
        cylinder(h=He ,d=Dte ,center=false);
        translate([0,0,-Hf])cylinder(h=Hf*4 ,d=Df ,center=false);
}

