library(shiny)
library(ggplot2)
library(RColorBrewer)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(
  function(input, output)
  {
    mydata<-read.delim("data1.txt")
    
    # Subset Data #
    data.r=reactive(
      {
      a=data.frame(data.r%>%filter(Type %in% input$my_sample_type))
      return(a)
      }
      )
  
      output$distPlot<-renderPlot(
      {
        myFills<-brewer.pal(4,"Set1")
        names(myFills)<-levels(mydata$Type)
        FillScale<-scale_fill_manual(name="Sample Type",values=myFills)
        
      # Create Plot #
      ggplot(data.r(), env=environment())+
        geom_histogram(aes(x=Length, fill=Type2), col='black')+
        theme_bw(15)+ylab("Count")+xlab("Length (cm)")+
        ggtitle(input$my_sample_type)+
        ylim(0,3)+
        xlim(min(mydata$Length, na.rm=TRUE), max(mydata$Length, na.rm=TRUE))        
      }
      )
  }
  )