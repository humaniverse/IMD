test_that("multiplication works", {
  test_data <- tibble::tribble(
    ~group, ~score, ~population,
    "A", 0.5, 100,
    "A", 0.5, 200
  )

  test_data_aggregated <-
    test_data |>
    calculate_pop_weighted_score(score, group, population)

  expect_equal(test_data_aggregated$Score, 0.5)
})
