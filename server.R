library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).


# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$valueNum <- renderPrint({ input$numVar })
  output$varPlot <- renderPlot({
    # Render a barplot
    barplot(table(dados[,input$variable]), 
            main=input$variable,
            ylab="Frequencia",
            xlab="Numeros")
  })
  
  output$sumario <- renderPrint({
    summary(dados[,input$variable])
  })
  output$tabela <- DT::renderDataTable({
    
    DT::datatable(as.data.frame(table(dados[,input$variable])))
  })
  
})