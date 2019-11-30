context("simpleDF")

# simpleDF()
# may be it should be as data.frame or tibble, but with fixed arguments


test_that("return the same if schema is correct", {
  schemaIsRight <- dfHasSchema(iris,
                               Sepal.Length = "numeric",
                               Sepal.Width = "numeric",
                               Petal.Length = "numeric",
                               Petal.Width = "numeric",
                               Species = "factor")
  expect_true(schemaIsRight)
})
