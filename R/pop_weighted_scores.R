#' Population-weighted scores
#'
#' Calculate population-weighted scores within small areas.
#'
#' @param data Data frame containing a variable to be aggregated, lower level
#'        geography population estimates, and a higher level geographical
#'        grouping variable
#' @param var Name of the variable in the data frame containing the variable to
#'        be aggregated (e.g. rank) for the lower level geography
#' @param higher_level_geography Name of the variable in the data frame
#'        containing the higher level geography names/codes
#' @param population Name of the variable in the data frame containing
#'        the population estimates of the lower level geography
#'
#' @importFrom rlang .data
#'
#' @export
calculate_pop_weighted_score <-
  function(data, var, higher_level_geography, population) {
    data |>
      dplyr::mutate(Score = {{ var }} * {{ population }}) |>
      dplyr::group_by({{ higher_level_geography }}) |>
      dplyr::summarise(Score = sum(.data$Score) / sum({{ population }}))
  }
