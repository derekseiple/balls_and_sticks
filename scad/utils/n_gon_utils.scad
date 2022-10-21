/*
 * n_gon_utils.scad
 *
 * Copyright © 2022 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

use <./math_utils.scad>;

/*
 * Given a matrix of distances this will extract the i-j distance from the matrix. This function takes 1-based offsets
 * even though the underlying matrix is 0-based.
 */
function dist(i, j, distances) =
  // we subtract 1 to compensate for 1 vs 0 offset numbering
  assert(i <= len(distances), "Can't get requested distance.")
  assert(j <= len(distances[i - 1]), "Can't get requested distance.")
  distances[i - 1][j - 1];

/*
 * Given a matrix of angles this will extract the i-j angle from the matrix. This function takes 1-based offsets
 * even though the underlying matrix is 0-based.
 */
function ang(i, j, angles) =
  // we subtract 1 to compensate for 1 vs 0 offset numbering
  assert(i <= len(angles), "Can't get requested angles.")
  assert(j <= len(angles[i - 1]), "Can't get requested angles.")
  angles[i - 1][j - 1];


/*
 * This is a function that will compute the distances between vertices of a triangle. This assumes that the vertices are
 * labeled 1 - 3 in a clockwise direction. This will produce a 3x3 matrix, d, where calling dist(i, j, d) will give the
 * distance between vertices i and j.
 */
function 3_gon_distances(
  d12, // Distance between vertices 1 and 2
  d23, // Distance between vertices 2 and 3
  a123 // The angle with vertices 1, 2, 3
) =  
  [
    [ 0, d12, law_of_cosines(d12, d23, a123) ],
    [ d12, 0, d23 ],
    [ law_of_cosines(d12, d23, a123), d23, 0 ]
  ];

/*
 * This is a function that will compute the angles between vertices of a triangle. This assumes that the vertices are
 * labeled 1 - 3 in a clockwise direction. This will produce a 3x3 matrix, d, where calling ang(i, j, d) will give the
 * angle where i is the vertex, j is one of the sides of the angle. By definition we measure angles clockwise starting
 * with the vertex that is one less than i. So for example ang(2, 3, d) will return the angle 1-2-3 since vertex 2
 * is measured relative to side 1. Similarly vertex 3 is measured relative to side 2, and vertex 1 is relative to side
 * 3.
 */
function 3_gon_angles(
  d3g, // Matrix holding the 3-gon distances
  a123 // The angle with vertices 1, 2, 3
) =
  [
    [ undef, law_of_sines(dist(2, 3, d3g), dist(1, 3, d3g), a123), 0 ],
    [ 0, undef, a123 ],
    [ law_of_sines(dist(1, 2, d3g), dist(1, 3, d3g), a123), 0, undef ]
  ];

/*
 * This is a function that will compute the distances between vertices of a concave 4-gon or quadrilateral. This assumes
 * that the vertices are labeled 1 - 4 in a clockwise direction. This will produce a 4x4 matrix, d, where calling
 * dist(i, j, d) will give the distance between vertices i and j.
 */
function 4_gon_distances(
  d3g, // Matrix holding the 3-gon distances of vertices 1 - 3
  a3g, // Matrix holding the 3-gon angles of vertices 1 - 3
  d34, // Distance between vertices 3 and 4
  a234 // The angle with vertices 2, 3, 4
) =
  [
    [ dist(1, 1, d3g), dist(1, 2, d3g), dist(1, 3, d3g), law_of_cosines(dist(1, 3, d3g), d34, a234 - ang(3, 1, a3g)) ],
    [ dist(2, 1, d3g), dist(2, 2, d3g), dist(2, 3, d3g), law_of_cosines(dist(2, 3, d3g), d34, a234) ],
    [ dist(3, 1, d3g), dist(3, 2, d3g), dist(3, 3, d3g), d34 ],
    [ law_of_cosines(dist(1, 3, d3g), d34, a234 - ang(3, 1, a3g)), law_of_cosines(dist(2, 3, d3g), d34, a234), d34, 0 ]
  ];

/*
 * This is a function that will compute the angles between vertices of a concave 4-gon or quadrilateral. This assumes
 * that the vertices are labeled 1 - 4 in a clockwise direction. This will produce a 4x4 matrix, d, that can be used
 * with the ang function above. This has the same measurement standards as that of the 3_gon_angles function.
 */
function 4_gon_angles(
  d4g, // Matrix holding the 4-gon distances of vertices 1 - 4
  a3g, // Matrix holding the 3-gon angles of vertices 1 - 3
  a234 // The angle with vertices 2, 3, 4
) =
  [ [
    undef,
    ang(1, 2, a3g) + law_of_sines(dist(3, 4, d4g), dist(1, 4, d4g), a234 - ang(3, 1, a3g)),
    ang(1, 3, a3g) + law_of_sines(dist(3, 4, d4g), dist(1, 4, d4g), a234 - ang(3, 1, a3g)),
    0
  ], [
    ang(2, 1, a3g),
    ang(2, 2, a3g),
    ang(2, 3, a3g),
    ang(2, 3, a3g) - law_of_sines(dist(3, 4, d4g), dist(2, 4, d4g), a234)
  ], [
    ang(3, 1, a3g),
    ang(3, 2, a3g),
    ang(3, 3, a3g),
    a234
  ], [
    360 - a234 - ang(2, 3, a3g) -(ang(1, 2, a3g) + law_of_sines(dist(3, 4, d4g), dist(1, 4, d4g), a234 - ang(3, 1, a3g))),
    law_of_sines(dist(1, 2, d4g), dist(1, 4, d4g), ang(2, 3, a3g) - law_of_sines(dist(3, 4, d4g), dist(2, 4, d4g), a234)),
    0,
    undef
  ] ];

/*
 * This is a function that will compute the distances between vertices of a concave 5-gon or quadrilateral. This assumes
 * that the vertices are labeled 1 - 5 in a clockwise direction. This will produce a 5x5 matrix, d, where calling
 * dist(i, j, d) will give the distance between vertices i and j.
 */
function 5_gon_distances(
  d4g, // Matrix holding the 4-gon distances of vertices 1 - 4
  a4g, // Matrix holding the 4-gon angles of vertices 1 - 4
  d45, // Distance between vertices 4 and 5
  a345 // The angle with vertices 3, 4, 5
) =
  [ [
    dist(1, 1, d4g),
    dist(1, 2, d4g),
    dist(1, 3, d4g),
    dist(1, 4, d4g),
    law_of_cosines(d45, dist(1, 4, d4g), a345 - ang(4, 1, a4g))
  ], [
    dist(2, 1, d4g),
    dist(2, 2, d4g),
    dist(2, 3, d4g),
    dist(2, 4, d4g),
    law_of_cosines(law_of_cosines(d45, dist(3, 4, d4g), a345), dist(2, 3, d4g), ang(3, 4, a4g) - law_of_sines(d45, law_of_cosines(d45, dist(3, 4, d4g), a345), a345))
  ], [
    dist(3, 1, d4g),
    dist(3, 2, d4g),
    dist(3, 3, d4g),
    dist(3, 4, d4g),
    law_of_cosines(d45, dist(3, 4, d4g), a345)
  ], [
    dist(4, 1, d4g),
    dist(4, 2, d4g),
    dist(4, 3, d4g),
    dist(4, 4, d4g),
    d45
  ], [
    law_of_cosines(d45, dist(1, 4, d4g), a345 - ang(4, 1, a4g)),
    law_of_cosines(law_of_cosines(d45, dist(3, 4, d4g), a345), dist(2, 3, d4g), ang(3, 4, a4g) - law_of_sines(d45, law_of_cosines(d45, dist(3, 4, d4g), a345), a345)),
    law_of_cosines(d45, dist(3, 4, d4g), a345),
    d45,
    0
  ] ];

/*
 * This is a function that will compute the angles between vertices of a concave 5-gon or pentagon. This assumes
 * that the vertices are labeled 1 - 5 in a clockwise direction. This will produce a 5x5 matrix, d, that can be used
 * with the ang function above. This has the same measurement standards as that of the other n_gon_angles functions.
 */
function 5_gon_angles(
  d5g, // Matrix holding the 5-gon distances of vertices 1 - 5
  a4g, // Matrix holding the 4-gon angles of vertices 1 - 4
  a345 // The angle with vertices 3, 4, 5
) =
  [ [
    undef,
    ang(1, 2, a4g) + law_of_sines(dist(4, 5, d5g), dist(1, 5, d5g), a345 - ang(4, 1, a4g)),
    ang(1, 3, a4g) + law_of_sines(dist(4, 5, d5g), dist(1, 5, d5g), a345 - ang(4, 1, a4g)),
    ang(1, 4, a4g) + law_of_sines(dist(4, 5, d5g), dist(1, 5, d5g), a345 - ang(4, 1, a4g)),
    0
  ], [
    ang(2, 1, a4g),
    ang(2, 2, a4g),
    ang(2, 3, a4g),
    ang(2, 4, a4g),
    law_of_sines(dist(1, 5, d5g), dist(2, 5, d5g), ang(1, 2, a4g) + law_of_sines(dist(4, 5, d5g), dist(1, 5, d5g), a345 - ang(4, 1, a4g)))
  ], [
    ang(3, 1, a4g),
    ang(3, 2, a4g),
    ang(3, 3, a4g),
    ang(3, 4, a4g),
    ang(3, 4, a4g) - law_of_sines(dist(4, 5, d5g), dist(3, 5, d5g), a345)
  ], [
    ang(4, 1, a4g),
    ang(4, 2, a4g),
    ang(4, 3, a4g),
    ang(4, 4, a4g),
    a345
  ], [
    540 - a345 - ang(3, 4, a4g) - ang(2, 3, a4g) - (ang(1, 2, a4g) + law_of_sines(dist(4, 5, d5g), dist(1, 5, d5g), a345 - ang(4, 1, a4g))),
    law_of_sines(dist(3, 4, d5g), dist(3, 5, d5g), a345) + law_of_sines(dist(2, 3, d5g), dist(2, 5, d5g), ang(3, 4, a4g) - law_of_sines(dist(4, 5, d5g), dist(3, 5, d5g), a345)),
    law_of_sines(dist(3, 4, d5g), dist(3, 5, d5g), a345),
    0,
    undef
  ] ];

/*
 * This is a function that will compute the distances between vertices of a concave 6-gon. This assumes
 * that the vertices are labeled 1 - 6 in a clockwise direction. This will produce a 6x6 matrix, d, where calling
 * dist(i, j, d) will give the distance between vertices i and j.
 */
function 6_gon_distances(
  d5g, // Matrix holding the 5-gon distances of vertices 1 - 5
  a5g, // Matrix holding the 5-gon angles of vertices 1 - 5
  d56, // Distance between vertices 5 and 6
  a456 // The angle with vertices 4, 5, 6
) =
  [ [
    dist(1, 1, d5g),
    dist(1, 2, d5g),
    dist(1, 3, d5g),
    dist(1, 4, d5g),
    dist(1, 5, d5g),
    law_of_cosines(d56, dist(1, 5, d5g), a456 - ang(5, 1, a5g))
  ], [
    dist(2, 1, d5g),
    dist(2, 2, d5g),
    dist(2, 3, d5g),
    dist(2, 4, d5g),
    dist(2, 5, d5g),
    law_of_cosines(law_of_cosines(d56, dist(1, 5, d5g), a456 - ang(5, 1, a5g)), dist(1, 2, d5g), ang(1, 2, a5g) + law_of_sines(d56, law_of_cosines(d56, dist(1, 5, d5g), a456 - ang(5, 1, a5g)), a456 - ang(5, 1, a5g)))
  ], [
    dist(3, 1, d5g),
    dist(3, 2, d5g),
    dist(3, 3, d5g),
    dist(3, 4, d5g),
    dist(3, 5, d5g),
    law_of_cosines(law_of_cosines(d56, dist(4, 5, d5g), a456), dist(3, 4, d5g), ang(4, 5, a5g) - law_of_sines(d56, law_of_cosines(d56, dist(4, 5, d5g), a456), a456))
  ], [
    dist(4, 1, d5g),
    dist(4, 2, d5g),
    dist(4, 3, d5g),
    dist(4, 4, d5g),
    dist(4, 5, d5g),
    law_of_cosines(d56, dist(4, 5, d5g), a456)
  ], [
    dist(5, 1, d5g),
    dist(5, 2, d5g),
    dist(5, 3, d5g),
    dist(5, 4, d5g),
    dist(5, 5, d5g),
    d56
  ], [
    law_of_cosines(d56, dist(1, 5, d5g), a456 - ang(5, 1, a5g)),
    law_of_cosines(law_of_cosines(d56, dist(1, 5, d5g), a456 - ang(5, 1, a5g)), dist(1, 2, d5g), ang(1, 2, a5g) + law_of_sines(d56, law_of_cosines(d56, dist(1, 5, d5g), a456 - ang(5, 1, a5g)), a456 - ang(5, 1, a5g))),
    law_of_cosines(law_of_cosines(d56, dist(4, 5, d5g), a456), dist(3, 4, d5g), ang(4, 5, a5g) - law_of_sines(d56, law_of_cosines(d56, dist(4, 5, d5g), a456), a456)),
    law_of_cosines(d56, dist(4, 5, d5g), a456),
    d56,
    0
  ] ];

/*
 * This is a function that will compute the angles between vertices of a concave 6-gon. This assumes
 * that the vertices are labeled 1 - 6 in a clockwise direction. This will produce a 6x6 matrix, d, that can be used
 * with the ang function above. This has the same measurement standards as that of the other n_gon_angles functions.
 */
function 6_gon_angles(
  d6g, // Matrix holding the 6-gon distances of vertices 1 - 6
  a5g, // Matrix holding the 5-gon angles of vertices 1 - 5
  a456 // The angle with vertices 4, 5, 6
) =
  [ [
    undef,
    ang(1, 2, a5g) + law_of_sines(dist(5, 6, d6g), dist(1, 6, d6g), a456 - ang(5, 1, a5g)),
    ang(1, 3, a5g) + law_of_sines(dist(5, 6, d6g), dist(1, 6, d6g), a456 - ang(5, 1, a5g)),
    ang(1, 4, a5g) + law_of_sines(dist(5, 6, d6g), dist(1, 6, d6g), a456 - ang(5, 1, a5g)),
    ang(1, 5, a5g) + law_of_sines(dist(5, 6, d6g), dist(1, 6, d6g), a456 - ang(5, 1, a5g)),
    0
  ], [
    ang(2, 1, a5g),
    ang(2, 2, a5g),
    ang(2, 3, a5g),
    ang(2, 4, a5g),
    ang(2, 5, a5g),
    law_of_sines(dist(1, 6, d6g), dist(2, 6, d6g), ang(1, 2, a5g) + law_of_sines(dist(5, 6, d6g), dist(1, 6, d6g), a456 - ang(5, 1, a5g)))
  ], [
    ang(3, 1, a5g),
    ang(3, 2, a5g),
    ang(3, 3, a5g),
    ang(3, 4, a5g),
    ang(3, 5, a5g),
    law_of_sines(dist(2, 6, d6g), dist(3, 6, d6g), ang(2, 3, a5g) - law_of_sines(dist(1, 6, d6g), dist(2, 6, d6g), ang(1, 2, a5g) + law_of_sines(dist(5, 6, d6g), dist(1, 6, d6g), a456 - ang(5, 1, a5g))))
  ], [
    ang(4, 1, a5g),
    ang(4, 2, a5g),
    ang(4, 3, a5g),
    ang(4, 4, a5g),
    ang(4, 5, a5g),
    ang(4, 5, a5g) - law_of_sines(dist(5, 6, d6g), dist(4, 6, d6g), a456)
  ], [
    ang(5, 1, a5g),
    ang(5, 2, a5g),
    ang(5, 3, a5g),
    ang(5, 4, a5g),
    ang(5, 5, a5g),
    a456
  ], [
    720 - a456 - ang(4, 5, a5g) - ang(3, 4, a5g) - ang(2, 3, a5g) - (ang(1, 2, a5g) + law_of_sines(dist(5, 6, d6g), dist(1, 6, d6g), a456 - ang(5, 1, a5g))),
    law_of_sines(dist(4, 5, d6g), dist(4, 6, d6g), a456) + law_of_sines(dist(4, 3, d6g), dist(3, 6, d6g), ang(4, 5, a5g) - law_of_sines(dist(5, 6, d6g), dist(4, 6, d6g), a456)) + law_of_sines(dist(2, 3, d6g), dist(2, 6, d6g), ang(2, 3, a5g) - law_of_sines(dist(1, 6, d6g), dist(2, 6, d6g), ang(1, 2, a5g) + law_of_sines(dist(5, 6, d6g), dist(1, 6, d6g), a456 - ang(5, 1, a5g)))),
    law_of_sines(dist(4, 5, d6g), dist(4, 6, d6g), a456) + law_of_sines(dist(4, 3, d6g), dist(3, 6, d6g), ang(4, 5, a5g) - law_of_sines(dist(5, 6, d6g), dist(4, 6, d6g), a456)),
    law_of_sines(dist(4, 5, d6g), dist(4, 6, d6g), a456),
    0,
    undef
  ] ];
