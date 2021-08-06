test_that("correct number of rows", {
  expect_equal(nrow(imd_scotland_iz), 1279)
})

test_that("Scottish IZ codes", {
  expect_equal(unique(substr(imd_scotland_iz$iz_code, 1, 1)), "S")
})
