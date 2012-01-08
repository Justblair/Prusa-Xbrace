// full crossbraces for simplified Prusa Mendel
// released january 2012 by Lanthan
// under creative commons - sharealike license. 
// code is a total mess, nothing is parametrized.
// inspired by:
// Lateral support for Prusa by Miro87043
// http://www.thingiverse.com/thing:14606
// and by the ubiquitous mendel angle.

// Variables
// ****************************************************************************
threaded_rod_squeeze = 0.15;		// The rods need to be tight when clamped

// Options
// ****************************************************************************

// Includes
// ****************************************************************************
include <configuration.scad>


// Here comes the code!
// ****************************************************************************
// This is laid out editing purposes, still need to sort out printing options
color([.5,.5,0])
translate([0,-35,6]) 
	crossbrace_base();

color ([1,1,1])					// white
translate([70,0,0]) 
	side_cross_left();
	
translate([-30,0,0])
	side_cross_right();

translate([70,0,0])
	side_cover_left();

color ([1,0,0])  				// Red
translate([-70,0,0]) 
	side_cover_right();
	
color ([0,1,0])  				// Green
translate([0,38,14]) 
rotate([180,0,0]) 
	crossbrace_top() ;

color ([0,0,1])					// Blue	
translate([0,0,7]) 
rotate([180,0,0]) 
	crossbrace_bracket();

// Modules
// ****************************************************************************
// Not sure what this is for?  I am guessing it was used during setup... BT

module crossbrace_base() {
// ****************************************************************************
 difference(){
	union() {
		// translate([17,-49,-16]) 
		// rotate([0,0,60]) 
			// vertex(with_foot=basefoot);
		cube([41,25,12], center=true);
    } // end union
	translate([0,-6,0]) 
		cylinder(r=m3_diameter/2,h=80, center=true,$fn=9);
	translate([15,8,0]) 
		cylinder(r=m3_diameter/2,h=80, center=true,$fn=9);
	translate([-15,8,0]) 
		cylinder(r=m3_diameter/2,h=80, center=true,$fn=9);
	translate([0,0,0]) 
	rotate([0,90,0]) 
		cylinder(h=80,r=threaded_rod_diameter/2 - threaded_rod_squeeze, center=true);
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
		#cylinder(r=threaded_rod_diameter/2, h=40, center=true);
	translate([-20,-20,7]) 
	rotate([-45,90,0]) 
		#cylinder(r=threaded_rod_diameter/2, h=40, center=true);
	rotate([0,90,0]) 
		# cylinder(r=threaded_rod_diameter/2, h=100, center=true);		// M8 Threaded Rod
	} // end difference
}  // end module

module side_cross_left() {
// ****************************************************************************
	translate([0,0,14+12]) 
	rotate([0,180,0]) 
		difference(){
			linear_extrude(file="xbrace_side.dxf", height = 14+12, origin =[0,0]);
			rotate([90,90,0]) 
				# cylinder(r=threaded_rod_diameter/2 - threaded_rod_squeeze, h=60, center=true);
			translate([0,0,4+4])  
			rotate([-45,90,0]) 
				# cylinder(r=threaded_rod_diameter/2, h=60, center=true);
			translate([0,0,4+4+8])  
			rotate([0,90,0]) 
				#cylinder(r=threaded_rod_diameter/2, h=60, center=true);
			translate([-10.606602,10.606602,0]) 
				# cylinder(r = m3_diameter/2, h = 80, center= true);
			translate([10.606602,-10.606602,0]) 
				# cylinder(r = m3_diameter/2, h = 80, center= true);
		} // end difference
} // end module

module side_cross_right() {
// ****************************************************************************
	translate([-45,0,14+12]) 
	rotate([0,180,0]) 
		difference(){
			linear_extrude(file="xbrace_side.dxf", height = 14+12, origin =[0,0]);
			rotate([90,90,0]) 
				cylinder(r=threaded_rod_diameter/2 - threaded_rod_squeeze, h=60, center=true);
			translate([0,0,4+4])  
			rotate([45,90,0]) 
				cylinder(r=threaded_rod_diameter/2, h=60, center=true);
			translate([0,0,4+4+8])  
			rotate([0,90,0]) 
				cylinder(r=threaded_rod_diameter/2, h=60, center=true);
			translate([-10.606602,-10.606602,0]) 
				cylinder(r = m3_diameter/2, h = 80, center= true);
			translate([10.606602,10.606602,0]) 
				cylinder(r = m3_diameter/2, h = 80, center= true);
		} // end difference
}// end module

module side_cover_right() {
// ****************************************************************************
	translate([0,45,8]) 
	rotate([0,180,0]) 
		difference(){
			linear_extrude(file="xbrace_side.dxf", height = 8, origin =[0,0]);
			translate([10.606602,10.606602,0]) 
				cylinder(r = m3_diameter/2, h = 80, center= true);
			translate([-10.606602,-10.606602,0]) 
				cylinder(r = m3_diameter/2, h = 80, center= true);
			rotate([90,90,0]) 
				cylinder(r=threaded_rod_diameter/2 - threaded_rod_squeeze, h=60, center=true);
		} // end difference
}// end module

module side_cover_left() {
// ****************************************************************************
	translate([0,45,8]) 
	rotate([0,180,0]) 
		difference(){
			linear_extrude(file="xbrace_side.dxf", height = 8, origin =[0,0]);
			translate([-10.606602,10.606602,0]) 
				cylinder(r = m3_diameter/2, h = 80, center= true);
			translate([10.606602,-10.606602,0]) 
				cylinder(r = m3_diameter/2, h = 80, center= true);
			rotate([90,90,0]) 
				cylinder(r=threaded_rod_diameter/2 - threaded_rod_squeeze, h=60, center=true);
		} // end difference
}// end module

module crossbrace_bracket() {
// ****************************************************************************
	difference(){
	linear_extrude(file="xbrace_brac.dxf", height = 7, origin =[0,0]);
	rotate([0,90,0]) 
		cylinder(r=threaded_rod_diameter/2 - threaded_rod_squeeze, h=100, center=true);
	} // end difference
} // end module




