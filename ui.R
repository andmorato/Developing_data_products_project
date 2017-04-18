#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Transmission influence in milleage per gallon [MTCARS data]"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h4("Select predictors in list below:"),
      checkboxInput("selectPredictor1","Add/Remove Number of cylinders", value = FALSE),
      checkboxInput("selectPredictor2","Add/Remove Displacement", value = FALSE),
      checkboxInput("selectPredictor3","Add/Remove Gross horsepower", value = FALSE),
      checkboxInput("selectPredictor4","Add/Remove Rear axle ratio", value = FALSE),
      checkboxInput("selectPredictor5","Add/Remove Weight", value = FALSE),
      checkboxInput("selectPredictor6","Add/Remove 1/4 mile time", value = FALSE),
      checkboxInput("selectPredictor7","Add/Remove V/S", value = FALSE),
      checkboxInput("selectPredictor8","Add/Remove Number of forward gears", value = FALSE),
      checkboxInput("selectPredictor9","Add/Remove Number of carburetors", value = FALSE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Main", br(), 
                           ## plotOutput("distPlot")
                           h4("The fitted model is:"),
                           textOutput("formula"),
                           h4("The difference between manual and automatic tranmission is (mpg):"),
                           textOutput("mean"),
                           h4("With 95% confidence interval, the influence of transmission has the following range:"),
                           h5("Min:"),
                           textOutput("low"),
                           h5("Max:"),
                           textOutput("high"),
                           h4("The conclusion is:"),
                           textOutput("sentence"),
                           
                           plotOutput("plot1", brush = brushOpts(id = "brush1"))
                           ),
                  tabPanel("Documentation", br(),
                          h3("Developing Data Products Final Project"),
                          h5("This is a shiny application that evaluates the transmission (automatic or manual) influence in milleage per gallon of cars in MTCARS dataset."),
                          helpText(a("Click Here to access GitHub repository", href="https://github.com/andmorato/Developing_data_products_project")),
                          h4("Overview"),
                          h5("The mtcars data set was extracted from the 1974 Motor Trend US magazine. It comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)."),
                          h5("The data is formated in a data frame with 32 observations on 11 variables, as follows:"),
                          h6("[, 1] - mpg - Miles/(US) gallon;"),
                          h6("[, 2] - cyl - Number of cylinders;"),
                          h6("[, 3] - disp - Displacement (cu.in.);"),
                          h6("[, 4] - hp - Gross horsepower;"),
                          h6("[, 5] - drat - Rear axle ratio;"),
                          h6("[, 6] - wt - Weight (1000 lbs);"),
                          h6("[, 7] - qsec - 1/4 mile time;"),
                          h6("[, 8] - vs - V/S;"),
                          h6("[, 9] - am - Transmission (0 = automatic, 1 = manual);"),
                          h6("[,10] - gear - Number of forward gears;"),
                          h6("[,11] - carb - Number of carburetors;"),
                          
                          h4("Using the application:"),
                          h5("Select the predictors in side panel check boxes. The milleage per gallon will be fitted in function of selected predictors. The formula can be checked in first response box."),
                          h5("The initial configuration is no selected predictors. In this condition, only transmission will be set as predictor of milleage per gallon."),
                          h4("Analysis:"),
                          h5("First, it will be evaluated the transmission influence, that is the difference in milleage per gallon between automatic cars and manual cars. This influence changes as you select different set of predictors."),
                          h5("Second, it will be evaluated the 95% confidence interval of transmission influence. It means that for 95% of cars in this dataset this interval represents the transmission influence."),
                          h5("Finally, it will be presented the conclusion if transmission has influence in milleage per gallon for the set of predictors selected. This conclusion is obtained by hypothesis test explained in Statistical Inference class."),
                          h5("The analysis is finished with a plot of residuals, that is the difference between the actual value in comparision to the one obtained with the fitted model. This plot can give a rough idea if the selected predictors is good for predict milleage per gallon. The residuals will be reduced as the better is the choose of predictors.")
                           
                  )
                  
      )
                  
        
      
    )
  )
))
