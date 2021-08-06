test_that("correct number of rows", {
  expect_equal(nrow(imd_northern_ireland_lad), 11)
})

test_that("NI codes", {
  expect_equal(unique(substr(imd_northern_ireland_lad$lad_code, 1, 1)), "N")
})
