//EVERYBODY ELSE IS USING THESE SAME VARIABLES SO USE THEM AND DO NOT CHANGE ANYTHING UNLESS THERE'S A GOOD FUCKING REASON
wholex=300;
wholey=300;
wholez=300;
thickness=7;
xysmoothr=4;
zsmoothr=5;
zleadr=2.5;
m3=1.8;
res=20;



//thickness of sides which motors and smoothrods mount to
sidethickness=30;
//thickness of top part, should not be the limiting factor of build height, smooth rod height, and smooth rod point of attachment will be.
topthickness=50;


translate([wholex/2,0,wholez/2])frontplate();


//These are the variables describing the cube which is subtracted from the larger front plate.
//s=size
sx=wholex-sidethickness;
sy=thickness+1;
sz=wholez-topthickness;

//These are the coordinates of the cylinders which represent the screwholes for the smooth rods and the motor mount. "cyl" is short for cylinder. 
cylx=137.5*wholex/300;
cyly=125*wholey/300;
cylz=125*wholez/300;

//Each pair of screwholes is separated by 5mm along the x-axis. Keep in mind that you might have to space the top and bottom screwholes differently in the final product, which would require that you create a different variable.
separation=5;

//Here are the z-coordinates of some more cylinders. Be ready to create another variable for their height or separation in the final product.
cilz=50*wholez/300;

//This is the front plate, aka the xz plate.

module frontplate(){
difference(){
cube(size=[wholex,thickness,wholez],center=true);

//Everything below this is the subtracted part.
#translate([0,0,-(wholez-sz)/2])cube([sx,sy,sz],center=true);

//These cylinders represent the screwholes holding the smooth rods in place.

#translate([cylx,cyly,cylz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([cylx-separation,cyly,cylz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([-cylx,cyly,cylz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([separation-cylx,cyly,cylz])rotate([90,0,0])cylinder(h=wholey,r=m3);

//These represent the screwholes that connect to the motor mount.
#translate([-cylx,cyly,-cylz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([separation-cylx,cyly,-cylz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([cylx,cyly,-cylz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([cylx-separation,cyly,-cylz])rotate([90,0,0])cylinder(h=wholey,r=m3);

//holes for bracket interface to attach right and left brace to front plate
#translate([cylx,cyly,cilz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([cylx,cyly,cilz-separation])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([-cylx,cyly,cilz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([-cylx,cyly,cilz-separation])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([-cylx,cyly,-cilz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([-cylx,cyly,-cilz-separation])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([cylx,cyly,-cilz])rotate([90,0,0])cylinder(h=wholey,r=m3);
#translate([cylx,cyly,-cilz-separation])rotate([90,0,0])cylinder(h=wholey,r=m3);
}
}

