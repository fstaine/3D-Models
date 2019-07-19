
/**********************/
/*      Includes      */
/**********************/
include <inc/threads.scad>;

/**********************/
/*      Constats      */
/**********************/
$fn= ( $preview ? 10 : 16);

/**********************/
/*       Shapes       */
/**********************/

union() {
    translate([0, 0, 5]) {
        metric_thread(diameter=8, length=6);
        translate([0, 0, 6]) cylinder(d=8, h=6);
        translate([0, 0, 12]) linear_extrude(3) circle(r=5, $fn=6);
    }
}

difference() {
    linear_extrude(4) circle(r=5, $fn=6);
    #metric_thread(diameter=8, length=4);
}
