// PRUSA Mendel  
// Configuration file
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// PLEASE SELECT ONE OF THE CONFIGURATIONS BELOW
// BY UN-COMMENTING IT

// Uncomment for metric settings
// METRIC METRIC METRIC METRIC METRIC METRIC METRIC METRIC 

include <metric.scad>;

// CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM

thin_wall = 3;

// LM8UU
linear = true;


// CHANGE ONLY THE STUFF YOU KNOW
// IT WILL REPLACE DEFAULT SETTING

// *******************RODS********************************

// DEFAULT threaded_rod_diameter = 8.2; 
// DEFAULT threaded_rod_diameter_horizontal = 8.2;
// DEFAULT smooth_bar_diameter = 8;
// DEFAULT smooth_bar_diameter_horizontal = 8.5;

threaded_rod_diameter = 8.2;  // Good Value, Vertexs printed OK

// *****************Nuts and bolts***************************

// DEFAULT m8_diameter = 9; 
// DEFAULT m8_nut_diameter = 14.1;

m8_diameter = 8.2; 
m8_nut_diameter = 15.8;

// DEFAULT m4_diameter = 4.5;
// DEFAULT m4_nut_diameter = 9;

// DEFAULT m3_diameter = 3.6;  // Good Value, Endstops printed ok

m3_diameter = 4.05;

// DEFAULT m3_nut_diameter = 5.3;
// DEFAULT m3_nut_diameter_horizontal = 6.1;

m3_nut_diameter = 5.8; // Good Value, Clamps printed OK
m3_nut_diameter_horizontal = 6.5;  //Good Value, Endstops printed OK

// ****************Bushing holder****************************

// bushing_core_diameter = smooth_bar_díameter;
// bushing_material_thickness = 0;

// DEFAULT bushing_core_diameter = smooth_bar_diameter; 
// DEFAULT bushing_material_thickness = 1;

///counted stuff
m3_nut_diameter_bigger = ((m3_nut_diameter  / 2) / cos (180 / 6))*2;

// functions 
include <functions.scad>

// *******************Motors******************************** 

// DEFAULT motor_shaft = 5.5;
