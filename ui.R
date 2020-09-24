fluidPage(
  title = 'Linear filters explorer',
  
  sidebarLayout(
    sidebarPanel(
      width = 2,
      sliderInput(
        inputId = 'npoles', label = 'Number of poles:',
        min = 1, max = 5, value = 5, step = 1
      ),
      
      sliderInput(
        inputId = 'nzeros', label = 'Number of zeros:',
        min = 1, max = 5, value = 5, step = 1
      ),
      
      actionButton('reset', 'Reset')
    ),
    
    mainPanel(
      width = 10,
      column(
        width = 6,
        h2('Poles and zeros'),
        plotOutput('pzs', click = 'pzclick', height =  '500px')
      ),
      
      column(
        width = 6,
        h2('Amplitude response'),
        plotOutput('response')
      )
    )
  )
)
