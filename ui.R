library(shiny)

listAxis <- list("Systolic blood pressure" = "sbp",
                 "Cumulative tobacco (kg)" = "tobacco",
                 "LDL cholesterol" = "ldl",
                 "Adiposity" = "adiposity",
                 "Type-A behavior" = "typea",
                 "Obesity" = "obesity",
                 "Alcohol consumption" = "alcohol",
                 "Age at onset" = "age"
)

listGroups <- list("Systolic blood pressure" = "sbp",
                   "Cumulative tobacco (kg)" = "tobacco",
                   "LDL cholesterol" = "ldl",
                   "Adiposity" = "adiposity",
                   "Family history of heart disease" = "famhist",
                   "Type-A behavior" = "typea",
                   "Obesity" = "obesity",
                   "Alcohol consumption" = "alcohol",
                   "Age at onset" = "age",
                   "Coronary heart disease" = "chd"
)

shinyUI(fluidPage(

  # Application title
  titlePanel("South African Hearth Disease Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        selectInput("selectX", label = h3("X-axis"),
                    choices = listAxis, selected = "age"),
        
        selectInput("selectY", label = h3("Y-axis"),
                    choices = listAxis, selected = "sbp"),
        
        selectInput("selectGroup", label = h3("Group by"),
                    choices = listGroups, selected = "chd"),
        
        radioButtons("selectMethod",
                       label = h3("Select regression"),
                       choices = list("Linear Model" = "lm",
                                      "Loess" = "loess"),
                       selected = "lm")
    ),
    mainPanel(
      plotOutput("qplot"),
      p("In this Shiny application you can perform basic exploratory analysis of the 
South African Hearth Disease Data set (SAheart) which is part of",
        a("the ElemStatLearn package.", href="http://www.inside-r.org/packages/cran/ElemStatLearn/docs/SAheart")),
      p("Data set contains 10 variables collected from 462 cases. Each variable is a specific risk factor
        which may contribute to the development of the coronary heart disease."),
      p("Using the drop-down menus you can select one variable for the X-axis and one variable for the Y-axis.
        You can also select a third variable by which the cases will be grouped on the chart.
        The grouping will be marked as colored cases within the chart."),
      p("Two variables are not available for axes: 'Family history of heart disease' and 'Coronary heart disease'.
        These are binomial variables and scatter plot in case of our applications is not the most suitable option
        for visualisation."),
      p("The 'Select regression' gives the option to change between two regression methods: Linear Model
        and Loess (Local Polynomial Regression Fitting) for analysing non-linear relationship.")
    )
  )
))
