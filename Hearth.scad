$fn = 100;
$fs = 0.01;
$fa = 1;

thikness = 0.4;

module heart() {
    difference() {
        union() {
            translate([-1, -1, 0]) {
                cylinder(h=thikness);
                cube([1, 1, thikness]);

                translate([2, 0, thikness]) rotate([0, 180, 0]) {
                    cylinder(h=thikness);
                    cube([1, 1, thikness]);
                }
            }

            rotate([0, 0, -45]) 
                translate([-1, -1, 0]) 
                    cube([2.5, 2, thikness]);
            rotate([0, 0, -45]) 
                translate([-1, -1.5, 0]) 
                    cube([2, 2.5, thikness]);
        }
        translate([1.3, -1.3, -0.1]) cylinder(h=thikness + 0.2, r=0.3);
    }
}

module coffee() {
    radius = 2;
    size = 2;
    scale = 1.3;
    // Container
    linear_extrude(1) projection() {
        rotate([0, -90, -90]) scale([1, 1, scale]) minkowski() {
            linear_extrude(radius, scale=scale) circle();
            rotate([0, 90, 0]) cylinder(r=thikness);
        }
    }
    // Hands
    linear_extrude(1) translate([size - 1, 1.1]) scale([1.15, 0.9]) rotate([0, 0, -10]) difference() {
        circle(radius - thikness);
        circle(size - 2 * thikness);
        translate([-size, -size, 0]) square([size, 2*size]);
    }
}

module watch() {
    // Bracelet
    scale([10, 10]) union() {
        circle();
        bracelet();
        rotate([0, 0, 180]) bracelet();
    }
    // Heads
    scale([10, 10, 1]) translate([0, 0, 0.5]) scale([0.8, 0.8, 10]) union() {
        rotate([0, 0, 60]) scale([1, 0.8, 1]) head();
        rotate([0, 0, -60]) head();
    }
    // Crown
    translate([0, 0, 1]) scale([10, 10]) difference() {
        circle();
        circle(r= 0.9);
     }
 }

module head() {
    scale(0.1) linear_extrude(1) polygon([[0, 0], [1, 7], [0, 10], [-1, 7]]);
}

module bracelet() {
    translate([-0.5, 0]) square([1, 1.75]);
}

module main() {
    rotate([0, 0, 180]) heart();
    translate([0, -0.2, 0.3]) rotate([0, 180, 0]) scale(0.45) coffee();
    translate([0.5, 0.5, 0]) scale([0.07, 0.07, 0.1]) rotate([0, 180, -30]) watch();
}

//scale(10) main();
watch();
//coffee();