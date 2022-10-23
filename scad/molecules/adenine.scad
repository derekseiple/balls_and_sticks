
/*
 * adenine.scad
 *
 * Copyright © 2022 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;
include <../atoms/atom_utils.scad>;
use <../atoms/element_properties.scad>;
include <../atoms/elements.scad>;
use <../atoms/atom.scad>;
use <../utils/n_gon_utils.scad>;


/*
 * This module allows us to generate all of the atoms in the adenine molecule: https://en.wikipedia.org/wiki/Adenine
 * As this molecule has a standard numbering of the individual atoms, you can pass that as an argument to generate the
 * particular atom you want. For example adenine("C6") will produce the C6 atom.
 */
module adenine(atom = "") {
  if (atom == "N1") { N1(); }
  else if (atom == "C2") { C2(); }
  else if (atom == "H2") { H2(); }
  else if (atom == "N3") { N3(); }
  else if (atom == "C4") { C4(); }
  else if (atom == "C5") { C5(); }
  else if (atom == "C6") { C6(); }
  else if (atom == "N6") { N6(); }
  else if (atom == "H6") { H6(); }
  else if (atom == "N7") { N7(); }
  else if (atom == "C8") { C8(); }
  else if (atom == "N9") { N9(); }
  else {
    assert(false, str("Unknown atom supplied for adenine: ", atom));
  }

  // Sub modules and functions below //

  module N1() {
    // get distances and angles related to N1-N6
    dn1n6 = 3_gon_distances(C6_N1(), C6_N6(), N1_C6_N6());
    an1n6 = 3_gon_angles(dn1n6, N1_C6_N6());
    rotate([0, -90, 0]) {
      space_filling_atom(
        atom_radius = van_der_waals_radius(N),
        color_name = cpk_color(N),
        bonds = [
          // Bond with C2
          [van_der_waals_radius(C), dist_major(1, 2), [0, ang_major(1, 2) - 180], "N1-C2 "],
          // Bond with C6
          [van_der_waals_radius(C), dist_major(1, 6), [0, ang_major(1, 6) - 180], "N1-C6 "]
        ],
        neighbors = [
          // Neighbor with N6
          [van_der_waals_radius(N), dist(1, 3, dn1n6), [0, 180 - ang(1, 2, an1n6)]]
        ]
      );
    }
  }

  module C2() {
    N1_C2_H = (360 - N1_C2_N3()) / 2;
    rotate([0, 90, 0]) {
      rotate([0, 0, -(ang_major(2, 3) + N1_C2_H - 180)]) {
        space_filling_atom(
          atom_radius = van_der_waals_radius(C),
          color_name = cpk_color(C),
          bonds = [
            // Bond with N1
            [van_der_waals_radius(N), dist_major(2, 1), [0, ang_major(2, 1) - 180], "C2-N1 "],
            // Bond with N3
            [van_der_waals_radius(N), dist_major(2, 3), [0, ang_major(2, 3) - 180], "C2-N3 "],
            // Bond with H
            [van_der_waals_radius(H), C_H_bond_sp2(), [0, ang_major(2, 3) + N1_C2_H - 180], "C2-H "]
          ],
          neighbors = [
            // Neighbor with C4
            [van_der_waals_radius(C), dist_major(2, 4), [0, ang_major(2, 4) - 180]],
            // Neighbor with C5
            [van_der_waals_radius(C), dist_major(2, 5), [0, ang_major(2, 6) - 180]],
            // Neighbor with C6
            [van_der_waals_radius(C), dist_major(2, 6), [0, ang_major(2, 6) - 180]]
          ]
        );
      }
    }
  }

  module H2() {
    space_filling_atom(
      atom_radius = van_der_waals_radius(H),
      color_name = cpk_color(H),
      // Bond with C2
      bond = [van_der_waals_radius(C), single_bond(H) + single_bond(C), "N-C2 "]
    );
  }

  module N3() {
    rotate([0, -90, 0]) {
      space_filling_atom(
        atom_radius = van_der_waals_radius(N),
        color_name = cpk_color(N),
        bonds = [
          // Bond with C2
          [van_der_waals_radius(C), dist_major(3, 2), [0, ang_major(3, 2) - 180], "N3-C2 "],
          // Bond with C4
          [van_der_waals_radius(C), dist_major(3, 4), [0, ang_major(3, 4) - 180], "N3-C4 "]
        ]
      );
    }
  }

  module C4() {
    rotate([0, -90, 0]) {
      rotate([0, 0, ang_major(4, 5) + ang_minor(4, 9)]) {
        space_filling_atom(
          atom_radius = van_der_waals_radius(C),
          color_name = cpk_color(C),
          bonds = [
            // Bond with N3
            [van_der_waals_radius(N), dist_major(4, 3), [0, ang_major(4, 3) - 180], "C4-N3 "],
            // Bond with C5
            [van_der_waals_radius(C), dist_major(4, 5), [0, ang_major(4, 5) - 180], "C4-C5 "],
            // Bond with N9
            [van_der_waals_radius(N), dist_minor(4, 9), [0, ang_major(4, 5) + ang_minor(4, 9) - 180], "C4-N9 "]
          ],
          neighbors = [
            // Neighbors with C2
            [van_der_waals_radius(C), dist_major(4, 2), [0, ang_major(4, 2) - 180]],
            // Neighbors with C6
            [van_der_waals_radius(C), dist_major(4, 6), [0, ang_major(4, 6) - 180]],
            // Neighbors with C8
            [van_der_waals_radius(C), dist_minor(4, 8), [0, ang_major(4, 5) + ang_minor(4, 8) - 180]]
          ]
        );
      }
    }
  }

  module C5() {
    // get distances and angles related to C5-N6
    dc5n6 = 3_gon_distances(C6_N6(), C5_C6(), 360 - N1_C6_N6() - C5_C6_N1());
    ac5n6 = 3_gon_angles(dc5n6, 360 - N1_C6_N6() - C5_C6_N1());
    rotate([0, -90, 0]) {
      space_filling_atom(
        atom_radius = van_der_waals_radius(C),
        color_name = cpk_color(C),
        bonds = [
          // Bond with C4
          [van_der_waals_radius(C), dist_major(5, 4), [0, ang_major(5, 4) - 180], "C5-C4 "],
          // Bond with C6
          [van_der_waals_radius(C), dist_major(5, 6), [0, ang_major(5, 6) - 180], "C5-C6 "],
          // Bond with N7
          [van_der_waals_radius(N), dist_minor(5, 7), [0, 360 - ang_minor(5, 4) - 180], "C5-N7 "]
        ],
        neighbors = [
          // Neighbor with C8
          [van_der_waals_radius(C), dist_minor(5, 8), [0, 360 - ang_minor(5, 4) + ang_minor(5, 8) - 180]],
          // Neighbor with N6
          [van_der_waals_radius(N), dist(1, 3, dc5n6), [0, ang_major(5, 6) + ang(3, 1, ac5n6) - 180]]
        ]
      );
    }
  }

  module C6() {
    rotate([0, 90, 0]) {
      rotate([0, 0, -(ang_major(6, 1) + N1_C6_N6() - 180)]) {
        space_filling_atom(
          atom_radius = van_der_waals_radius(C),
          color_name = cpk_color(C),
          bonds = [
            // Bond with N1
            [van_der_waals_radius(N), dist_major(6, 1), [0, ang_major(6, 1) - 180], "C6-N1 "],
            // Bond with C5
            [van_der_waals_radius(C), dist_major(6, 5), [0, ang_major(6, 5) - 180], "C6-C5 "],
            // Bond with N6
            [van_der_waals_radius(N), C6_N6(), [0, ang_major(6, 1) + N1_C6_N6() - 180], "C6-N6 "]

          ],
          neighbors = [
            // Neighbors with C4
            [van_der_waals_radius(C), dist_major(6, 4), [0, ang_major(6, 4) - 180]],
            // Neighbors with C2
            [van_der_waals_radius(C), dist_major(6, 2), [0, ang_major(6, 2) - 180]]
          ]
        );
      }
    }
  }

  module N6() {
    // Azanide's have bond angles of 104.5 https://en.wikipedia.org/wiki/Azanide
    azanide_angle = 104.5;
    // get distances and angles related to N1-N6
    dn1n6 = 3_gon_distances(C6_N1(), C6_N6(), N1_C6_N6());
    an1n6 = 3_gon_angles(dn1n6, N1_C6_N6());
    // get distances and angles related to C5-N6
    dc5n6 = 3_gon_distances(C6_N6(), C5_C6(), 360 - N1_C6_N6() - C5_C6_N1());
    ac5n6 = 3_gon_angles(dc5n6, 360 - N1_C6_N6() - C5_C6_N1());
    rotate([0, -90, 0]) {
      space_filling_atom(
        atom_radius = van_der_waals_radius(N),
        color_name = cpk_color(N),
        bonds = [
          // Bond with C6
          [van_der_waals_radius(C), C6_N6(), [0, -180], "N6-C6 "],
          // Bond with H6-1
          [van_der_waals_radius(H), single_bond(H) + single_bond(N), [0, 180-(azanide_angle/2) - 180], "N6-H "],
          // Bond with H6-2 
          [van_der_waals_radius(H), single_bond(H) + single_bond(N), [0, 180+(azanide_angle/2) - 180], "N6-H "]
        ]
      );
    }
  }

  module H6() {
    space_filling_atom(
      atom_radius = van_der_waals_radius(H),
      color_name = cpk_color(H),
      // Bond with N6
      bond = [van_der_waals_radius(N), single_bond(H) + single_bond(N), "N-N6 "]
    );
  }

  // Bond length functions. These values were taken from
  // http://ndbserver.rutgers.edu/ndbmodule/archives/proj/valence/bases6.html
  function N1_C2() = 133.9*pm;
  function C2_N3() = 133.1*pm;
  function N3_C4() = 134.4*pm;
  function C4_C5() = 138.3*pm;
  function C5_C6() = 140.6*pm;
  function C6_N1() = 135.1*pm;
  function C5_N7() = 138.8*pm;
  function N7_C8() = 131.1*pm;
  function C8_N9() = 137.3*pm;
  function N9_C4() = 137.4*pm;
  function C6_N6() = 133.5*pm;
  function N9_C1prime() = 146.2*pm;

  // Bond angle functions. These values were taken from
  // http://ndbserver.rutgers.edu/ndbmodule/archives/proj/valence/bases6.html
  function C6_N1_C2() = 118.6;
  function N1_C2_N3() = 129.3;
  function C2_N3_C4() = 110.6;
  function N3_C4_C5() = 126.8;
  function C4_C5_C6() = 117.0;
  function C5_C6_N1() = 117.7;
  function C4_C5_N7() = 110.7;
  function C5_N7_C8() = 103.9;
  function N7_C8_N9() = 113.8;
  function C8_N9_C4() = 105.8;
  function N9_C4_C5() = 105.8;
  function N3_C4_N9() = 127.4;
  function C6_C5_N7() = 132.3;
  function N1_C6_N6() = 118.6;
  function C5_C6_N6() = 123.7;
  function C8_N9_C1prime() = 127.7;
  function C4_N9_C1prime() = 126.3;

  // Compute the major ring distances and angles (atoms 1-6)
  major_d3g = 3_gon_distances(N1_C2(), C2_N3(), N1_C2_N3());
  major_a3g = 3_gon_angles(major_d3g, N1_C2_N3());
  major_d4g = 4_gon_distances(major_d3g, major_a3g, N3_C4(), C2_N3_C4());
  major_a4g = 4_gon_angles(major_d4g, major_a3g, C2_N3_C4());
  major_d5g = 5_gon_distances(major_d4g, major_a4g, C4_C5(), N3_C4_C5());
  major_a5g = 5_gon_angles(major_d5g, major_a4g, N3_C4_C5());
  major_d6g = 6_gon_distances(major_d5g, major_a5g, C5_C6(), C4_C5_C6());
  major_a6g = 6_gon_angles(major_d6g, major_a5g, C4_C5_C6());

  // Compute the minor ring distances and angles (atoms 5-4-9-8-7)
  minor_d3g = 3_gon_distances(C4_C5(), N9_C4(), N9_C4_C5());
  minor_a3g = 3_gon_angles(minor_d3g, N9_C4_C5());
  minor_d4g = 4_gon_distances(minor_d3g, minor_a3g, C8_N9(), C8_N9_C4());
  minor_a4g = 4_gon_angles(minor_d4g, minor_a3g, C8_N9_C4());
  minor_d5g = 5_gon_distances(minor_d4g, minor_a4g, N7_C8(), N7_C8_N9());
  minor_a5g = 5_gon_angles(minor_d5g, minor_a4g, N7_C8_N9());

  // This is just a convenience function so we can get the distances more cleanly.
  function dist_major(i, j, distances = major_d6g) =
    dist(i, j, distances);

  // This is just a convenience function so we can get the angles more cleanly.
  function ang_major(i, j, angles = major_a6g) =
    ang(i, j, angles);

  // The functions below expects indices of 1-5 but that would be confusing since they are for atoms 5-4-9-8-7
  // respectively, so we remap 5-4-9-8-7 to 1-2-3-4-5 so we can use the atom indices.
  function minor_mapping(i) =
    i == 5 ? 1
    : i == 4 ? 2
    : i == 9 ? 3
    : i == 8 ? 4
    : i == 7 ? 5
    : assert(false, "not a valid mapping.");

  // This is just a convenience function so we can get the distances more cleanly.
  function dist_minor(i, j, distances = minor_d5g) =
    dist(minor_mapping(i), minor_mapping(j), distances);

  // This is just a convenience function so we can get the angles more cleanly.
  function ang_minor(i, j, angles = minor_a5g) =
    ang(minor_mapping(i), minor_mapping(j), angles);
}
