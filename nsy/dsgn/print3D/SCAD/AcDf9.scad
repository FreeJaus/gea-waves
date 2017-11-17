//fn=numb of fragments; fa=min angle; fs=min size
//D exterior tuberia mm
$fn=100;
$fa=12;
$fs=2;

DTi=26.57;
//D tubo para la base
Dti=29.5;
Dte=31.5;
//Altura base exterior
He=2;
Hi=6;

//D diafragma
Df=9;
Hf=2;

Ht=He+Hi;

difference(){
difference(){
    union(){
        cylinder(h=He ,d=Dte ,center=false);
        translate ([0,0,He])cylinder($fn=100, $fa=12, $fs=2, h=Hi ,d=Dti ,center=false);
    }
    translate([0,0,Hf])cylinder(h=Ht ,d=DTi ,center=false);
}
translate([0,0,-Hf])cylinder(h=Hf*4 ,d=Df ,center=false);
}

