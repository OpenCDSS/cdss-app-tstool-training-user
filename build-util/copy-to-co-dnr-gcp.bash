#!/bin/bash
#
# Copy the training/*/*.pdf and *.mp4 files to OpenCDSS 'tstool/latest/training' folder.

# Supporting functions, alphabetical.

# Determine the operating system that is running the script:
# - mainly care whether Cygwin or MINGW
checkOperatingSystem() {
  if [ ! -z "${operatingSystem}" ]; then
    # Have already checked operating system so return.
    return
  fi
  operatingSystem="unknown"
  os=$(uname | tr [a-z] [A-Z])
  case "${os}" in
    CYGWIN*)
      operatingSystem="cygwin"
      ;;
    LINUX*)
      operatingSystem="linux"
      ;;
    MINGW*)
      operatingSystem="mingw"
      ;;
  esac
}

# Create the index file with training presentations:
# - create the 'index.html' file with a table of training presentations
createIndex() {
  local indexHtmlTmpFile

  indexHtmlTmpFile="/tmp/sam-tstool-training-index.html"
  echo "Temporary index file:"
  echo "  ${indexHtmlTmpFile}"
  echo "  $(cygpath -w ${indexHtmlTmpFile})"

  # Create the initial part of the file.

  echo '<!DOCTYPE html>
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta charset="utf-8"/>
<link id="cdss-favicon" rel="shortcut icon" href="https://opencdss.state.co.us/opencdss/images/opencdss-favicon.ico" type="image.ico">
<style>
   body {
     font-family: "Trebuchet MS", Helvetica, sans-serif !important;
   }
   table {
     border-collapse: collapse;
   }
   th {
     border-right: solid 1px;
     border-left: solid 1px;
     border-bottom: solid 1px;
     padding-left: 5px;
     padding-right: 5px;
   }
   td {
     border-right: solid 1px;
     border-left: solid 1px;
     padding-left: 5px;
     padding-right: 5px;
   }
   #installersize {
     border-right: solid 1px;
     border-left: solid 1px;
     padding-left: 5px;
     padding-right: 5px;
     text-align: right;
   }
   tr {
     border: none;
   }
</style>
<title>OpenCDSS TSTool Training</title>
</head>
<body>
<h1>TSTool Training</h1>
<p>
This page provides TSTool training materials.
</p>
<p>
<ul>
<li>Training lessons are sorted in the order that is recommended to learn TSTool.</li>
<li>Each video uses the corresponding PDF presentation and includes additional narrative comments.</li>
<li>Training presentations and examples can be found in the <code>doc/training</code> folder in the TSTool software installation files,
for example in <code>C:\CDSS\TSTool-Version\doc\training</code> on Windows.</li>
</ul>
</p>

<p>
See also:
<ul>
<li>  <a href="https://opencdss.state.co.us/tstool/latest/doc-user/appendix-install/install/">TSTool installation instructions</a></li>
<li>  <a href="https://opencdss.state.co.us/opencdss/tstool/">OpenCDSS TSTool page</a>,
      which provides additional information about TSTool</li>
<li>  <a href="https://www.colorado.gov/pacific/cdss/tstool">CDSS TSTool product page</a>,
      which provides access to TSTool releases used in State of Colorado projects</li>
</ul>
</p>

<hr>
<h2>TSTool Training Presentations and Videos</h2>
<table>
<tr><th>Title</th><th>Presentation File (pdf)</th><th>Video File (mp4)</th></tr>' > ${indexHtmlTmpFile}

  # List the cloud training folder:
  # - should have a mp4 and pdf file for each training
  # - ignore the index.html file since that will be created and uploaded
  # - because pdf files should always be present and mp4 is optional,
  #   add a row to the table when the pdf file is encountered as second line in pair
  #
  # 'gsutil -l' output before processing is similar to:
  #         0  2021-12-21T00:20:15Z  gs://opencdss.state.co.us/tstool/latest/training-user/
  #  61689631  2021-12-21T04:46:24Z  gs://opencdss.state.co.us/tstool/latest/training-user/00-tstool-intro-getting-started-cdss.mp4
  #   1078722  2021-12-21T04:46:26Z  gs://opencdss.state.co.us/tstool/latest/training-user/00-tstool-intro-getting-started-cdss.pdf
  #  49753661  2021-12-21T04:46:30Z  gs://opencdss.state.co.us/tstool/latest/training-user/01-tstool-intro-commands.mp4
  #   1000219  2021-12-21T04:46:33Z  gs://opencdss.state.co.us/tstool/latest/training-user/01-tstool-intro-commands.pdf
  #TOTAL: 5 objects, 113522233 bytes (108.26 MiB)
  #
  # 'gsutil' output before processing is similar to:
  #
  #  gs://opencdss.state.co.us/tstool/latest/training-user/
  #  gs://opencdss.state.co.us/tstool/latest/training-user/00-tstool-intro-getting-started-cdss.mp4
  #  gs://opencdss.state.co.us/tstool/latest/training-user/00-tstool-intro-getting-started-cdss.pdf
  #  gs://opencdss.state.co.us/tstool/latest/training-user/01-tstool-intro-commands.mp4
  #  gs://opencdss.state.co.us/tstool/latest/training-user/01-tstool-intro-commands.pdf

  gsutil.cmd ls "${gsFolderLatest}" | grep -E 'pdf|mp4' | awk -v debug=${debug} -v trainingFolder=${trainingFolder} -v trainingUrl=${trainingUrl} '
      BEGIN {
        if ( debug == "true" ) {
        }
      }
      {
        # Download file is the full line.
        #fileSize = $1
        #fileDateTime = $2
        #filePath = $3
        filePath = $1
        # Split the file path into parts to get the download file without path:
        # - index is 1+
        nparts = split(filePath,filePathParts,"/")
        fileName = filePathParts[nparts]
        fileUrl=sprintf("%s/%s", trainingUrl, fileName)
        fileExt=substr(fileName,length(fileName) - 3 + 1)
        if ( debug == "true" ) {
          printf("<!-- [DEBUG] fileName=%s -->\n", fileName)
          printf("<!-- [DEBUG] fileUrl=%s -->\n", fileUrl)
          printf("<!-- [DEBUG] fileExt=%s -->\n", fileExt)
        }
        # Check the file extension.
        if ( fileExt == "pdf" ) {
          pdfFile=fileName
          pdfUrl=fileUrl
          # File with .info extension has the training session title:
          # - initialize with the pdf filename
          # - then replace the extension
          infoPath=sprintf("%s/*/%s",trainingFolder, pdfFile)
          gsub(".pdf",".info",infoPath)
          if ( debug == "true" ) {
            printf("<!-- [DEBUG] infoPath=%s -->\n", infoPath)
          }
        }
        else if ( fileExt == "mp4" ) {
          mp4File=fileName
          mp4Url=fileUrl
        }

        # If the PDF is detected, it will be second in the pair mp4 and pdf records,
        # so have all the information to output.
        if ( fileExt == "pdf" ) {
          # Get the *.info file contents.
          cmd=sprintf("cat %s", infoPath)
          cmd | getline fileInfo

          printf "<tr><td><b>%s</b></td><td><a href=\"%s\"><code>%s</code></a></td><td><a href=\"%s\"><code>%s</code></tr>\n", fileInfo, pdfUrl, pdfFile, mp4Url, mp4File
        }
      }' >> ${indexHtmlTmpFile}
  echo '</table>' >> ${indexHtmlTmpFile}

  # Copy the file to the OpenCDSS website.
  gsutil.cmd cp ${dryrun} ${indexHtmlTmpFile} ${gsFolderLatest}/index.html

  return 0
}

# Parse the command parameters.
parseCommandLine() {
  local d h i l opt
  while getopts :dhil opt; do
    #echo "Command line option is ${opt}"
    case ${opt} in
      d) # Indicate that files should not overwrite existing files.
        dryrun="-n"
        ;;
      i) # Create the index only, don't sync the files.
        doSync="false"
        ;;
      h) # Usage.
        printUsage
        exit 0
        ;;
      \?)
        echo "Invalid option:  -${OPTARG}" >&2
        exit 1
        ;;
      :)
        echo "Option -${OPTARG} requires an argument" >&2
        exit 1
        ;;
    esac
  done
}

# Print the usage.
printUsage() {
  echo ""
  echo "Usage:  $0"
  echo ""
  echo "Copy the .pdf and .mp4 files from training folders to the 'latest' website folder:  ${gsFolderLatest}"
  echo "Also create an index.html file to list the training presentations."
  echo ""
  echo "-d   Dry run (print actions but don't overwrite files)."
  echo "-h   Print usage"
  echo "-i   Create the index file but don't upload files."
  echo ""
}

# Sync the files to the cloud:
# - currently this always uses 'cp', not 'sync'
# - currently only copies to latest
syncFiles() {
  local exitStat
  exitStat=0
  # Change to training folder.
  echo ""
  echo "Changing folders to:  ${trainingFolder}"
  cd ${trainingFolder}

  echo ""
  echo 'Copying training *.pdf and *.mp4 files to the "latest/training-user" folder:'
  echo "  from: ${trainingFolder}"
  echo "    to: ${gsFolderLatest}"
  read -p "Continue with upload (Y/n)? " answer
  if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
    # List the training files:
    # - use 'find' with multiple patterns
    # - output is similar to:  
    #   ./00-intro-getting-started-cdss/00-tstool-intro-getting-started-cdss.pdf
    #   ./00-intro-getting-started-cdss/00-tstool-intro-getting-started.mp4
    #   ./01-intro-commands/01-tstool-intro-commands.mp4
    #   ./01-intro-commands/01-tstool-intro-commands.pdf
    find . -name '*.pdf' -o -name '*.mp4' | while read trainingFile;
      do
        # Copy to the latest:
        # - get the filename only without path
        # - copy all the files into the one cloud folder
        trainingFileBase=$(basename ${trainingFile})
        echo "Running:  gsutil.cmd cp ${dryrun} ${trainingFile} ${gsFolderLatest}/${trainingFileBase}"
        gsutil.cmd cp ${dryrun} ${trainingFile} ${gsFolderLatest}/${trainingFileBase}
        exitStat=$?
      done
  fi
  return ${exitStatus}
}

# Entry point for the script.

# The -i option will set to false.
doSync="true"

# Debug is off by default.
#debug="false"
debug="true"

# Check the operating system.
checkOperatingSystem

# Get the location where this script is located since it may have been run from any folder.
scriptFolder=$(cd $(dirname "$0") && pwd)
gitRepoFolder=$(dirname "${scriptFolder}")
trainingFolder="${gitRepoFolder}/training"
trainingUrl="https://opencdss.state.co.us/tstool/latest/training-user"
gsFolderLatest="gs://opencdss.state.co.us/tstool/latest/training-user"

echo "scriptFolder=${scriptFolder}"
echo "gitRepoFolder=${gitRepoFolder}"
echo "trainingFolder=${trainingFolder}"
echo "trainingUrl=${trainingUrl}"
echo "gsFolderLatest=${gsFolderLatest}"

# Set --dryrun to test before actually doing.
dryrun=""

# Parse the command line.
parseCommandLine $@

# Sync the files to the cloud.
if [ "${doSync}" = "true" ]; then
  syncFiles
fi

# Create and upload the index.html file.
createIndex 

# TODO smalers 2021-12-20 need intelligent exit code.
exit 0
