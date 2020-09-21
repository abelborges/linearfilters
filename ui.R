dashboardPage(
  
  dashboardHeader(title = 'Linear filters explorer'),
  
  dashboardSidebar(
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
  
  dashboardBody(
    box(
      width = 6,
      height = '600px',
      title = 'Poles and zeros',
      plotOutput('pzs', click = 'pzclick', height =  '500px')
    ),
    
    box(
      width = 6,
      height = '600px',
      title = 'Amplitude response',
      plotOutput('response')
    )
  )
  
)
