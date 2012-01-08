// full crossbraces for simplified Prusa Mendel
// released january 2012 by Lanthan
// under creative commons - sharealike license. 
// code is a total mess, nothing is parametrized.
// inspired by:
// Lateral support for Prusa by Miro87043
// http://www.thingiverse.com/thing:14606
// and by the ubiquitous mendel angle.


// Here comes the code!

// translate([0,0,16]) crossbrace_base();

// Modules
// ****************************************************************************

module crossbrace_base() {
// ****************************************************************************
 difference(){
	union() {
		translate([17,-49,-16]) 
		rotate([0,0,60]) 
			vertex(with_foot=basefoot);
		cube([41,25,12], center=true);
    } // end union
	translate([0,-6,0]) 
		cylinder(r=2.1,h=80, center=true,$fn=9);
	translate([15,8,0]) 
		cylinder(r=2.1,h=80, center=true,$fn=9);
	translate([-15,8,0]) 
		cylinder(r=2.1,h=80, center=true,$fn=9);
	translate([0,0,0]) 
	rotate([0,90,0]) 
		cylinder(h=80,r=3.95, center=true);
	translate([0,0,50]) 
		cube([100,100,100], center=true); 
	} //end difference
} // end module


module crossbrace_top(){
// ****************************************************************************
difference(){
	linear_extrude(file="xbrace_top.dxf", height = 14, origin =[0,0]);
	translate([20,-20,7]) 
	rotate([45,90,0]) 
		cylinder(r=4.1, h=40, center=true);
	translate([-20,-20,7]) 
	rotate([-45,90,0]) 
		cylinder(r=4.1, h=40, center=true);
	rotate([0,90,0]) 
		cylinder(r=3.95, h=100, center=true);
	} // end difference
}  // end module

module side_cross_left() {
translate([0,0,14+12]) rotate([0,180,0]) difference(){
    linear_extrude(file="xbrace_side.dxf", height = 14+12, origin =[0,0]);

    rotate([90,90,0]) cylinder(r=3.95, h=60, center=true);
    translate([0,0,4+4])  rotate([-45,90,0]) cylinder(r=4.1, h=60, center=true);
    translate([0,0,4+4+8])  rotate([0,90,0]) cylinder(r=4.1, h=60, center=true);
translate([-10.606602,10.606602,0]) cylinder(r = 2, h = 80, center= true);
translate([10.606602,-10.606602,0]) cylinder(r = 2, h = 80, center= true);
    }
}//


module side_cross_right() {
translate([-45,0,14+12]) rotate([0,180,0]) difference(){
    linear_extrude(file="xbrace_side.dxf", height = 14+12, origin =[0,0]);

    rotate([90,90,0]) cylinder(r=3.95, h=60, center=true);
    translate([0,0,4+4])  rotate([45,90,0]) cylinder(r=4.1, h=60, center=true);
    translate([0,0,4+4+8])  rotate([0,90,0]) cylinder(r=4.1, h=60, center=true);
translate([-10.606602,-10.606602,0]) cylinder(r = 2, h = 80, center= true);
translate([10.606602,10.606602,0]) cylinder(r = 2, h = 80, center= true);

    }
}//


module side_cover_right() {
translate([0,45,8]) rotate([0,180,0]) difference(){
    linear_extrude(file="xbrace_side.dxf", height = 8, origin =[0,0]);
translate([10.606602,10.606602,0]) cylinder(r = 2, h = 80, center= true);
translate([-10.606602,-10.606602,0]) cylinder(r = 2, h = 80, center= true);
    rotate([90,90,0]) cylinder(r=3.95, h=60, center=true
);
    }
}//

module side_cover_left() {
translate([0,45,8]) rotate([0,180,0]) difference(){
    linear_extrude(file="xbrace_side.dxf", height = 8, origin =[0,0]);
translate([-10.606602,10.606602,0]) cylinder(r = 2, h = 80, center= true);
translate([10.606602,-10.606602,0]) cylinder(r = 2, h = 80, center= true);
    rotate([90,90,0]) cylinder(r=3.95, h=60, center=true);
    }
}//

//side_cross_left();
//side_cross_right();
//side_cover_left();
//translate([-45,0,0]) side_cover_right();

translate([0,38,14]) rotate([180,0,0]) crossbrace_top() ;


translate([0,0,7]) rotate([180,0,0]) crossbrace_bracket();

module crossbrace_bracket() {

difference(){
 	linear_extrude(file="xbrace_brac.dxf", height = 7, origin =[0,0]);
 rotate([0,90,0]) cylinder(r=3.96, h=100, center=true);
}
} ///




