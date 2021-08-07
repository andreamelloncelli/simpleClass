simpleR6Constructor <- function(envir) {
  cl <- match.call(definition = sys.function( -1L ),
                   call = sys.call( -2L ))
  name <- "simpleR6Constructor" # as.character(c[1])
  cl[1] <- call("list")
  obj <- eval(cl, envir = parent.frame(2L))
  class(obj) <- append(name, class(obj))
  obj

  for (name in names(obj)) {
    envir[[name]] <- obj[[name]]
  }
}
