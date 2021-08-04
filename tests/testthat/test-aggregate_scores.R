test_that("multiplication works", {
  test_data <- tibble::tribble(
    ~group, ~score, ~rank, ~decile, ~population,
    "A", 0.5, 1, 1, 100,
    "A", 1, 2, 10, 100
  )

  test_data_aggregated <-
    test_data |>
    aggregate_scores(score, rank, decile, group, population)

  expected_data <- tibble::tribble(
    ~group, ~Score, ~Proportion, ~Extent,
    "A", 0.75, 0.5, 1
  )

  expect_identical(test_data_aggregated, expected_data)
})
