simpleClass <- function(name) {
  # browser()
  cl <- match.call(definition = sys.function( -1L ),
                  call = sys.call( -1L ))
  # name <- as.character(c[1])
  cl[1] <- call("list")
  obj <- eval(cl, envir = parent.frame(2L))
  class(obj) <- append(name, class(obj))
  obj
}

# simpleNamedClass <- function() {
#   # browser()
#   c <- match.call(definition = sys.function( -1 ),
#                   call = sys.call( -1 ))
#   type <- as.character(c[1])
#   c[1] <- call("list")
#   obj <- eval(c, envir = parent.frame(2L))
#   class(obj) <- append(type, class(obj))
#   obj
# }
