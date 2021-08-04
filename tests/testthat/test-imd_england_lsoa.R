test_that("correct number of rows", {
  expect_equal(nrow(imd_england_lsoa), 32844)
})

test_that("English LSOAs", {
  expect_equal(unique(substr(imd_england_lsoa$lsoa_code, 1, 1)), "E")
})
