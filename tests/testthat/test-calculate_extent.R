test_that("extent calculation works", {
  # Test data where half the population lives in the lowest ranks and half lives in the highest
  # so extent should be 0.5
  test_data <- tibble::tibble(
    group = "A",
    rank = 1:100,
    population = c(rep(10, 10), rep(0, 80), rep(10, 10))
  )

  test_data_aggregated <-
    test_data |>
    calculate_extent(var = rank, higher_level_geography = group, population = population)

  expect_equal(test_data_aggregated$Extent, 0.5)
})
