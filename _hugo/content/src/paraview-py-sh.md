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
  >>>   33L
  ```
- A representation is responsible for taking a data object and rendering it in a view. A view is responsible for managing a render context and a collection of representations. The representation object is created automatically with Show().
  ```
  >>> Show(shrinkFilter)
  >>> Render()
  ```

## paraview.simple Module

The simple module is a ParaView component written using Python on top of the Server Manager C++ library. Its purpose is to make it easier to create ParaView data analysis and visualization pipelines using Python. The simple module can be loaded from Python interpreters running in several applications. (**pvpython**, **pvbatch**, **paraview**, **External Python interpreter**)

- **paraview**: Python scripts can be run from the paraview client using the Python shell that is invoked from **Tools**|Python Shell. The Python shell supports interactive mode as well as loading of scripts from file.

- ParaView can run in two modes: stand-alone and client/server where the server is usually a visualization cluster.

- You can access the documentation of all Proxy types by using Python's built-in help.
  ```
  >>> help(paraview.simple.Cone)
  ```

  - To get the full documentation, you have to create an instance.

  ```
  >>> c = Cone()
  >>> help(c)
  ```

## Source Proxies

- **GetDataInformation()**: This method is used to obtain meta-data about one output.

- There are two common ways of getting meta-data information from a proxy: information properties and DataInformation.

  -  Information properties are updated automatically every time UpdatePropertyInformation() and  pdatePipelineInformation() are called. All you have to do is read the data from the property as usual.
  -  DataInformation object from a source proxy use *GetDataInformation(port=0*). By default, this method returns data information for the first output. You can pass an optional port number to get information for another output. 

- When meta-data is not enough and you need access to the raw data, you can use Fetch() to bring it to the client side. Note that this function is provided by the servermanager module. Fetch() has three modes: 

  - Append all of the data together and bring it to the client (only available for polygonal and unstructured datasets). Note: Do not do this if data is large otherwise the client will run out of memory.

  - Bring data from a given process to the client.


  - Use a reduction algorithm and bring its output to the client. For example, find the minimum value of an attribute.


## Exporting CSV Data

- To export a csv from the cell or point data associated with a source, one can use the following: 

  ```
  >>> writer = CreateWriter(".../foo.csv", source) 
  >>> writer.FieldAssociation = "Points" # or "Cells"
  >>> writer.UpdatePipeline()
  >>> del writer
  ```
