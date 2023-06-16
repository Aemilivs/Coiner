$fn=100;

module Coin(diameter=27.5, thickness=2.55) {
    cylinder(h=thickness, r=diameter/2);
}

module CoinStack(capacity=25, diameter=27.5, thickness=2.55) {
    cylinder(h=capacity*thickness, r=diameter/2);
}

coefficient = 1.85;

module CoinerFrame(capacity, diameter, thickness) {
    scale([.9,1.1, coefficient]) CoinStack(1, diameter, thickness);
    translate([0, 0, thickness]) scale([.9,1.1,coefficient]) CoinStack(capacity, diameter, thickness);
    translate([0, 0, thickness*capacity*coefficient+thickness]) scale([.9,1.1,coefficient]) CoinStack(1, diameter, thickness);
}

module Coiner(capacity=25, diameter=27.5, thickness=2.55) {
    difference() {
        CoinerFrame(capacity, diameter, thickness);
        for (index=[1:capacity]) {
            translate([0, 0, thickness*(index)*coefficient]) Coin(diameter, thickness);
            translate([0, -diameter, thickness*(index)*coefficient]) cube([diameter+1, diameter*2, thickness]);
        }
       translate([-diameter/2, 0, -1]) CoinerFrame(capacity+2, diameter, thickness);
    }
}

// Capacity of coiner - 10 coins.
capacity = 5;
// Diameter and thickness of 50 CZK coin.
diameter = 27.5;
thickness = 2.55;
Coiner(capacity, diameter, thickness);
// color("red") translate([0, 0, thickness*coefficient]) CoinStack(1);