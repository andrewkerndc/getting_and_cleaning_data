# Average dataset CodeBook

## Variables

There are two areas where we would like to perform variable analysis on:

subject
    30 different individuals had data collected, they are indicated via 
    integers between 1 and 30
activity
    The subjects participated in 6 different types of activities:
        Walking
        Walking upstairs
        Walking downstairs
        Sitting
        Standing
        Laying
    These are displayed in the dataset as a variable with a string 
    datatype
    
For each combination of the above variable elements, the run_analysis.R
script calculates the average for each of the below variables:

tBodyAccMag-mean()
tBodyAccMag-std()    
tGravityAccMag-mean()    
tGravityAccMag-std()    
tBodyAccJerkMag-mean()    
tBodyAccJerkMag-std()    
tBodyGyroMag-mean()    
tBodyGyroMag-std()    
tBodyGyroJerkMag-mean()    
tBodyGyroJerkMag-std()    
fBodyAccMag-mean()    
fBodyAccMag-std()    
fBodyBodyAccJerkMag-mean()     
fBodyBodyAccJerkMag-std()    
fBodyBodyGyroMag-mean()    
fBodyBodyGyroMag-std()    
fBodyBodyGyroJerkMag-mean()    
fBodyBodyGyroJerkMag-std()

For the above variables, they can be described via the 
'features_info.txt' provided with the initial data:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

## Data Cleaning Process
To arrive at the final dataset, the following actions were taken on the 
initially provided data:
- All data was loaded into R
- Meaningful/descriptive variable names were given to each column
- The 'Test' and 'Train' data were combined into a single data frame
- Columns which were not calculating the 'mean()' or 'std()' were
    removed from the dataset (activity labels and subjects were kept)
- The activity label ID was replaced in the dataset with the activity's
    descriptive name (i.e. 1 = walking, 6 = laying, etc.)
- The new column with the activity description was given a descriptive
    name (activity)
- The newly created dataset was used to create a summary dataset, 
    grouping by subject and activity to calculate the average for all 
    other measures
- The script then takes the summarized dataset and writes it to a .txt 
    file
