# Script for "TSTool Training: Getting Started"

This script can be read when creating the video for this training presenttion.

## Title

1. Welcome to the training for TSTool software: "Getting Started".
2. This is an introductory level lesson that is expected to take about 30 minutes.
3. The TSTool software can be run parallel to this presentation.
4. Pause and reposition the presentation as necessary to absorb the information.

## Presentation Goals

1. Read the slide.

## TSTool Fetaure Summary

1. Read the slide

## Example of browsing, reading, and visualizing data

1. The TSTool user interface provides features to browse time series data, create and run command workflows, and view results.
2. The interface is organized in left to right and top to bottom order consistent with normal work activities.
3. Menus at the top allowing opening and saving command files, editing commands, and accessing documenation and diagnostics information.
4. The upper part of the interface allows browsing time series lists from various sources.
5. The time series list, or "catalog" provides standard time series metadata such as identifiers, interval, and units, and optional data depending on the data source.
6. The middle part of the interface shows the command list, which can be edited with ***Commands*** menu and right-click popup menu.
7. The bottom part of the interface shows results from running the commands, with results organized into tabs.  Right-click on results to show viewing tools, such as graph views.

## TSTool Role in CDSS

1. Read the slide

## Installation and Configuration

1. Read the slide

## Download the TSTool Installer

1. Read the slide

## Install TSTool

1. Read the slide

## Run TSTool

1. Read the slide

## TSTool Log File

1. Read the slide

## TSTool Installation and User Files

1. Read the slide

## HydroBase Database Configuration

1. Read the slide

## HydroBase Database Selection (as Input Type)

1. Read the slide

## Enable HydroBase Dataase DataStore

1. Read the slide

## Disabling HydroBase Database Features

1. Read the slide

## HydroBase Web Service Datastore

1. Read the slide

## After starting TSTool

1. At startup and depending on the configuration, TSTool may prompt for a HydroBase database.
2. The HydroBase selector will not be shown if HydroBase features have been disabled.

## Listing real-time streamflow station time series

1. This example shows how to read time series for real-time streamflow stations, also called telemetry stations in HydroBase.
2. First, use the input/query options to filter the time series list.
3. Select the HydroBaseWeb datastore. 
4. Select all Telemetry Station datatypes, indicated by the asterisk.
5. Select time step of hour.
6. Further filter the results to Water District 1.
7. Then press ***Get Time Series List***, which will display the list of time series in the upper right.
This step only queries time series metadata, not the data values, and is usually fast.
8. Select specific time series by clicking in a data column, using shift-click and ctrl-click to select groups, similar to Microsoft Excel.

## Graph time series

1. Once time series in the list are selected,
use the ***Copy Selected to Commands*** to copy the time series identifiers to the command list.
2. This will result in a preliminary, or "discovery" read of the time series, in order to have data used when editing commands.
3. Comments are lines that start with the hash character.
4. Use the ***Run all Commands*** button to run the commands,
which will generate results in the ***Time Series*** tab.
5. Right click on the highlighted time series in the ***Results*** and use the popup menu to select ***Graph - Line***,
which will display the graph.

## Time Series Graph Features

1. Read the slide.

## Time Series Graph Properties

1. Right-click on the graph to display the properties editor.
2. Many graph properties can be edited such as the title,
left axis properties, and color and symbol used to draw time series. 
3. Use the ***Apply*** button to apply the changes and redraw the graph.
4. Graph configurations can be saved and used with the ProcessTSProduct command to automate generation of images.

## Time Series Table

1. Use the popup menu to view a table,
or use the Table button on the bottom of the ***Graph*** window.
2. The table shows each time series in a table.
3. Use click, shift-click, and ctrl-click to select cells,
similar to Excel.
4. If multiple time series with different data intervals are displayed,
multiple tables will be shown.
5. Missing data values are shown as blanks.
6. If data values have flags,
they can optionally be shown next to data values.

## Time Series Summary

1. The time series summary is available from the results popup menu and ***Summary*** button on graph and table window.
2. The summary shows a text report of the time series using a default format.

## Time Series Identifier (TSID)

1. Read the slide.

## TSIDs and Time Series Alais

1. Read the slide.

## Command Files

1. Read the slide.

## Saving a command file

1. The commands in the ***Commands*** area can be saved to a file so that
they can be retrieved in the future and to allow
running in batch mode.
2. Use the ***File / Save / Commands*** menu to save the commands.
3. The command file is a text file and can be edited with a text editor.
4. Once a command file is saved, its name is shown in the title bar.
5. The command file can be reopened using the ***File / Open / Command File*** menu.

## More Information

1. More ifnormation is available in online documentation.
2. Use the ***Help*** menu to access the documentation for the software version.

## End

Thank you for viewing this training video.
Other training presentations and videos are available on other topics.