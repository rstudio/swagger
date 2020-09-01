test_that("match_version accepts only known versions", {
  expect_equal(match_version("3"), "3")

  expect_error(match_version(3))
  expect_error(match_version("32"))
  expect_error(match_version("23"))
  expect_error(match_version("2"))
})

test_that("swagger_path returns a file path", {
  expect_true(file.exists(swagger_path()))
  expect_true(file.exists(swagger_path("3")))
  expect_equal(swagger_path("3"), swagger_path())
})


test_that("swagger_index returns a file path", {
  expect_true(file.exists(swagger_index()))
  expect_true(file.exists(swagger_path("3")))
  expect_equal(swagger_index("3"), swagger_index())
})


test_that("swagger_spec alters the api location", {
  expect_true(
    grepl(
      "\"http://petstore.swagger.io/v2/swagger.json\"", fixed = TRUE,
      swagger_spec()
    )
  )
  expect_true(
    grepl(
      "'specialtestvalue'", fixed = TRUE,
      swagger_spec("'specialtestvalue'")
    )
  )
})
