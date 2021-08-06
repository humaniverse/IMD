test_that("correct number of rows", {
  expect_equal(nrow(imd_scotland_lad), 32)
})

test_that("Scottish LAD codes", {
  expect_equal(unique(substr(imd_scotland_lad$lad_code, 1, 1)), "S")
})
