test_that("correct number of rows", {
  expect_equal(nrow(imd_england_lad_subdomains), 317)
})

test_that("English LADs", {
  expect_equal(unique(substr(imd_england_lad_subdomains$lad_code, 1, 1)), "E")
})
