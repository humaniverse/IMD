test_that("proportion calculation works", {
  test_data <- tibble::tribble(
    ~group, ~decile,
    "A", 1,
    "A", 2
  )

  test_data_aggregated <-
    test_data |>
    calculate_proportion(var = decile, higher_level_geography = group)

  expect_equal(test_data_aggregated$Proportion, 0.5)
})
