test_that("correct number of rows", {
  expect_equal(nrow(imd_england_lsoa_subdomains), 32844)
})

test_that("English LSOAs", {
  expect_equal(unique(substr(imd_england_lsoa_subdomains$lsoa_code, 1, 1)), "E")
})
