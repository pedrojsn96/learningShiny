library(shinythemes)
library(rsconnect)
# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(theme = shinytheme("cerulean"),    
            
            # Give the page a title
            titlePanel("App Shiny - Pedro Neto"),
            
            # Generate a row with a sidebar
            sidebarLayout(      
              
              # Define the sidebar with one input
              sidebarPanel(
                numericInput("numVar", label = "Quantidade de Variaveis:", value = 1, min = 1,max = 2),
                conditionalPanel("input.numVar == 1",
                                 selectInput("variable", "Variavel X:", 
                                             choices=colnames(dados)),
                                 selectInput("grafico", "Graficos:", 
                                             choices=c("Barras" = "barras","Pizza" = "pizza"))
                ),
                conditionalPanel("input.numVar == 2",
                                 selectInput("variableX", "Variavel X:", 
                                             choices=colnames(dados)),
                                 selectInput("variableY", "Variavel Y:", 
                                             choices=colnames(dados)),
                                 
                                 selectInput("grafico", "Graficos:", 
                                             choices=c("Barras" = "barrasx"))
                ),
                hr(),
                helpText("Dados de dados.csv")
              ),
              
              # Create a spot for the barplot
              mainPanel(
                shinyUI(
                  navbarPage("",
                             tabPanel("Grafico",
                                      plotOutput("varPlot")),
                             tabPanel("Sumario",
                                      verbatimTextOutput("sumario")),
                             tabPanel("Tabela",
                                      DT::dataTableOutput("tabela"))
                  ))  
                #textOutput("texto")
              )
              
              
            ) 
  )
)