---
title: "Lista de casos"
keywords: 

publishdate: 2016-01-01
date: 2016-01-01
---
# CASES

 - **damBreak [single]**: default case, copied from `<$FOAM_RUN/tutorials/multiphase/interFoam/laminar>`. It is thoroughly explained at [User Guide: 2.3 Breaking of a dam](http://cfd.direct/openfoam/user-guide/dambreak/).

 - **damBreakFine [parallel]**: improved mesh resolution, as explained at [User Guide: 2.3 Breaking of a dam](http://cfd.direct/openfoam/user-guide/dambreak/). The details of how to run a case in parallel are explained at [User Guide: 3.4 Running applications in parallel](http://cfd.direct/openfoam/user-guide/running-applications-parallel).

 - **damBreakMod [single]**: hand-modified blockMeshDict to include a topWall, so that a chamber/chimney is created at the right. Use `meld damBreak damBreakMod` to check changes.

 - **damBreakSwiftBlock [single]**: blockMeshDict generated with SwiftBlock (plugin for Blender available at [GitHub/nogenmyr](https://github.com/nogenmyr/swiftBlock)). There are two models available at [SwiftBlock_cube](of-dsgn/blender/damBreakSwiftBlock_cube.blend) and [damBreakSwiftBlock](of-dsgn/blender/damBreakSwiftBlock.blend). The first one is just a cube. The second resembles the topology of damBreak. On top of that, `<of-dsgn/blender/damBreakModSB.blend>` can be used to create the blockMeshDict for damBreakMod.

 	- Scale and translate the cube shown in the default Start-Up File.
  	- Ctrl+Alt+U and activate SwiftBlock at Addons/OpenFOAM.
  	- Enable <SwiftBlock settings> at Object Properties.
  	- Change to <Edit Mode> and pick <Face select>.
  	- Set patch names and types (rightWall, leftWall, lowerWall, atmosphere). Mind that the default name is <defaultName>, while <defaultFaces> is used in the files copied from damBreak. Front a Rear faces should be assigned to <defaultFaces> to avoid problems.
  	- Choose <Set edges>, write the name of the object, <Cube>, and press Enter.
  	- In <Edit Mode> select the front face, set <# cells: 40> and press <Force resolution>. Alternatively, resolutions may be set to edges independently. However, consistency must be preserved.
  	- Click <Diagnose> and, then, <Preview> to verify the resulting mesh.
  	- Write result to blockMeshDict

 - **damBreak3d [single]**: before begining with snappy case (which it needs to be refine in 3 axes) it is interesting to analyze volume of water whitch is defined thinner in z direction to research diferences in three axes. For that, it takes Calum Duglas explications of damBreak example modified to 3d](http://www.calumdouglas.ch/openfoam-example-3d-dambreak/). The summery of steps are the following: 
	- Change blockMeshDict (add width in z axes dim=2, increase number of cells as 8 in each block and define fonrtback boundary as wall)
	- Edit system/setFieldsDict to set new range to the volume of water inside of chamber to be less than 0.292m (in blockMeshDict is defined convert to meters 0.146 so as explained in the reference case the dimensions in boxtocell are in meter whithout any scale).

>>> SCRIPTS

To run all the cases:

./RunCase damBreak damBreakFine damBreakMod damBreakSwiftBlock

To clean all the case directories:

./CleanCase damBreak damBreakFine damBreakMod damBreakSwiftBlock
