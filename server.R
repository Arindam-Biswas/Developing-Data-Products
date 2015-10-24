library(shiny)

#define the colors for clusters
palette(c('red', 'green', 'blue', 'yellow', 'pink', 'orange'))

shinyServer(function(input, output, session) {
  
      #create a new data frame from selected variables
      inputvars <- reactive({
            mtcars[, c(input$firstvar, input$secondvar)]
      })
        
      #identify the clusters based on selected variables
      clusters <- reactive({
            kmeans(inputvars(), input$clustercount)
      })
      
      #create a output variable from the cluster plot   
      output$Kmeans <- renderPlot({
            par(mar = c(4, 4, 2, 0.5))
            plot(inputvars(),
            col = clusters()$cluster,
            pch = 20, cex = 3)
            title(main= "Pairwise K-Means clusters",xlab=input$firstvar,ylab=input$secondvar, font.lab=2)
            points(clusters()$centers, pch = 21, cex = 2, lwd = 2)
      })
        
      output$summary <- renderPrint({
            dataset <- clusters()
            dataset
      })
})