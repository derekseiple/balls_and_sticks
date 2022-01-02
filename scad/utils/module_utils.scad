/*
 * module_utils.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

/*
 * Oftentimes we want to mirror an element but also keep the original. This will copy the modules passed in and mirror
 * them according to the vector, v, passed in.
 */
module copy_and_mirror(v) {
  children();
  mirror(v) {
    children();
  }
}

/*
 * Similar to above, this allows us to copy an element and apply a rotation to the copied element.
 */
module copy_and_rotate(v) {
  children();
  rotate(v) {
    children();
  }
}
