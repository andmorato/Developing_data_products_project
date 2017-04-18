#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
   fit.linear <- reactive({
     selectedPredictors <- c(input$selectPredictor1, input$selectPredictor2,
                           input$selectPredictor3, input$selectPredictor4,
                           input$selectPredictor5, input$selectPredictor6,
                           input$selectPredictor7, input$selectPredictor8,
                           input$selectPredictor9)
    
    if (sum(selectedPredictors) == 0){
      string = " "
    } else {
    string <- paste("", names(subset(mtcars, select = c(-mpg, -am)))[selectedPredictors], sep = " + ", collapse = "")
    }
    fitstring <- paste("fit<-lm(mpg ~ am", string, ",data=mtcars)") 
    eval(parse(text=fitstring))
    
    fit
    
    })
   
  output$formula <- renderText({
   as.character(fit.linear()$call)
  }) 
  
  output$mean <- renderText({
    round(summary(fit.linear())$coefficients[2],2)
  })
  
  output$low <- renderText({
    round(summary(fit.linear())$coefficients[2]+c(-1,1)*qt(0.975, df = fit.linear()$df)*summary(fit.linear())$coefficients[4+dim(summary(fit.linear())$coefficients)[1]-2],2)[1]
  })
  
  output$high <- renderText({
    round(summary(fit.linear())$coefficients[2]+c(-1,1)*qt(0.975, df = fit.linear()$df)*summary(fit.linear())$coefficients[4+dim(summary(fit.linear())$coefficients)[1]-2],2)[2]
  })
  
  output$sentence <- renderText({
    if ( (round(summary(fit.linear())$coefficients[2]+c(-1,1)*qt(0.975, df = fit.linear()$df)*summary(fit.linear())$coefficients[4+dim(summary(fit.linear())$coefficients)[1]-2],2)[1] < 0 & 
          round(summary(fit.linear())$coefficients[2]+c(-1,1)*qt(0.975, df = fit.linear()$df)*summary(fit.linear())$coefficients[4+dim(summary(fit.linear())$coefficients)[1]-2],2)[2] < 0) | 
         (round(summary(fit.linear())$coefficients[2]+c(-1,1)*qt(0.975, df = fit.linear()$df)*summary(fit.linear())$coefficients[4+dim(summary(fit.linear())$coefficients)[1]-2],2)[1] > 0 & 
          round(summary(fit.linear())$coefficients[2]+c(-1,1)*qt(0.975, df = fit.linear()$df)*summary(fit.linear())$coefficients[4+dim(summary(fit.linear())$coefficients)[1]-2],2)[2] > 0) ) {
      paste("As the confidence interval does not contain 0, the t-test {H0: transmission = 0 versus Ha: transmission not equal 0} can be rejected. So, for a linear regression with selected predicitors, we can assure that manual transmission is better than automatic transmission in relation to fuel consumption.")
    } else {
      paste("As the confidence interval contains 0, the t-test {H0: transmission = 0 versus Ha: transmission not equal 0} can not be rejected. So, it is not possible to assure that there a is better type of transmition in relation to fuel consumption.")
    }
  })
  
  output$plot1 <- renderPlot({
    plot(predict(fit.linear()), resid(fit.linear()),pch = 20, main="Residuals of linear regression of selected model", xlab = "Predicted milleage per gallon", ylab = "Residuals")
    abline(h=0)
  })
  
})
