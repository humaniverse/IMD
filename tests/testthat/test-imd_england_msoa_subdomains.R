test_that("correct number of rows", {
  expect_equal(nrow(imd_england_msoa_subdomains), 6791)
})

test_that("English MSOAs", {
  expect_equal(unique(substr(imd_england_msoa_subdomains$msoa_code, 1, 1)), "E")
})
