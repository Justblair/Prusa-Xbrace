// full crossbraces for simplified Prusa Mendel
// released january 2012 by Lanthan
// under creative commons - sharealike license. 
// in a state of total mess, nothing parametrized.
// inspired by:
// Lateral support for Prusa by Miro87043
// http://www.thingiverse.com/thing:14606
// and by the ubiquitous mendel angle.
// Great cleanup, colorization and parametrization by Justblair
//

// Variables
// ****************************************************************************
threaded_rod_squeeze = 0.27;		// The rods need to be tight when clamped8
// Options
// ****************************************************************************

// Includes
// ****************************************************************************
include <configuration.scad>


// Here comes the code!
// ****************************************************************************
// This is laid out editing purposes, it is OK for printing too (all pieces bases set at Z = 0

module printing() {

color ([1,1,1])					// white
translate([65,0,0]) 
	side_cross_left();
	
translate([-65,0,0])
	side_cross_right();

translate([65,0,0])
	side_cover_left();

color ([1,0,0])  				// Red
translate([-65,0,0]) 
	side_cover_right();
	
color ([0,1,0])  				// Green
translate([0,38,14]) 
rotate([180,0,0]) 
	crossbrace_top() ;

color ([0,0,1])					// Blue	
translate([0,0,7]) 
rotate([180,0,0]) 
	crossbrace_bracket();

}  // end printing module

printing();

// Modules
// ****************************************************************************



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

translate([0,0,13]) rotate([0,0,45/2]) cylinder(r=20.90500744, h=26, center=true, $fn=8) ; // body
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
	translate([0,0,14+12]) 
	rotate([0,180,0]) 
		difference(){
translate([0,0,13]) rotate([0,0,45/2]) cylinder(r=20.90500744, h=26, center=true, $fn=8) ; // body
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
translate([0,0,4]) rotate([0,0,45/2]) cylinder(r=20.90500744, h=8, center=true, $fn=8) ; 
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
translate([0,0,4]) rotate([0,0,45/2]) cylinder(r=20.90500744, h=8, center=true, $fn=8) ; 
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




