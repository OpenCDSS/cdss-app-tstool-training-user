# 2023-03-13 TSTool Advanced Training for State of Colorado

## Introduction ##

This agenda is for an advanced TSTool training session for State of Colorado staff and consultants.
The training is presented using TSTool 14.6.0 or later.

**You are encouraged to use TSTool parallel to the agenda walk-through.**

## Agenda ##

1.  **Audience topics of interest?**
    1.  Are there any topics that need to be covered?
2.  **TSTool download and installation:**
    1.  TSTool installs into versioned folders that are separate from each other.
        This eats up disk space but allows old versions to be run if needed.
    2.  Installation requires administrator privileges but there are options to remove this requirement (upcoming release).
    3.  TSTool automatically tries to show documentation that matches the current version
        and if it can't find it the "latest" version is shown.
    4.  The release notes are the main place to learn about new features.
    5.  Software files exist in the `C:\CDSS` "installation" location and the `C:\Users\user` "user files" location.
    6.  Does anyone have any questions about installation?
3.  **Use the repository issues:**
    1.  All (or most) known issues are listed in [GitHub repository issues](https://github.com/OpenCDSS/cdss-app-tstool-main/issues).
    2.  Issues may be added to various repositories because the code, libraries, documentation, and tests are split up.
    3.  An email inquiry is OK for questions like "How do I do X in TSTool?", but enhancements or bug fixes need to be listed in the issues.
    4.  There are technologies to create knowlege bases, including GitHub wikis.
4.  **General:**
    1.  You can right-click on many things to get options.
    2.  Use the documentation search tool.
    3.  Question:  Maybe documentation should indicate which menu(s) contain a command?
    4.  Trust:  TSTool has about 3000 automated tests and is "widely" used.
    5.  Efficiency:  Spend your time on a robust workflow and time will be saved every time TSTool is used.
    6.  The best way to learn is to use TSTool and keep using it.  See the examples in the documentation.
5.  **Document your workflows:**
    1.  See the ***Commands / General - Comments*** menu items.
    2.  There are quite a few special comments that use `#@` annotation syntax,
        which is now common across many programming languages.
    3.  Special comments can be evaluated before and during running command files.
    4.  Versions are important for tracking work revisions and ensuring that dependencies are OK.
    5.  See the [`#@require`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/Comment/Comment/#annotations) comments,
        which could also be implemented in StateMod and StateCU response files.
    6.  This will become more important as more people use the datasets and tools.
6.  **Using Properties:**
    1.  The term "command file" is equivalent to "workflow" and workflows can be larger than a command file.
    2.  The command processor uses "properties" to control the workflow logic.
    3.  See the ***Results / Properties*** for a list of built-in and user-defined property names, types, and values.
    4.  Can use the [`SetProperty`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/SetProperty/SetProperty/)
        command to set a property.
    5.  Many commands recognize `${Property}` notation.
    6.  If a property is used for a TSID command parameter, other command editors will show the property because
        reliably determining TSIDs expanded from properties can be difficult to do when in editing mode.
7.  **Datastores:**
    1.  Conceptually, are storage for data.
    2.  In the early days, TSTool used "input type" to indicate,
        for example, StateMod and StateCU files.
    3.  In today's design, this would probably be a "File datastore" and may change in the future.
    4.  All new development uses datastores, especially for for web services and databases.
    5.  See the ***View / Datastores*** menu to list configured datastores.
    6.  Some datastores are "built in" and others are plugins.
8.  **Plugin datastores:**
    1.  See the [Reference - Plugins](https://opencdss.state.co.us/tstool/latest/doc-user/plugin-ref/overview/) documentation for known plugins.
        So far only the Open Water Foundation and TriLynx Systems have developed plugins.
    2.  Two main features are needed to implement a plugin:
        1.  Listing time series.
        2.  Reading time series data.
    3.  Optionally:  writing time series data.
9.  **Comparing files:**
    1.  See the ***View / Command File Diff*** menu.
    2.  KDiff3 is the default but can configure other tools.
    3.  The [`CompareFiles`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/CompareFiles/CompareFiles/) command editor allows comparing files.
10. **Controlling logic with `If` and `For`:**
    1.  [`If`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/If/If/) can do simple math checks and also check for files and time series.
        1.  Uses properties.
        2.  Useful for handling errors.
        3.  Requires a matching
            [`EndIf`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/EndIf/EndIf/).
        4.  Can be nested.
        5.  Auto-indent as of TSTool 14.6.0.
    2.  [`For`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/For/For/) 
        can iterate over a sequence of values, table column values, or list of time series.
        1.  Uses properties.
        2.  Requires a matching
            [`EndFor`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/EndFor/EndFor/).
        3.  Does not currently iterate over date/time, but that could be added and would allow
            granular control over data manipulation.
        4.  Can be nested.
        5.  Auto-indent as of TSTool 14.6.0.
11. **Automating data visualization and other tricks:**
    1.  Does everyone know about graph properties and "time series product" files?
    2.  Graph configurations can be saved and used with
        [`ProcessTSProduct`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/ProcessTSProduct/ProcessTSProduct/)
        to automate image creation.
    3.  OWF saves graph configurations as JSON files and uses to configure web visualizations.
    4.  See the ***Results / Graph - Raster Graph*** menu,
        which is useful for data, quality control, etc.
    5.  Time series data values can have flags.  See the flags option in the table view.
    6.  See the mouse tracker in the graph view.
12. **Time series properties:**
    1.  Right click on a time series in results and use the ***Time Series Properties*** menu to view properties.
    2.  Properties are carried along with time series, similar to the main time series list metadata.
    3.  Properties can be useful for troubleshooting.
13. **Integrating with tables:**
    1.  The ***Commands(Table)*** menu provides commands to manipulate tables.
    2.  Table data can be integrated with time series using table properties.
14. **Integrating with databases:**
    1.  The ***Commands / Datastore Processing*** commands integrate with databases.
    2.  Can read and write tables and time series.
    3.  Recently re-enabled Microsoft Access.
    4.  SQLite can be a good option to manage data, including use of in-memory database.
    5.  TSTool has been used with Microsoft SQL Server, PostgreSQL, Oracle, MySQL, Access, SQLite and other ODBC databases.
15. **Spatial data integration:**
    1.  The ***Commands / Spatial Processing*** commands integrate with spatial data.
    2.  Can write common spatial data files such as shapefiles, KML, and GeoJSON using table and time series data.
    3.  Can also read the DBF file for shapefiles using ***ReadTableFromDBF*** command.
16. **JSON object processing:**
    1.  Relatively new features.
    2.  Useful for integrating with web services.
    3.  Can read a GeoJSON file and add attributes from time series processing.
17. **Spreadsheet integration:**
    1.  Can read and write from Excel files.
    2.  Can use Excel to provide controlling information in named cells.
    3.  Can format Excel output using conditional formatting to color-code cells.
    4.  More could be done with funding, such as automating adding formulas, defining charts, etc.
18. **Hydrologic modeling:**
    1.  The ***Commands / Models - Routing*** menu provides commands to route time series.
    2.  The ***Commands / Network Processing*** menu provides commands to define a network from a table,
        which can be used for node and basin networks.
    3.  Many commands are useful for processing hydrologic data.
    4.  OWF is developing new features for hydrologic data analysis for example a generalized point flow tool
        and storm event analysis.
19. **Cloud integration:**
    1.  Use the [`WebGet`](https://opencdss.state.co.us/tstool/latest/doc-user/command-ref/WebGet/WebGet/) command to execute HTTP requests
    2.  For example, use a workflow to download a dataset before processing.
    3.  OWF uses this command inside a `For` block to check the URLs in a dataset
        for validity.
    4.  OWF has developed a
        [plugin for Amazon Web Services](https://software.openwaterfoundation.org/tstool-aws-plugin/)
        to automate upload to websites.
    5.  Similar plugins for Google Cloud Platform or Microsoft Azure could be developed with funding.
20. **Automated testing and quality control:**
    1.  The approach that is used to implement tests for TSTool software is general.
    2.  OWF and TriLynx Sysetms use TSTool to test software functionality and web services.
    3.  Workflows can be used to compare data from multiple sources.
    4.  Workflows can compare database with web service contents.
21. **TSTool for spatial:**
    1.  If you like how TSTool works and would like to do something similar for spatial data analysis,
        see the OWF [GeoProcessor](https://software.openwaterfoundation.org/geoprocessor/latest/doc-user/) software,
        which is based on QGIS and PyQGIS.
    2.  A new release to work with QGIS 3.22.16 long term release is under development.
