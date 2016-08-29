## Project Description
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. In this project we submit, 
1. a tidy data set as described below 
1. a link to a Github repository with your script for performing the analysis, and 
1. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
1. Produce a README.md like this one in the repo with your scripts. 

## How it works:

* In order for the script to work, download the zip file from the following link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and save to a default R working directory. 

* Once download complete, unzip the file and save it under the folder name "UCI HAR Dataset", make sure it does not have another subfolder under the same. You can validate the file directory and make sure you have the following, otherwise the R script will fail
    - .\UCI HAR Dataset
    - .\UCI HAR Dataset\test
    - .\UCI HAR Dataset\train

* Start R studio and load the R script provided in this repository
* Execute the code
* Make sure TidyDatSet created.

## Components 
1. CodeBook.MD this file provide complete details of the collected data and data dictionary
2. run_analysis.R is the script that we can run to produce tidaydataset 