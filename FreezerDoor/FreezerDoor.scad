$fn = ( $preview ? 20 : 200);

height = 98;
thikness = 2.3;
baseWidth = 35;
edgeWidth = 18.5;
gripRadius = 4;
gripHoleRadius = 3;
gripMargin = gripRadius;

// space between edge & paw
pawSpace = 1;
pawWidth = 8.5;
pawHeight = 10;
holeRadius = 2.3; // real diameter is 4.2
holeLeftSpace = 2;
holeTopSpace = 2;
bevelAngle = 20;
bevelSize = 2;
bevelDepth = 1;

edgeBevelAngle = 30;
edgeBevelWidth = thikness;
edgeHoleAngle = 60;
edgeHolePadding = 21;
edgeHoleWidth = 7;
edgeHoleHeight = 11.5; // from the bottom of the hole

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
    translate([baseWidth - gripMargin, height/2, gripRadius-gripHoleRadius-thikness]) {
            rotate([90, 0, 0]) {
                difference() {
                    #cylinder(height, r=gripHoleRadius, center=true);// grip hole
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
    #translate([edgeBevelWidth, 0, edgeWidth])
        rotate([0, 270-edgeBevelAngle, 0])
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
module paw() {
    difference() {
        cube([pawWidth, thikness, pawHeight + thikness]);
        // Hole
        translate([pawWidth/2, thikness/2, pawHeight + thikness - holeRadius - holeTopSpace]) {
            rotate([0, 90, 90]) {
                cylinder(thikness, r=holeRadius, center=true);
            }
        }
        // Bevel
        translate([0, 0, pawHeight - bevelSize + thikness]) 
            rotate([90-bevelAngle, 0, 0]) 
                cube([pawWidth, 2*bevelSize, 2*bevelSize]);
    }
}

union() {
    translate([thikness + pawSpace, 0, 0]) paw();
    translate([thikness + pawSpace + pawWidth, height, 0]) rotate([0, 0, 180]) paw();
}