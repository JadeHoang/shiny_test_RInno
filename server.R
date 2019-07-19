# Define a server for the Shiny app
function(input, output, session) {
  
  df <- reactiveValues(df_raw = data)
  
  
  observeEvent(input$add,{
    
    df$df_raw <- rbind(df$df_raw,
                       data.frame(N.Amer = sample(70000:80000,1),
                                  Europe = sample(30000:40000,1),
                                  Asia = sample(8000:9000,1),
                                  S.Amer = sample(3000:4000,1),
                                  Oceania = sample(3000:4000,1),  
                                  Africa = sample(2000:2100,1),  
                                  Mid.Amer = sample(1300:1900,1)))
    
    data <<- df$df_raw
    
    save(data,file="data.RData")
    
  })

  
  # Fill in the spot we created for a plot
  output$phone <- renderTable({
    
    df$df_raw
    
  })
  
  # Close the app when the session completes
  if(!interactive()) {
    session$onSessionEnded(function() {
      
      stopApp()
      q("no")
    })
  }
}
