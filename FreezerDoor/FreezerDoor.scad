$fn = 20;

height = 120;
thikness = 4;
baseWidth = 60;
edgeWidth = 30;
gripRadius = 6;
gripHoleRadius = gripRadius- thikness;
gripMargin = gripRadius;

// space between edge & paw
pawSpace = 1;
pawWidth = 12;
pawHeight = 18;
holeRadius = 4;
holeLeftSpace = 3;
holeTopSpace = 3;
bevelAngle = 20;
bevelSize = 2;
bevelDepth = 1;

edgeBevelAngle = 30;
edgeBevelWidth = 3;
edgeHoleAngle = 60;
edgeHolePadding = 15;
edgeHoleWidth = 13;
edgeHoleHeight = 18; // from the bottom of the hole


// base
difference() {
    union() {
        cube([baseWidth, height, thikness]);
        translate([baseWidth - gripMargin, height/2, 0]) {
                rotate([90, 0, 0]) {
                    difference() {
                        cylinder(height, r=gripRadius, center=true);    // Grip
                    }
                }
        }
    }
    translate([baseWidth - gripMargin, height/2, 0]) {
            rotate([90, 0, 0]) {
                difference() {
                    cylinder(height, r=gripHoleRadius, center=true);// grip hole
                }
            }
    }
    translate([baseWidth - gripRadius - gripMargin, 0, -gripRadius]) {
        cube([gripRadius*2, height, gripRadius]);       // remove bottom
    }
}

// edge
difference() {
    cube([thikness, height, edgeWidth]);
    translate([0, 0, edgeWidth - edgeBevelWidth])
        rotate([0, -edgeBevelAngle, 0])
            cube([2*thikness, height, 2*thikness]);
    translate([0, 0, edgeWidth-edgeHoleHeight])
        rotate([0, 90-edgeHoleAngle, 0])
            translate([-edgeWidth, 0, 00]) {
                translate([0, edgeHolePadding, 0])
                    cube([edgeWidth, edgeHoleWidth, edgeWidth]);
                translate([0, height - edgeHolePadding - edgeHoleWidth, 0])
                    cube([edgeWidth, edgeHoleWidth, edgeWidth]);
            }
}


// paws
!translate([thikness + pawSpace, 0, thikness]) {
    difference() {
        cube([pawWidth, thikness, pawHeight]);
        // Hole
        translate([pawWidth/2, thikness/2, pawHeight - holeRadius - holeTopSpace]) {
            rotate([0, 90, 90]) {
                cylinder(thikness, r=holeRadius, center=true);
            }
        }
        // Bevel
        translate([0, 0, pawHeight - bevelSize]) 
            rotate([90-bevelAngle, 0, 0]) 
                cube([pawWidth, 2*bevelSize, 2*bevelSize]);
    }
}
translate([2 * thikness + pawSpace + pawWidth, height, 0]) rotate([0, 0, 180]) {
    translate([thikness, 0, thikness]) {
        difference() {
            cube([pawWidth, thikness, pawHeight]);
            // Hole
            translate([pawWidth/2, thikness/2, pawHeight - holeRadius - holeTopSpace]) {
                rotate([0, 90, 90]) {
                    cylinder(thikness, r=holeRadius, center=true);
                }
            }
            // Bevel
            translate([0, 0, pawHeight - bevelSize]) 
                rotate([90-bevelAngle, 0, 0]) 
                    cube([pawWidth, 2*bevelSize, 2*bevelSize]);
        }
    }
}
