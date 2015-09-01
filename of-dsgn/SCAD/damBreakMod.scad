//Thickness

neg=false;

tw=8; //Tank Width
th=4; //Tank Height

cw=.5; //Chimney Widh
ciw=.375; //Chimney Inner Width (outlet)
ch=2.5; //Chimney Height

nw=2;
nh=0;
fw=0;
fh=.5;

l0w=.5;
l0h=.5;
l1w=.25;
l1h=.125;
l4w=1;
l4h=1;
l5w=.5;
l5h=2;
l6w=.75;
l6h=.5;

//----

p0=[0,0];
p1=[tw-l0w,0];
p2=[tw,l0h];
p4=[tw-l1w,th-ch];
p3=[tw,p4[1]-l1h];
p5=[p4[0]-(cw-ciw)/2,th];
p6=[p4[0]-(cw+ciw)/2,th];
p7=[p4[0]-cw,th-ch];
p8=[p7[0]-l4w,p7[1]-l4h];
p12=[p7[0]-nw,th-nh];
p11=[p12[0]-l6w,p12[1]-l6h];
p10=[p11[0]-fw,p11[1]-fh];
p9=[p10[0]+l5w,p10[1]-l5h];
p13=[0,th];

//----

module posmod() {
linear_extrude(height = 1, center = false, convexity = 50, twist = 0, slices = 1, scale = 1) {
  polygon([p0,[3,.5],p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13]);
}
}

//----

if (neg) {
  scale(1/.99,1/.99,1/.99) {
    translate([-.005,-.005,-.005]) {
      difference(){
        translate([.005,.005,.005]) {
          cube([tw+.25*.99,th*.99,.99],center = false);
        }
        posmod();
      }
    }
  }
} else {
posmod();
}