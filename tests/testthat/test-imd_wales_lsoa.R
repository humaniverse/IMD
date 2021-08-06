test_that("correct number of rows", {
  expect_equal(nrow(imd_wales_lsoa), 1909)
})

test_that("Welsh LSOAs", {
  expect_equal(unique(substr(imd_wales_lsoa$lsoa_code, 1, 1)), "W")
})
