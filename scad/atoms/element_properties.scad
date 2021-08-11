/*
 * element_properties.scad
 *
 * Copyright © 2021 Derek Seiple
 * Licensed under Creative Commons BY-NC-SA 3.0. See license file.
 */

include <../utils/constants.scad>;

/*
 * This is a list of CPK colors used in molecular models (https://en.wikipedia.org/wiki/CPK_coloring). It is not
 * intended that we use this list directly, instead you should use the cpk_color function below.
 */
cpk_color_list = [
  "white",      // Hydrogen  
  "cyan",       // Helium    
  "violet",     // Lithium   
  "dark green", // Beryllium  
  "beige",      // Boron     
  "black",      // Carbon    
  "blue",       // Nitrogen  
  "red",        // Oxygen    
  "green",      // Fluorine  
  "cyan",       // Neon      
  "violet",     // Sodium    
  "dark green", // Magnesium 
  "pink",       // Aluminum  
  "pink",       // Silicon   
  "orange",     // Phosphorus
  "yellow",     // Sulfur    
  "green",      // Chlorine  
  "cyan",       // Argon     
  "violet",     // Potassium 
  "dark green"  // Calcium   
];


/*
 * Given the atomic number of an element this function returns the CPK color used in atomic models
 * (https://en.wikipedia.org/wiki/CPK_coloring). Note that the list above is zero indexed, so we subtract one when
 * accessing the list.
 */
function cpk_color(atomic_number, color_list = cpk_color_list) =
  assert(atomic_number > 0, str("The atomic number must be positive, but got: ", atomic_number))
  assert(atomic_number <= len(color_list),
         str("We do not have a CPK color for the atomic number provided: ", atomic_number))
  color_list[atomic_number - 1];



/*
 * This is a list of Van der Waals radii (https://en.wikipedia.org/wiki/Van_der_Waals_radius). It is not intended that
 * we use this list directly, instead you should use the van_der_waals_radius function below.
 */
van_der_waals_list = [
  120*pm, // Hydrogen  
  140*pm, // Helium    
  182*pm, // Lithium   
  153*pm, // Beryllium  
  192*pm, // Boron     
  170*pm, // Carbon    
  155*pm, // Nitrogen  
  152*pm, // Oxygen    
  147*pm, // Fluorine  
  154*pm, // Neon      
  227*pm, // Sodium    
  173*pm, // Magnesium 
  184*pm, // Aluminum  
  210*pm, // Silicon   
  180*pm, // Phosphorus
  180*pm, // Sulfur    
  175*pm, // Chlorine  
  188*pm, // Argon     
  275*pm, // Potassium 
  231*pm  // Calcium   
];


/*
 * Given the atomic number of an element this function returns the Van der Waals radius
 * (https://en.wikipedia.org/wiki/Van_der_Waals_radius). Note that the list above is zero indexed, so we subtract one
 * when accessing the list.
 */
function van_der_waals_radius(atomic_number, radii_list = van_der_waals_list) =
  assert(atomic_number > 0, str("The atomic number must be positive, but got: ", atomic_number))
  assert(atomic_number <= len(radii_list),
         str("We do not have a radius for the atomic number provided: ", atomic_number))
  radii_list[atomic_number - 1];
