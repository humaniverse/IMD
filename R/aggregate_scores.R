#' Aggregate deprivation scores 
#'
#' @description Aggregate deprivation scores into higher-level geographies,
#'     calculating:
#'     - proportion of highly deprived areas
#'     - extent (proportion of the local population that live in the most
#'       deprived areas)
#'     - population-weighted average score
#'
#' @param d Dataframe containing deciles, ranks, scores and population 
#'          estimates
#' @param domain Which domain to calculate population-weighted scores for
#' @param score_suffix The wording of the variable containing scores
#' @param rank_suffix The wording of the variable containing ranks
#' @param decile_suffix The wording of the variable containing deciles
#' @param higher_level_geography Name of the column to use for higher-level 
#'                               aggregation (e.g. "LAD19CD")
#' @param population_col Name of the column containing population estimates
#'
#' @return A tibble containing population-weighted average scores, 
#'     proportions of highly deprived areas, and the extent for
#'     the higher-level geography.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' aggregate_scores(imd_england, higher_level_geography = "LAD19CD")
#' }
aggregate_scores <- 
	function(d,
             domain = "Index of Multiple Deprivation (IMD)",
             score_suffix = " Score",
             rank_suffix = " Rank (where 1 is most deprived)",
             decile_suffix = " Decile (where 1 is most deprived 10% of LSOAs)",
             higher_level_geography,
             population_col = "No. people"
			) {

  decile_col <- paste0(domain, decile_suffix)

  # calculate proportions of highly deprived LSOAs in the higher-level geography
  d_props <-
	d |>
    # label LSOAs by whether they're in top 10% most-deprived then summarise by this label
    dplyr::mutate(Top10 = ifelse({{ decile_col }} <= 1, "Top10", "Other")) |>
    janitor::tabyl({{higher_level_geography}}, Top10) |>

    # calculate proportion of most deprived LSOAs
    dplyr::mutate(Proportion = Top10 / (Top10 + Other)) |>
    dplyr::select({{ higher_level_geography }}, Proportion)

  # calculate population-weighted scores and extent for the higher-level geography
  d_scores = d |>
    pop_weighted_scores(
		domain = domain,
        score_suffix = score_suffix, 
		rank_suffix = rank_suffix,
        higher_level_geography = higher_level_geography, 
		population_col = population_col
	) |>

    dplyr::group_by({{ higher_level_geography }}) |>
    dplyr::summarise(
		Extent = sum(Extent) / sum({{ population_col }}),
        Score = sum(Score) / sum({{ population_col }})
	)

  # Combine and return all aggregated measures
  dplyr::left_join(d_props, d_scores, by = higher_level_geography)
}
