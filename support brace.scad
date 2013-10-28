wholex=300;
wholey=300;
wholez=300;
screwdistnema17=31;
xysmoothr=4;
zsmoothr=5;
zleadr=2.5;
basey=wholey*.75;
thickness= 7;
M3=1.8;

//the center point for each bracket is at a one-third and two-thirds the lenght of each respective edge of the brace
zbracket1=wholez*.33;
zbracket2=wholez*.66;

ybracket1=basey*.33;
ybracket2=basey*.66;

//this is the distance of the screw-holes from any edge of the brace
bracketins=15;


sidebracket ();

translate([wholex-thickness,0,0])
sidebracket ();



module sidebracket()	{
//this is the support-brace, extending behind the printer
difference()	{
translate([0,basey,0]);
cube([thickness,basey,wholez]);

//the next four holes are for screws in the vertical brackets, 25mm into the brace, screws spaced 10mm apart within each bracket
translate([-thickness,bracketins,zbracket1-5])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);

translate([-thickness,bracketins,zbracket1+5])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);

translate([-thickness,bracketins,zbracket2-5])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);

translate([-thickness,bracketins,zbracket2+5])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);


//the next four holes are for screws in the horizontal brackets, 25mm into the brace, screws spaced 10mm apart within each bracket
translate([-thickness,ybracket1-5,bracketins])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);

translate([-thickness,ybracket1+5,bracketins])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);

translate([-thickness,ybracket2-5,bracketins])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);

translate([-thickness,ybracket2+5,bracketins])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);


//these are the screw holes for the motor
translate([-thickness,bracketins,bracketins+5])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);

translate([-thickness,bracketins,bracketins+15])
rotate([0,90,0])
cylinder(thickness*5,M3,M3);


//this is the angle to be cut away from the brace, to make a sexy slant
translate([0,basey,0])
rotate([22.5,0,0])	
translate([-thickness/2,0,-50])	
cube([thickness*2,wholey/2,wholez+100]);

}
}






