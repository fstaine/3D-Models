$fn = 30;

/*****************/
/*   Constants   */
/*****************/

thikness = 3;
holeradius = 6;

// beak
beakLength = 30;

angle=20;

// Base
baseLength = 20;
baseWidth = 15;

/*****************/
/*    Shapes     */
/*****************/

// Beak
difference() {
    linear_extrude(height=beakLength, scale=[1.5, 0.5]) circle(holeradius);
    linear_extrude(height=beakLength, scale=[1.5, 0.5]) circle(holeradius - thikness);
}
%translate([0, 0, -baseLength/2]) cube([2*baseWidth, 2*baseWidth, 2*baseWidth], center=true);
translate([0, -sin(angle)*holeradius, sin(angle)*holeradius]) rotate([angle, 0, 0]) difference() {
    rotate([180, 0, 0]) linear_extrude(height=baseLength, scale=baseWidth / holeradius) circle(holeradius);
    rotate([180, 0, 0]) linear_extrude(height=baseLength, scale=baseWidth / (holeradius - thikness)) circle(holeradius - thikness);
}
