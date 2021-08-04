#' Calculate population-weighted scores and extent
#'
#' @description Calculate the Extent and population-weighted average scores for
#'     higher-level geographies
#'
#' "Extent" is the proportion of the local population that live in areas
#' classified as among the most deprived in the higher geography. To calculate
#' this, we need to first calculate a weighted score based on the population in
#' the most deprived 30% of areas
#'
#' @param d Dataframe containing ranks, scores and population estimates
#' @param domain Which domain to calculate population-weighted scores for
#' @param score_suffix The wording of the variable containing scores
#' @param rank_suffix The wording of the variable containing ranks
#' @param decile_suffix The wording of the variable containing deciles
#' @param higher_level_geography Name of the variable containing the
#'   higher-level geography names/codes
#' @param population_col Name of the column containing population estimates
#'
# pop_weighted_scores <-
# 	function(d,
# 	         domain = "Index of Multiple Deprivation (IMD)",
# 	         score_suffix = " Score",
# 	         rank_suffix = " Rank (where 1 is most deprived)",
# 	         decile_suffix = " Decile (where 1 is most deprived 10% of LSOAs)",
# 	         higher_level_geography,
# 	         population_col = "No. people"
# 	         ) {
#
#   rank_col <- paste0(domain, rank_suffix)
#   score_col <- paste0(domain, score_suffix)
#
#   d |>
#     dplyr::mutate(Percentile = ntile({{ rank_col }}, 100)) |>
#
#     # Calculate extent: a weighted score based on the population in the most deprived 30% of areas
#     # from the IMD technical report Appendix N:
#     # "The population living in the most deprived 11 to 30 per cent of Lower-layer Super Output Areas
#     # receive a sliding weight, ranging from 0.95 for those in the most deprived eleventh percentile,
#     # to 0.05 for those in the most deprived thirtieth percentile.
#     # In practice this means that the weight starts from 0.95 in the most deprived eleventh percentile,
#     # and then decreases by (0.95-0.05)/19 for each of the subsequent nineteen percentiles
#   	# until it reaches 0.05 for the most deprived thirtieth percentile, and zero for areas outside the most deprived 30 per cent"
#   	dplyr::mutate(Extent = dplyr::case_when(
#   		Percentile <= 10 ~ {{ population_col }},
#   		Percentile == 11 ~ {{ population_col }} * 0.95,
#   		Percentile > 11 & Percentile <= 30 ~ {{ population_col }} * (0.95 - ((0.9/19) * (Percentile - 11))),
#   		TRUE ~ 0
#   	)) |>
#
#     # Calculate population-weighted average scores
#     dplyr::mutate(Score = {{ score_col }} * {{ population_col }}) |>
#
#     dplyr::ungroup()
# }

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
#' @export
#'
#' @examples
#' \dontrun{
#' calculate_pop_weighted_score(imd_england_lsoa, IMD_score, pop_count)
#' }
calculate_pop_weighted_score <-
  function(data,
           var,
           higher_level_geography,
           population) {

    data |>
      dplyr::mutate(Score = {{ var }} * {{ population }}) |>
      dplyr::group_by({{ higher_level_geography }}) |>
      dplyr::summarise(Score = sum(Score) / sum({{ population }}))
  }
