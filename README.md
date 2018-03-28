## before you run:
You must first call dplyr before trying to run the code via : library(dplyr)
### How the code works:
first the code loads the x_test and x_train data and combines them together
the code then reads the features and gets all the features about only the mean and standard deviation measurements 
using the result data from the previous step, the code extracts only the measurements about mean ans standard deviation
after that we combine the y_test and y_train data
then we transform the activity numbers into the corresponding activity label
then we modify the column names for each dataset we have
then we combine the two data sets into one final data set that has the activity labels and readable column names
from line 23:36 we create the new dataset that gets the average of each measurements based on the activity label
