
## Developing Data Products Final Project

This is a shiny application that evaluates the transmission (automatic or manual) influence in milleage per gallon of cars in MTCARS dataset.


### Overview
                          
The mtcars data set was extracted from the 1974 Motor Trend US magazine. It comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).
The data is formated in a data frame with 32 observations on 11 variables, as follows:

[, 1] - mpg - Miles/(US) gallon
[, 2] - cyl - Number of cylinders
[, 3] - disp - Displacement (cu.in.)
[, 4] - hp - Gross horsepower
[, 5] - drat - Rear axle ratio
[, 6] - wt - Weight (1000 lbs)
[, 7] - qsec - 1/4 mile time
[, 8] - vs - V/S
[, 9] - am - Transmission (0 = automatic, 1 = manual)
[,10] - gear - Number of forward gears
[,11] - carb - Number of carburetors
                          
### Using the application:

Select the predictors in side panel check boxes. The milleage per gallon will be fitted in function of selected predictors. The formula can be checked in first response box.
The initial configuration is no selected predictors. In this condition, only transmission will be set as predictor of milleage per gallon.

### Analysis:

First, it will be evaluated the transmission influence, that is the difference in milleage per gallon between automatic cars and manual cars. This influence changes as you select different set of predictors.
Second, it will be evaluated the 95% confidence interval of transmission influence. It means that for 95% of cars in this dataset this interval represents the transmission influence.
Finally, it will be presented the conclusion if transmission has influence in milleage per gallon for the set of predictors selected. This conclusion is obtained by hypothesis test explained in Statistical Inference class.
The analysis is finished with a plot of residuals, that is the difference between the actual value in comparision to the one obtained with the fitted model. This plot can give a rough idea if the selected predictors is good for predict milleage per gallon. The residuals will be reduced as the better is the choose of predictors.
