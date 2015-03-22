library(shiny)
library(ElemStatLearn)
library(ggplot2)

listLabels <- list("sbp" = "Systolic blood pressure",
                   "tobacco" = "Cumulative tobacco (kg)",
                   "ldl" = "Low density lipoprotein cholesterol",
                   "adiposity" = "Adiposity",
                   "famhist" = "Family history of heart disease",
                   "typea" = "Type-A behavior",
                   "obesity" = "Obesity",
                   "alcohol" = "Current alcohol consumption",
                   "age" = "Age at onset",
                   "chd" = "Coronary heart disease"
)

SAheart$chd <- as.factor(SAheart$chd)

shinyServer(
    function(input, output) {
  
  output$valueX <- renderPrint({input$selectX})
  output$valueY <- renderPrint({input$selectY})
  output$method <- renderPrint({input$selectMethod})
  
  output$qplot <- renderPlot({qplot(data = SAheart,
                                    x = SAheart[ ,input$selectX],
                                    y = SAheart[ ,input$selectY],
                                    col = SAheart[ ,input$selectGroup]) + stat_smooth(method = input$selectMethod, size = 1) + labs(
                                        x = listLabels[[input$selectX]],
                                        y = listLabels[[input$selectY]]) + 
                                  guides(color=guide_legend(title=listLabels[[input$selectGroup]])) +
                                  geom_point(size = 3) +
                                  theme(legend.position = "top")
  })

})
