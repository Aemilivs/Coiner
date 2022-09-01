// Module representing a coin. All dimensions are specified in milimeters.

$fn=100;

module Coin(diameter=27.5, thickness=2.55) {
    cylinder(h=thickness, r=diameter/2);
}

// Capacity specified in amount of coins.
module CoinStack(capacity=25, diameter=27.5, thickness=2.55) {
    scale([1,1,capacity])
        color("Honeydew") Coin(diameter);
}

module Coiner(capacity=25, diameter=27.5, thickness=2.55) {
    difference() {
            scale([1.2, 1.2, 1]) CoinStack(capacity+2, diameter, thickness);
            // Add 0.15 mm shift to the radius of a coin for space access.
            translate([0, 0, thickness]) CoinStack(capacity, diameter+0.3, thickness);
            translate([diameter-2, 0, thickness]) CoinStack(capacity, diameter, thickness);
            translate([diameter/PI,0,thickness*capacity-1]) scale([1.5, 1.5, 1]) Coin(diameter, thickness);
        }
}

capacity = 25;
diameter = 27.5;
thickness = 2.55;
rotate(0,-90,00) Coiner(capacity, diameter, thickness);
// translate([diameter*1.2, 0, 0]) Coin(diameter, thickness);