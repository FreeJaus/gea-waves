#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'OpenFOAMReader'
afoam = OpenFOAMReader(FileName='/mirepo/owc-D19d12/a.foam')
afoam.MeshRegions = ['internalMesh']
afoam.CellArrays = ['U', 'alpha.water', 'alpha.water.orig', 'epsilon', 'k', 'nuTilda', 'nut', 'p', 'p_rgh']

# get animation scene
animationScene1 = GetAnimationScene()

# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()

# Properties modified on afoam
afoam.CellArrays = ['p', 'p_rgh']

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [857, 557]

# show data in view
afoamDisplay = Show(afoam, renderView1)
# trace defaults for the display properties.
afoamDisplay.ColorArrayName = [None, '']
afoamDisplay.GlyphType = 'Arrow'
afoamDisplay.ScalarOpacityUnitDistance = 0.05155980374960996

# reset view to fit data
renderView1.ResetCamera()

# set scalar coloring
ColorBy(afoamDisplay, ('FIELD', 'vtkBlockColors'))

# show color bar/color legend
afoamDisplay.SetScalarBarVisibility(renderView1, True)

# get color transfer function/color map for 'vtkBlockColors'
vtkBlockColorsLUT = GetColorTransferFunction('vtkBlockColors')

# get opacity transfer function/opacity map for 'vtkBlockColors'
vtkBlockColorsPWF = GetOpacityTransferFunction('vtkBlockColors')

# create a new 'Cell Data to Point Data'
cellDatatoPointData1 = CellDatatoPointData(Input=afoam)

# show data in view
cellDatatoPointData1Display = Show(cellDatatoPointData1, renderView1)
# trace defaults for the display properties.
cellDatatoPointData1Display.ColorArrayName = [None, '']
cellDatatoPointData1Display.GlyphType = 'Arrow'
cellDatatoPointData1Display.ScalarOpacityUnitDistance = 0.05155980374960996

# hide data in view
Hide(afoam, renderView1)

# set scalar coloring
ColorBy(cellDatatoPointData1Display, ('FIELD', 'vtkBlockColors'))

# show color bar/color legend
cellDatatoPointData1Display.SetScalarBarVisibility(renderView1, True)

# create a new 'Probe Location'
probeLocation1 = ProbeLocation(Input=cellDatatoPointData1,
    ProbeType='Fixed Radius Point Source')

# init the 'Fixed Radius Point Source' selected for 'ProbeType'
probeLocation1.ProbeType.Center = [1.1130000352859497, 0.30300000309944153, 0.11800000071525574]

# Properties modified on probeLocation1
probeLocation1.Tolerance = 2.22044604925031e-16

# Properties modified on probeLocation1.ProbeType
probeLocation1.ProbeType.Center = [2.186, 0.582, 0.11800000071525574]

# get layout
viewLayout1 = GetLayout()

# Create a new 'SpreadSheet View'
spreadSheetView1 = CreateView('SpreadSheetView')
spreadSheetView1.BlockSize = 1024L
# uncomment following to set a specific view size
# spreadSheetView1.ViewSize = [400, 400]

# place view in the layout
viewLayout1.AssignView(2, spreadSheetView1)

# show data in view
probeLocation1Display = Show(probeLocation1, spreadSheetView1)

# create a new 'Calculator'
calculator1 = Calculator(Input=probeLocation1)
calculator1.Function = ''

animationScene1.GoToNext()

# Properties modified on calculator1
calculator1.Function = 'p'

# show data in view
calculator1Display = Show(calculator1, spreadSheetView1)

# hide data in view
Hide(probeLocation1, spreadSheetView1)

# save data
SaveData('/mirepo/canal/canal3D/owc-D19d12-tetr/005p.csv', proxy=calculator1)

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [1.1130000352859497, 0.30300000309944153, 4.5980669982755975]
renderView1.CameraFocalPoint = [1.1130000352859497, 0.30300000309944153, 0.11800000071525574]
renderView1.CameraParallelScale = 1.1595266623038847

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).