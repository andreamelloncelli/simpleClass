context("simpleClass")

expect_simpleClass <- function(sc) {
  expect_equal(names(sc), c("a", "b"))
  expect_equal(sc$a, 2)
  expect_equal(sc$b, 3)
  is(sc, "ClassA")
}

ClassA <- function(a, b) {
  simpleClass("ClassA")
}

test_that("get an instance", {

  aInstance <- ClassA(a = 2, 3)

  expect_simpleClass(aInstance)
})


test_that("get an instance of vars", {
  aa <- 2
  bb <- 3

  aInstance <- ClassA(a = aa, bb)

  expect_simpleClass(aInstance)
})

test_that("get an instance of a list", {
  ls <- list(
    aa = 2,
    bb = 3
  )

  aInstance <- ClassA(a = ls$aa, ls$bb)

  expect_simpleClass(aInstance)
})

test_that("get an instance with do.call", {

  aInstance2 <- do.call(ClassA, list(a = 2, 3))
  aInstance2

  expect_simpleClass(aInstance2)
})

# test_that("define a class with Map", {
#   aInstanceList <- Map(f = ClassA, list(list(a = 2, b = 3)))
#   aInstance2 <- aInstanceList[[1]]
#   expect_simpleClass(aInstance2)
#   aInstance2
# })

test_that("benchmark", {
  skip_if_not_installed("microbenchmark")

  ClassA_fake <- function(a, b) {
    obj <- list(
      a = a,
      b = b
    )
    class(obj) = c("ClassA","list")
    obj
  }

  microbenchmark::microbenchmark(
    ClassA(2, 3),
    ClassA_fake(2, 3),
    literal = {
      obj <- list(a = 2, b = 3)
      class(obj) = c("ClassA","list")
      obj
    },
    times = 1000
  )
})
