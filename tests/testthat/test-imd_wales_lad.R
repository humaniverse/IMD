test_that("correct number of rows", {
  expect_equal(nrow(imd_wales_lad), 22)
})

test_that("Welsh LADs", {
  expect_equal(unique(substr(imd_wales_lad$lad_code, 1, 1)), "W")
})
