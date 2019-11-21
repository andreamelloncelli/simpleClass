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

test_that("define a class", {

  aInstance <- ClassA(a = 2, 3)
  aInstance

  expect_simpleClass(aInstance)
})

test_that("define a class with do.call", {

  aInstance2 <- do.call(ClassA, list(a = 2, 3))
  aInstance2

  expect_simpleClass(aInstance2)
})

# test_that("define a class with Map", {
#   aInstanceList <- Map(f = ClassA, list(class1 = list(a = 2, b = 3)))
#   aInstance2 <- aInstanceList[[1]]
#   expect_simpleClass(aInstance2)
#   aInstance2
# })
