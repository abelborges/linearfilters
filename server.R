function(input, output, session) {
  # state managers
  poles = List()
  zeros = List()
  
  # helpers
  picker_draw = function() {
    output$pzs = renderPlot({ picker_drawer(poles, zeros) })
    response_draw()
  }
  
  picker_reset = function() { poles$flush(); zeros$flush(); picker_draw() }
  
  response_draw = function()
    output$response = renderPlot({ response_drawer(poles, zeros) })
  
  # init
  picker_draw()
  
  # listeners
  observeEvent(c(input$npoles, input$nzeros), {
    picker_reset()
    poles$maxlen = input$npoles
    zeros$maxlen = input$nzeros
  })
  
  observeEvent(input$pzclick, {
    if (poles$has_room() || zeros$has_room()) {
      if (poles$has_room())
        poles$add(input$pzclick, function(pt) list(x = pt$x, y = pt$y))
      else
        zeros$add(input$pzclick, function(pt) list(x = pt$x, y = pt$y))
      picker_draw()
    }
  })
  
  observeEvent(input$reset, picker_reset())
}
