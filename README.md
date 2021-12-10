# cdss-app-tstool-training-user #

This repository contains the user training presentations and examples
for Colorado's Decision Support Systems (CDSS) TSTool software.
A repository separate other repositories is used due to the potentially large size of content,
and potential for non-coders to contribute to documentation.

See the deployed [CDSS / TSTool](http://opencdss.state.co.us/tstool/latest/doc-user/) user documentation.
See the following online resources:

* [Colorado's Decision Support Systems (CDSS)](https://cdss.colorado.gov/)
* [OpenCDSS](http://opencdss.state.co.us/opencdss/)
* [TSTool software main repository](https://github.com/OpenCDSS/cdss-app-tstool-main)

See the following sections on this page:

* [Repository Contents](#repository-contents)
* [Editing and Viewing Content](#editing-and-viewing-content)
* [Deploying the Training Materials](#deploying-the-training-materials)
* [Style Guide](#style-guide)
* [License](#license)
* [Contributing](#contributing)
* [Maintainers](#maintainers)

---------------------------

## Repository Contents ##

The repository contains the following:

```text
.github/              Files specific to GitHub such as issue template.
.gitattributes        Typical Git configuration file for repository attributes.
.gitignore            Typical Git configuration file for ignored file list.
README.md             This file.
build-util/           Useful scripts to view, build, and deploy training materials.
training/             Main folder for training lessons.
  NN-title/           Training lessons generally organizized in presentation order.
    files...          Files for each training lesson.
```

The repository can be cloned into the recommended standard CDSS development folder structure,
shown below.
Note that large training videos are not saved in the repository and instead
are loaded to the cloud.

```text
C:\Users\user\                            Windows:  User's files.
/home/user/                               Linux:  User's files.
/cygdrive/C/Users/user/                   Cygwin:  User's files.
  cdss-dev/                               Main development location for CDSS products.
    TSTool/                               TSTool software development files.
      git-repos/                          Git repositories for TSTool software.
        cdss-app-tstool-doc/              Legacy user and developer documentation, primarily in Word/PDF.
        cdss-app-tstool-doc-user/         User documentation using Markdown/MkDocs.
        cdss-app-tstool-training-user/    This repository.
        ... other repositories ...
```

## Development Environment ##

The development environment for contributing to these training lessons requires
installing TSTool and PowerPoint.
PowerPoint presentations are converted to videos by using software such as GoToMeeting
to record the presentation and convert to MP4 format for publishing.

## Editing and Viewing Content ##

Each training lesson exists in a folder and has a corresponding PowerPoint presentation.

1. Edit each training PowerPoint:
     * can use images from the user documenation
2. Save as PDF for distribution with the TSTool software in `doc/training` folder.
3. Optionally, also use video recording software such as GoToMeeting and the `script` file for narration.
4. Publish the training video to the OpenCDSS website for internet viewing.

## Deploying the Documentation ##

The training PowerPoint PDFs and supporting examples are deployed with the TSTool software in the normal build process.

The following script will copy the videos to the OpenCDSS website in the `training` folder.

```
build-util/copy-to-co-dnr-gcp.sh
```

This copies the 
to the State of Colorado's Google Cloud Platform.
This requires installing the Google Cloud Platform `gcloud` command line tool and being authenticated.

## Style Guide ##

* As much as possible, follow the user documentation style guide.
* Use State of Colorado PowerPoint template.

## License ##

This documentation is copyrighted by the Colorado Department of Natural Resources.

This TSTool training documentation is licensed using the
[Creative Commons Attribution International 4.0 (CC BY 4.0) license](https://creativecommons.org/licenses/by/4.0/).

The TSTool software is licensed using the GPL 3 license.
See the [TSTool software repository](https://github.com/OpenCDSS/cdss-app-tstool-main).

## Contributing ##

Contribute to the documentation as follows:

1. Use GitHub repository issues to report minor issues.
Fill out the template issue.
2. Use GitHub pull requests.
3. A member of the core development team will follow up to issues and pull requests.

## Maintainers ##

This repository is maintained by the OpenCDSS team.
