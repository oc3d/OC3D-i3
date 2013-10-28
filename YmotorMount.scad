screwdistnema17=31;
xymot=40;
M3=1.8;
module topplate() {minkowski()
{
 cube([xymot,xymot,5]);
 cylinder(r=3,h=5);
}
}
//the holeplate module defines the motor bracket 
module holeplate(){
difference(){
	topplate();
	translate([(xymot-screwdistnema17)/2,(xymot-screwdistnema17)/2,-10]){
		translate([screwdistnema17,0,0])cylinder(r=M3,h=150);
		translate([0,screwdistnema17,0])cylinder(r=M3,h=150);
		cylinder(r=M3,h=150);
		translate([screwdistnema17,screwdistnema17,0])cylinder(r=M3, h=150);
		translate([xymot/2.5, xymot/2.5, 0])cylinder(r=15, h=150);
	}
}
}
//this function joins the four elements of the motormount
module braceplate(){
difference(){
	union() {
		holeplate();
		translate([0,-3,0])rotate([0,0,0])triangle(3,42);
		translate([0,xymot,0])triangle(3,42);
		translate([-3,-3,0])rotate([90,0,90])cube([46,42,3]);
}
	translate([-10,xymot/3,21])rotate([90,0,90])cylinder(r=M3, h=150);
	translate([-10,xymot/1.5,21])rotate([90,0,90])cylinder(r=M3, h=150);
}
}
//this module generates the triangular side brace
module triangle(thickness,h){
	difference(){
		cube([h, thickness, h]);
		translate([0,-5,h])rotate([0,45,0])cube([h*2,thickness+10,h]);
	}
}
module braceplatearm(){
union(){
	braceplate();
	translate([-23,2,5])rotate([90,0,0])minkowski()
{
	cube([20,1,2]);
	cylinder(r=5,h=3);
}
}
}
difference(){
	braceplatearm();
	rotate([90,0,0])translate([-xymot/2,5.5,-10])cylinder(r=M3,h=100);
	rotate([90,0,0])translate([-xymot/4,5.5,-10])cylinder(r=M3,h=100);
}




	