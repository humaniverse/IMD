test_that("correct number of rows", {
  expect_equal(nrow(imd_wales_ward), 843)
})

test_that("Welsh wards", {
  expect_equal(unique(substr(imd_wales_ward$ward_code, 1, 1)), "W")
})
