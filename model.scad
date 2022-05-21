// Module representing a coin. All dimensions are specified in milimeters.
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
            translate([0,0, thickness]) CoinStack(capacity, diameter, thickness);
            translate([diameter-2, 0, thickness]) CoinStack(capacity, diameter, thickness);
            translate([diameter/PI,0,thickness*capacity-1]) scale([1.5, 1.5, 1]) Coin(diameter, thickness);
        }
}

capacity = 25;
diameter = 27.5;
thickness = 2.55;
Coiner(capacity, diameter, thickness);
translate([diameter*1.2, 0, 0]) Coin(diameter, thickness);
