dfHasSchema <- function(df, ...) {
  declaredSchema <- unlist(list(...))
  realSchema <- unlist(lapply(df, class))

  all(realSchema == declaredSchema)
}
