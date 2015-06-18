# README

## What this does

This script, _run_analysis.R_, transforms the raw HAR dataet (Human Activity Recognition Using Smartphones Dataset) into a tidy set. This repo also includes the resulting tidy dataset (output.txt) and the codebook (codebook.MD).

The script was written by Eugene Tsuprun for a course project (Getting and Cleaning Data, https://www.coursera.org/course/getdata, June 2015).

## About the raw data set

The full description of the raw data set is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw set contains 561 measurements of velocity and acceleration, recorded with a smartphone gyroscope and accelerometer, from 30 subjects each performing 6 different activities (ALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

## The tidy set

The tidy set contains just the means and standard deviations of each measurement, by subject and by activity. See _codebook.MD_ for details.

## The script

The script, _run_analysis.R_, transforms the raw set into the tidy set by:

1. Combining the training and test datasets
2. Linking the measurements to subject IDs
3. Laveling each activity and feature
4. Computing means and SDs for each activity, by subject and activity
5. Reorganizing the data so that each feature/activity/subject/measure (mean or SD) combination is in its own row

To use the script, download the raw dataset here: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/

Place the script into the main folder for the dataset, and set the working directory to the dataset folder. Then, simply run the script to generate "output.txt"--the tidy dataset.

## Contents

* _codebook.MD_: describes the fields in the tidy dataset
* _output.txt_: the tidy dataset
* _run_analysis.R_: contains the R script that tidies the raw data set


## Dataset source

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
