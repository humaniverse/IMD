test_that("correct number of rows", {
  expect_equal(nrow(imd_england_ward_subdomains), 7180)
})

test_that("English wards", {
  expect_equal(unique(substr(imd_england_ward_subdomains$ward_code, 1, 1)), "E")
})
