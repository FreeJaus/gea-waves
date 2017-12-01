[ParaView/Python Scripting](https://www.paraview.org/Wiki/ParaView/Python_Scripting)

ParaView offers rich scripting support through Python. This support is available as part of the ParaView client (paraview), an MPI-enabled batch application (pvbatch), the ParaView python client (pvpython), or any other Python-enabled application. Using Python, users and developers can gain access to the ParaView engine called Server Manager. 

Note: Server Manager is a library that is designed to make it easy to build distributed client-server applications.


- ParaView in the stand-alone mode:
```
>>> from paraview.simple import *
```

- Creating a Pipeline

  - The simple module contains many functions to instantiate sources, filters, and other related objects.
  - Assign values to any number of properties during construction
  - Apply a filter to the object.
  - At this point, if you are interested in getting some information about the output of the filter, you can force it to update (which will also cause the execution of the model source).
```
>>> shrinkFilter.UpdatePipeline()
>>> shrinkFilter.GetDataInformation().GetNumberOfCells()
33L
```
- A representation is responsible for taking a data object and rendering it in a view. A view is responsible for managing a render context and a collection of representations. The representation object is created automatically with Show(). 


- When meta-data is not enough and you need access to the raw data, you can use Fetch() to bring it to the client side.

