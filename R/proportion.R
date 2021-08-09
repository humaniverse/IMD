#' Proportion
#'
#' Calculate proportion of small areas in the higher-level geography that are
#' within the 10% most deprived areas in the nation.
#'
#' @param data Data frame containing a variable to be aggregated, lower level
#'        geography population estimates, and a higher level geographical
#'        grouping variable
#' @param var Name of the variable in the data frame containing the variable to
#'        be aggregated (e.g. decile) for the lower level geography
#' @param higher_level_geography Name of the variable in the data frame
#'        containing the higher level geography names/codes
#' @param max_quantile Get proportion of small areas categorised as less than
#'        or equal to `max_quantile` (default = 1)
#'
#' @importFrom rlang .data
calculate_proportion <-
  function(data,
           var,
           higher_level_geography,
           max_quantile = 1) {
    data |>
      # Label LSOAs by whether they're in top 10% most-deprived then summarise by this label
      dplyr::mutate(Top10 = ifelse({{ var }} <= max_quantile, "Top10", "Other")) |>
      janitor::tabyl({{higher_level_geography}}, .data$Top10) |>

      # Calculate proportion of most deprived LSOAs
      dplyr::mutate(Proportion = .data$Top10 / (.data$Top10 + .data$Other)) |>
      dplyr::select({{ higher_level_geography }}, .data$Proportion) |>
      tibble::as_tibble()
  }
