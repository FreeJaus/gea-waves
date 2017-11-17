//fn=numb of fragments; fa=min angle; fs=min size
$fn=100;
$fa=12;
$fs=2;

Re=9.81;
Ri=9.32;
Rb=4.92;
Ra=4.42;
xp=4.9;
yp=0.8;
H=39.2;

difference(){
    cylinder(H,Re,Re,false);
    cylinder(H,Ri,Ri,false);
}       
difference(){
    cylinder(H,Rb,Rb,false);
    cylinder(H,Ra,Ra,false);
}    
for(n=[1:8])
{
    rotate([0,0,n*45])
    {
        difference(){
            translate([Rb+(xp/2)-((Rb-Ra)/2),0,H/2]) cube([xp,yp,H],true);
            
        }
     }
}