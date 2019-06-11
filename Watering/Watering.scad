$fn = ($preview ? 16 : 256);

/*****************/
/*   Constants   */
/*****************/

thikness = 2;
holeRadius = 6;

// beak
beakLength = 30;
beakXScale = 1.5;
beaxYScale = 0.5;

// Base
baseLength = 30;
baseWidth = 15;
baseCutAngle = 40;

// refill
refillHeight = 5;

/*****************/
/*    Shapes     */
/*****************/

module beak() {
    mirror([0, 0, 1]) difference() {
        linear_extrude(height=beakLength, scale=[beakXScale, beaxYScale]) circle(holeRadius + thikness);
        linear_extrude(height=beakLength, scale=[beakXScale, beaxYScale]) circle(holeRadius);
    }
}

module base() {
    difference() {
        translate([baseWidth, -baseWidth, -baseLength]) cylinder(h=baseLength, r1=holeRadius + thikness, r2=baseWidth);
        translate([baseWidth, -baseWidth, -baseLength]) cylinder(h=baseLength, r1=holeRadius, r2=baseWidth-thikness);
        rotate([baseCutAngle]) mirror([0, 1, 0]) cube([2*baseWidth, 4*baseWidth, 2*baseWidth]);
    }
}

translate([baseWidth, -baseWidth, -baseLength]) beak();
// Refill
rotate([baseCutAngle, 0, 0]) linear_extrude(height=refillHeight) projection(cut=true) translate([0, 0, 0.2]) rotate([-baseCutAngle, 0, 0]) translate([0, 0, 0]) base();
base();
