# should work
# simpleClassBuilder <- function(name) {
#   # browser()
#   cl <- match.call(definition = sys.function( -1L ),
#                    call = sys.call( -1L ))
#   name <- as.character(c[1])
#   cl[1] <- NULL
#   # TODO: x, y are equals, so substitute map2 with base::Map
#   list_istr <- purrr::map2(names(cl), names(cl), .f = function(x,y) paste(x,y, sep = "=")) %>%
#     paste(., collapse = ",")
#   definition <- paste0("function(", paste(collapse=",",names(cl)), ")",
#                        "list(" ,list_istr, ")")
#   obj <- eval((definition))
#   class(obj) <- append(name, class(obj))
#   obj
# }
