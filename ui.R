# Use a fluid Bootstrap layout
fluidPage(
  
  tags$head(
    tags$link(
      rel = "icon",
      type = "image/x-icon",
      href = "http://localhost:1984/default.ico")
  ),
  
  # Give the page a title
  titlePanel("Telephones by region"),
  
  # Generate a row with a sidebar
  sidebarLayout(
    
    # Define the sidebar with one input
    sidebarPanel(
      
      helpText("Data from AT&T (1961) The World's Telephones."),
      
      actionButton("add","ADD"),
      
      hr()
    ),
    
    mainPanel(
      tableOutput("phone")
    )
    
  )
)
