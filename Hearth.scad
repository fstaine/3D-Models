$fn = ($preview ? 32 : 100);

thikness = 0.4;

module heart(scale=[1, 1, 1]) {
    scale(scale) difference() {
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
        translate([1.3, -1.3, 0]) cylinder(h=thikness, r=0.3);
    }
}

module coffee() {
    radius = 2;
    size = 2;
    scale = 1.3;
    projection() {
        rotate([0, -90, -90]) scale([1, 1, scale]) minkowski() {
            linear_extrude(radius, scale=scale) circle();
            rotate([0, 90, 0]) cylinder(r=thikness);
        }
    }
    translate([size - 1, 1 + thikness / 2]) scale([1.4, 1]) rotate([0, 0, -10]) difference() {
        circle(radius - thikness);
        circle(size - 2 * thikness);
        translate([-size, -size, 0]) square([size, 2*size]);
    }
}

module watch(scale) {
   // Bracelet
    union() {
        circle();
        bracelet(scale);
        rotate([0, 0, 180]) bracelet(scale);
    }
    // Heads
    union() {
        head();
    }
}

module bracelet(scale) {
    scale(scale) translate([-0.5, 0]) square([1, 1.75]);
}

//heart(scale=[1, 1, 1]);

//coffee();
watch();