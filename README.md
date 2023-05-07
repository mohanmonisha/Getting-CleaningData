# Getting-CleaningData
Coursera- DS course 3 project
This code downloads and extracts the data for the "Human Activity Recognition Using Smartphones Data Set" from the UCI Machine Learning Repository. The data is then loaded into R and merged into a single dataset. The mean and standard deviation measurements are extracted from the dataset and labeled with descriptive names. The activities are also labeled with descriptive names. Finally, a tidy dataset is created by calculating the average of each variable for each activity and subject.

## Steps
1. Download and extract the data from the UCI Machine Learning Repository.
2. Load the data into R.
3. Merge the data into a single dataset.
4. Extract the mean and standard deviation measurements from the dataset.
5. Label the variables with descriptive names.
6. Label the activities with descriptive names.
7. Create a tidy dataset by calculating the average of each variable for each activity and subject.

## Files
* UCI HAR Dataset.zip: the zip file containing the data.
* run_analysis.R: the R script that performs the above steps.
* README.md: this file.

## Dependencies
The following packages are required:

* dplyr
* stringr

## Running the script
To run the script, open R and set your working directory to the directory containing the run_analysis.R file. Then, run the following command:
source("run_analysis.R")

The script will download and extract the data, and create a tidy dataset named tidy_data.
