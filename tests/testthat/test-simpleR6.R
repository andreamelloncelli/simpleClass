test_that("simpleR6Constructor works with self", {

  Example <- R6::R6Class(
    classname = "Example",

    public = list(
      a = NULL,
      b = NULL,
      initialize = function(a, b) {
        simpleR6Constructor(self)
      }
    )
  )

  ex <- Example$new(a = 2, b = 3)
  ex

  expect_equal(ex$a, 2)
  expect_equal(ex$b, 3)
})

test_that("simpleR6Constructor works with private", {

  Example <- R6::R6Class(
    classname = "Example",

    public = list(
      initialize = function(a, b) {
        simpleR6Constructor(private)
      }
    ),

    private = list(
      a = NULL,
      b = NULL
    )
  )

  ex <- Example$new(a = 2, b = 3)
  ex

  expect_equal(ex$.__enclos_env__$private$a, 2)
  expect_equal(ex$.__enclos_env__$private$b, 3)
})
