#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# get active source.
owcD19d12tetrOpenFOAM = GetActiveSource()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1301, 671]

# show data in view
owcD19d12tetrOpenFOAMDisplay = Show(owcD19d12tetrOpenFOAM, renderView1)
# trace defaults for the display properties.
owcD19d12tetrOpenFOAMDisplay.ColorArrayName = [None, '']
owcD19d12tetrOpenFOAMDisplay.GlyphType = 'Arrow'
owcD19d12tetrOpenFOAMDisplay.ScalarOpacityUnitDistance = 0.05155980374960996

# reset view to fit data
renderView1.ResetCamera()

# set scalar coloring
ColorBy(owcD19d12tetrOpenFOAMDisplay, ('FIELD', 'vtkBlockColors'))

# show color bar/color legend
owcD19d12tetrOpenFOAMDisplay.SetScalarBarVisibility(renderView1, True)

# get color transfer function/color map for 'vtkBlockColors'
vtkBlockColorsLUT = GetColorTransferFunction('vtkBlockColors')

# get opacity transfer function/opacity map for 'vtkBlockColors'
vtkBlockColorsPWF = GetOpacityTransferFunction('vtkBlockColors')

# get animation scene
animationScene1 = GetAnimationScene()

animationScene1.GoToNext()

# Properties modified on owcD19d12tetrOpenFOAM
owcD19d12tetrOpenFOAM.MeshParts = ['internalMesh']
owcD19d12tetrOpenFOAM.VolFieldArrayStatus = ['alpha.water', '0', 'epsilon', '0', 'k', '0', 'nut', '0', 'p', '1', 'p_rgh', '1', 'U', '1']
owcD19d12tetrOpenFOAM.VolumeFields = ['p', 'p_rgh', 'U']

# create a new 'Cell Data to Point Data'
cellDatatoPointData1 = CellDatatoPointData(Input=owcD19d12tetrOpenFOAM)

# show data in view
cellDatatoPointData1Display = Show(cellDatatoPointData1, renderView1)
# trace defaults for the display properties.
cellDatatoPointData1Display.ColorArrayName = [None, '']
cellDatatoPointData1Display.GlyphType = 'Arrow'
cellDatatoPointData1Display.ScalarOpacityUnitDistance = 0.05155980374960996

# hide data in view
Hide(owcD19d12tetrOpenFOAM, renderView1)

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

# Properties modified on calculator1
calculator1.Function = 'p'

# show data in view
calculator1Display = Show(calculator1, spreadSheetView1)

# hide data in view
Hide(probeLocation1, spreadSheetView1)

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [1.1130000352859497, 0.30300000309944153, 4.5980669982755975]
renderView1.CameraFocalPoint = [1.1130000352859497, 0.30300000309944153, 0.11800000071525574]
renderView1.CameraParallelScale = 1.1595266623038847

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).