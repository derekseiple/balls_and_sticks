/*
 * connector_pin.scad
 * 
 * This modlue will create a connection pin that will be used to connect the different atoms together. The design aims
 * to be easily printable, easy to pull in and out, but also provide sufficent grip to hold the parts together.
 */

 use <MCAD/2Dshapes.scad>;

module connector_pin() {
  _top_half(base_unit = 1);
  mirror([0, 0, 1]) _top_half(base_unit = 1);
}

/*
 * This is a helper that creates the top half of the pin which is then mirrored to also make the bottom half.
 */
module _top_half(base_unit = 1) {
    rotate_extrude() {
    difference() {
      union() {
        // The outer boundary
        // TODO use circular segment to calculate rightstuff // https://en.wikipedia.org/wiki/Circular_segment
        pieSlice(3 * base_unit, 0, 90);
        square(size = [2.5 * base_unit, 8 * base_unit], center = false);
        translate([0, 8 * base_unit, 0])
          pieSlice(3 * base_unit, 270, 360);
      };
      // The inner boundary
      square(size = [1.5 * base_unit, 8 * base_unit], center = false);
    }
  }
}



// Just hear for testing...
$fa = 1;
$fs = 0.4;
connector_pin();
