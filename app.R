#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
            checkboxGroupInput("continent", 
                               "Choose which Continent", 
                               choices = levels(gapminder$continent),
                               selected = c("Asia","Europe")),
            sliderInput("year",
                        "Select Years",
                        min = range(gapminder$year)[1],
                        max = range(gapminder$year)[2],
                        value = c(range(gapminder$year)[1],range(gapminder$year)[2]),
                        step = 1),
            selectInput("comparison", 
                        "Select a country for comparison", 
                        choices = levels(gapminder$country),
                        selected = "India")

        ),

        # Show a plot of the generated distribution
        mainPanel(
          
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        
        Continent <- input$continent
        dat <- subset(gapminder , gapminder$continent %in% Continent)
        ggplot(
          dat,
          aes(x = gdpPercap, y = lifeExp, size = pop, colour = continent)
        ) +
          geom_point(show.legend = TRUE, alpha = 0.7) +
          scale_color_viridis_d() +
          scale_size(range = c(2, 12)) +
          scale_x_log10() +
          labs(x = "GDP per capita", y = "Life expectancy")
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
