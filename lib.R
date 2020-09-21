coalesce = function(...) {
  for (x in list(...)) { if (!is.null(x)) return(x) }
  return(NULL)
}

# math
to_degrees = function(radians) sprintf('%.2fº', 360 * radians/TAU)

to_complex = function(pt) complex(real = pt$x, imaginary = pt$y)

ej = function(w) complex(imaginary = w)

transfer = function(w, poles = 0, zeros = 0, amplitude = T, gain = 1) {
  response = gain * prod(ej(w) - zeros) / prod(ej(w) - poles)
  if (amplitude) response = Mod(response)
  response
}

# plotting
cross = function(x, y, r = RADIUS) {
  a1 = y - x
  a2 = y + x
  half = r * sqrt(2) / 2
  xs = seq(x - half, x + half, length = 100)
  lines(xs, xs + a1)
  lines(xs, a2 - xs)
}

circle = function(x, y, r = RADIUS) {
  symbols(x, y, circles = RADIUS, inches = F, add = T)
}
