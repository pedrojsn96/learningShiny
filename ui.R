library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).


# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("App Shiny - Pedro Neto"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        numericInput("numVar", label = "Quantidade de Variaveis:", value = 1, min = 1,max = 2),
        selectInput("variable", "Variveis:", 
                    choices=colnames(dados)),
        selectInput("grafico", "Graficos:", 
                    choices=c("Barras" = "barras","Pizza" = "pizza")),
        hr(),
        helpText("Dados de dados.csv")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        shinyUI(navbarPage("",
                tabPanel("Grafico",
                         plotOutput("varPlot")),
                tabPanel("Sumario",
                         verbatimTextOutput("sumario")),
                tabPanel("Tabela",
                         DT::dataTableOutput("tabela"))
        )),  
      textOutput("texto")
      )
      
      
    ) 
  )
)