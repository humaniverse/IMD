test_that("correct number of rows", {
  expect_equal(nrow(imd_scotland_dz), 6976)
})

test_that("Scottish DZ codes", {
  expect_equal(unique(substr(imd_scotland_dz$dz_code, 1, 1)), "S")
})
