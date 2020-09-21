library(shiny)
library(shinydashboard)
source('List.R')
source('lib.R')

TAU = 2*pi
THETA = seq(0, pi, length = 200)
RADIUS = 0.03

picker_drawer = function(poles = NULL, zeros = NULL) {
  z = seq(-1, 1, length = 100)
  s = seq(0, 1, length = 100)
  plot(c(-1, 1), c(0, 1), 'n', xlab = '', ylab = '')
  lines(cos(THETA), sin(THETA)); lines(z, rep(0, 100))
  lines(rep(0, 100), s, lty = 2)
  
  if (length(poles) > 0 || length(zeros) > 0) {
    for (zero in zeros$this) circle(zero$x, zero$y, RADIUS)
    for (pole in poles$this) cross(pole$x, pole$y, RADIUS)
  }
}

response_drawer = function(poles = List(), zeros = List()) {
  poles = coalesce(unlist(poles$map(to_complex)), 0)
  zeros = coalesce(unlist(zeros$map(to_complex)), 0)
  f = function(w) transfer(w, poles, zeros)
  plot(THETA, sapply(THETA, f),
       type = 'l',
       xlab = expression(omega),
       ylab = expression(abs(H(omega))))
}
