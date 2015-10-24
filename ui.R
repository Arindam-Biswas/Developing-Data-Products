#load the required libraries
library(shiny)

shinyUI(
      pageWithSidebar(
            headerPanel('Pairwise K-Means clustering on mtcars Dataset'),
            sidebarPanel(
                  #select the input variables
                  selectInput('firstvar', 'Select 1st variable:', names(mtcars)),
                  selectInput('secondvar', 'Select 2nd variable:', names(mtcars),

                  selected=names(mtcars)[[2]]),
                  
                  #select the no of clusters
                  selectInput('clustercount', 'Select number of Clusters desired:', choices = c('2','3','4')),
            
                  strong(p('Documentation:')),
                  p("This is a basic App for Pairwise K-Means clustering on mtcars Dataset."),
                  p(" On the side panel you can select the pair of variables and also select the
                    number of desired clusters for the K-Means clustersing."),
                  strong(p('Steps to use this App:')),
                  p("- Select a pair of variables"),
                  p("- Select number of clusters required (from 2 to 4 clusters)"),
                  p("The variables available in the mtcars dataset are:"), 
                  p("mpg - Miles/(US) gallon, 
                   cyl - Number of cylinders, 
                   disp - Displacement (cu.in.),
                   hp - Gross horsepower,
                   drat - Rear axle ratio,
                   wt - Weight (lb/1000),
                   qsec - 1/4 mile time,
                   vs - V/S (V engine or straight engine),
                   am - Transmission (0 = automatic, 1 = manual),
                   gear - Number of forward gears,
                   carb - Number of carburetors "),
                  
                  p("Plot on the right side shows the pairwise K-Means clusters formed based on the 
                    selected pairs and desired number of clusters."),
                  p("The data points for the different clusters are shown as filled circles of colours for 
                    that cluster, while the various cluster centers are indicated by empty black circles."),
                  p("The lower right section shows the summary of Pairwise clusters formed."),
                  br()),
            
            mainPanel(
                 
                  #show the plot of the Clusters
                  plotOutput('Kmeans'),
                  
                  #show the cluster summary
                  h3("Summary of Pairwise clusters"),
                  verbatimTextOutput('summary')
            )
      )
)