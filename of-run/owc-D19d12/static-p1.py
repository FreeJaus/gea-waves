#### INPUT DATA
path='/mirepo/canal/canal3D/owc-D19d12-tetr/' #OpenFOAM folder
output_file_name="staticPressure.csv"
#g_direction="Y"
probe_Location=[2.186, 0.582, 0.118]
#### END INPUT DATA

#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'OpenFOAMReader'
afoam = OpenFOAMReader(FileName=path+'a.foam')
afoam.MeshRegions = ['internalMesh']
afoam.CellArrays = ['p', 'p_rgh']

# get animation scene
animationScene1 = GetAnimationScene()

# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1383, 796]

# reset view to fit data
renderView1.ResetCamera()

# create a new 'Cell Data to Point Data'
cellDatatoPointData1 = CellDatatoPointData(Input=afoam)

# hide data in view
Hide(afoam, renderView1)

# create a new 'Probe Location'
probeLocation1 = ProbeLocation(Input=afoam,
    ProbeType='Fixed Radius Point Source')

# init the 'Fixed Radius Point Source' selected for 'ProbeType'
probeLocation1.ProbeType.Center = probe_Location

# hide data in view
#Hide(cellDatatoPointData1, renderView1)

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



time_steps=afoam.TimestepValues
view = GetActiveView()
f=open(path+output_file_name,"w")
f.write("t,staticPressure\n")
for t in time_steps:
	view.ViewTime = t	
	Render()
	calculator1.UpdatePipeline() # Perform the calculation
	Pressure_Var_Fetch = servermanager.Fetch(calculator1)
	Pressure_Var_Pointdata = Pressure_Var_Fetch.GetPointData()
	p1 = Pressure_Var_Pointdata.GetArray('p')
	#Integrate_Var_Celldata = Integrate_Var_Fetch.GetCellData()
	#mArea= Integrate_Var_Celldata.GetArray('Area')
	#Area = mArea.GetValue(0)
	p = pl.GetValue(0)
	f.write("{0},{1}\n".format(t,p)) #ylevel/Area))
	print "{0},{1}".format(t,p) #ylevel/Area)
	
f.close()

# create a new 'CSV Reader'
staticPressurecsv = CSVReader(FileName=[path+output_file_name])

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [0.8895000219345093, 0.30000001192092896, 3.682107777103769]
renderView1.CameraFocalPoint = [0.8895000219345093, 0.30000001192092896, 0.05000000074505806]
renderView1.CameraParallelScale = 0.9400586663866015

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).
