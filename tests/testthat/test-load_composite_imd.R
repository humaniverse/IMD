test_that("data loads", {
  imd_uk <- load_composite_imd()

  expect_equal(nrow(imd_uk), 42619)
})

test_that("error thrown", {
  expect_error(load_composite_imd("Z"), "Invalid nation: it must be one of 'E', 'W', 'S', 'N'")
})
