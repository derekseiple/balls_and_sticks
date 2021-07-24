# Balls and Sticks

The purpose of this project is to be able to create and 3D print
[ball-and-stick](https://en.wikipedia.org/wiki/Ball-and-stick_model) models of molecules. This project was
motivated by a desire to create a geometrically accurate model of the DNA helix detailed to show the individual atoms
that compose the molecule.

The bond angles of atoms depend on many factors and are not fixed universally in all molecules, so using a standard
ball-and-stick set would not be able to represent all molecules in a geometrically accurate way. To do this we would
need custom bond angles and covalent bond distances for each molecule. For this reason we will 3D print each component
depending on its intended use. To this end we will need to have 3D models that can be customized.

It would be too tedious to generate all of the possible variations by hand, so this project aims to create scripts for
[OpenSCAD](https://openscad.org/) that will take input parameters to be able to generate the appropriate 3D models to be
printed. The work herein will build upon simple models and document my findings in both the geometry of the prints as
well as the constraints imposed upon the medium of 3D printing.

The structure of this repo is as follows:
* The [docs](./docs/README.md) section will explain the details and decisions behind the design of the molecular models.
* The [scad](./scad) directory will contain the scripts and utilities that are used to generate the molecular models.
* The [stls](./stls) directory will contain generated STL files of the different designed components.
