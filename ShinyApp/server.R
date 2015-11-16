library(shiny)

# Define server logic required to draw a histogram
shinyServer(
  function(input, output)
  {
    mydata<-read.delim("data1.txt")
    
    # Subset Data #
    data.r=reactive(
      {
      a=subset(mydata, Type %in% input$gear_type)
      return(a)
      }
      )
    
  output$distPlot<-renderPlot(
    {      
      # Create Plot #
      ggplot(data.r(), env=environment())+
        geom_histogram(aes(x=Length), fill='grey50', col='black')+
        theme_bw(15)+ylab("Count")+xlab("Length (cm)")+
        ggtitle(input$gear_type)
    }
    )
  }
  )