test_that("correct number of rows", {
  expect_equal(nrow(imd_wales_msoa), 410)
})

test_that("Welsh MSOAs", {
  expect_equal(unique(substr(imd_wales_msoa$msoa_code, 1, 1)), "W")
})
