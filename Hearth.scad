$fa=1;
$fn = 100;
$fs=0.01;

thikness = 0.4;

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

        rotate([0, 0, -45]) translate([-1, -1, 0]) cube([2.5, 2, thikness]);
        rotate([0, 0, -45]) translate([-1, -1.5, 0]) cube([2, 2.5, thikness]);
    }
    translate([1.3, -1.3, 0]) cylinder(h=thikness, r=0.3);
}
