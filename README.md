# Read Me for run_analysis.R

The run_analysis.R script is used to clean and analyze a set of data
around wearable computing data. 

The original set of data was spread across multiple files:
- 'features_info.txt': Shows information about the variables used on the
 feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who 
performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration 
signal from the smartphone accelerometer X axis in standard gravity 
units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration 
signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity 
vector measured by the gyroscope for each window sample. The units are 
radians/second. 

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

