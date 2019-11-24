
$fn = ($preview ? 16 : 256);

holeDiam = 2.7;
circleDiam = 7.9;
spacement = 41.8;
stopDiam = 2.8;

gripRadius = 20;

stopOut = 1.2;

maxThikness = 9;
medThikness = 6;
smallThikness = 3;

overThiknessWidth = 13;

width = 56;
pawWidth = 17;

centerSpacement = holeDiam/2 + spacement - stopDiam/2;
gripCenter = [-8, -10];

difference() {
linear_extrude(width) {
	difference() {
		union() {
			circle(d=circleDiam);
			translate([circleDiam/2*sin(45), -circleDiam/2*cos(45)]) rotate(45) square([11, 3]);
			translate([0, circleDiam/2]) rotate(270+10) square([(circleDiam-holeDiam)/2, 7]);
		}
		circle(d=holeDiam);
	}

	translate([9, 6]) minkowski() {
		polygon([[0, 0], [overThiknessWidth, 0], [overThiknessWidth, smallThikness/2], [0, smallThikness]]);
		circle(1.25);
	}

	translate([centerSpacement, 0]) {
		circle(d=stopDiam);
		minkowski() {
			translate([0, 0.3-stopDiam/2]) difference() {
				translate(gripCenter) circle(gripRadius);
				rotate(-115) square(50);
				rotate(90) square(50);
				rotate(180) square(50);
			}
			circle(0.3);
		}
		*rotate(270) square([7, 12]);
		translate([0, 7.52]) rotate(180) {
			square([34, smallThikness]);
			translate([0.3, smallThikness]) difference() {
				square();
				translate([1, 1]) circle(1);
			}
		}
	}

	translate([11.35, 2.52]) difference() {
		translate([-4, 0]) square([6, 3]);
		rotate([0, 0, -71]) scale([1, 3]) circle(1.5);
	}
}
#translate([-10, -5, pawWidth]) cube([30, 20, width - 2 * pawWidth]);
}
