CodeBook

ScriptRunDate		:	Variable that records the run time each time the script is executed.
ScriptRunRversion	:	Variable that records the R version each time the script is executed.

X_train				:	Variable to read in the Training Data Set.
X_test				:	Variable to read in the Testing Data Set. 
X_comb				:	Variable to combine Training (X_train) and Testing (X_Test) data sets.

subject_train		:	Variable to read in the subject codes for the training data set.
subject_test		:	Variable to read in the subject codes for the testing data set.
subject_comb		:	Variable to combine the Training and Testing subject codes.

y_train				:	Variable to read in the activity codes for the training data set.
y_test 				:	Variable to read in the activity codes for the testing data set.
y_comb				:	Variable to combine the Training and Testing activity codes.

tfeatDF				:	Header labels for the variables.

mIdx				:	Index numbers for the columns with names containing "mean" in them.
sIdx				:	Index numbers for the columns with names containing "std" in them.
combIdx				:	Combined index numbers used to strip the data.

strippedData		:	Stripped data from the full data set, which is used to compute the tidy data set.
ordData				:	Ordered version of the "strippedData" set.  Ordering is done by SubjectCode and then Activity Code.

TidyData			:	Final tidy data set containing all average values for the variables "mean", "std" in their names. It is ordered by Subject Code and Activity Code.


Feature Selection  ( As Provided by the UCI)
=================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated 
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
