library(shiny)
library(shinythemes)
library(rsconnect)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).


# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$valueNum <- renderPrint({ input$numVar })
  
  ##Para uma variavel
  
  varInput <- reactive({
    return(input$variable)
  })
  
  ##Para duas variaveis
  
  varxInput <- reactive({
    return(input$variableX)
  })
  varyInput <- reactive({
    return(input$variableY)
  })
  
  #---------------
  
  graficoPlot <- reactive({
    if(input$grafico == "barras"){
      # Render a barplot
      return(
        barplot(table(dados[,varInput()]), 
                main=varInput(),
                ylab="Frequencia",
                xlab="Numeros"))
    }else{
      return(
        # Render a pie
        pie(table(dados[,varInput()]), 
            main=varInput()))
    }
  })
  #output$texto <- renderText(graficoPlot())
  
  output$varPlot <- renderPlot({
    data <- graficoPlot()
  })
  
  output$sumario <- renderPrint({
    summary(dados[,varInput()])
  })
  output$tabela <- DT::renderDataTable({
    
    DT::datatable(as.data.frame(table(dados[,varInput()])))
  })
  
  
})
