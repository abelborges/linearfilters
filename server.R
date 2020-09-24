function(input, output, session) {
  # state managers
  poles = List()
  zeros = List()
  
  # helpers
  picker_draw = function() {
    output$pzs = renderPlot({ picker_drawer(poles, zeros) })
    output$response = renderPlot({ response_drawer(poles, zeros) })
  }
  
  picker_reset = function() { poles$flush(); zeros$flush(); picker_draw() }
  
  # init
  picker_draw()
  
  # listeners
  observeEvent(c(input$reset, input$npoles, input$nzeros), {
    picker_reset()
    poles$maxlen = input$npoles
    zeros$maxlen = input$nzeros
  })
  
  observeEvent(input$pzclick, {
    if (poles$has_room() || zeros$has_room()) {
      if (poles$has_room())
        poles$add(input$pzclick, to_xy)
      else
        zeros$add(input$pzclick, to_xy)
      picker_draw()
    }
  })
}
