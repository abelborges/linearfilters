List = function(maxlen = 0) {
  this = list()
  
  len = function() length(this)
  add = function(x, f = identity) this[[len() + 1]] <<- f(x)
  map = function(f) lapply(this, f)
  flush = function() this <<- list()
  has_room = function() len() < maxlen
  is_empty = function() len() < 1
  
  environment()
}
