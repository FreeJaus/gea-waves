//fn=numb of fragments; fa=min angle; fs=min size
//D exterior tuberia mm
$fn=100;
$fa=12;
$fs=2;

//Tanque
Tx=0.44;
Ty=0.325;
Tz=0.236;
//Canal
Cx=1.359;
Cy=0.25;
Cz=0.08;
//Pared Cámara
Px=0.006;
Py=0.225;
Pz=0.08;
//Chimney
Dc=0.0196;
Hc=0.316;
//Diafragma
d=0.0125;
Hd=0.002;

translate([Tx/2,Ty/2,Tz/2])
difference(){
union(){
    cube([Tx,Ty,Tz],true);
    translate([Tx/2+(Cx/2),Ty/2-(Cy/2),0]) cube([Cx,Cy,Cz],true);
    translate([Tx/2+Cx-(Cz/2),Ty/2,0])rotate([-90,0,0])cylinder(Hc,Dc/2,Dc/2,false);
}
    translate([Tx/2+Cx-(Cz+Px),Ty/2-(Py/2),0])cube([Px,Py,Pz],true);
    translate([Tx/2+Cx-(Cz/2),Ty/2+Hc-Hd,0])rotate([-90,0,0])cylinder(Hd,d/2,d/2,false);
}