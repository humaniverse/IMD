#' Aggregate deprivation scores
#'
#' @description Aggregate deprivation scores into higher-level geographies,
#'     calculating:
#'     - proportion of highly deprived areas
#'     - extent (proportion of the local population that live in the most
#'       deprived areas)
#'     - population-weighted average score
#'
#' @param data Data frame containing a variable to be aggregated, lower level
#'        geography population estimates, and a higher level geographical
#'        grouping variable
#' @param score_col Variable containing deprivation scores
#' @param rank_col Variable containing deprivation ranks
#' @param decile_col Variable containing deprivation deciles
#' @param higher_level_geography Name of the variable in the data frame
#'        containing the higher level geography names/codes
#' @param population Name of the variable in the data frame containing
#'        the population estimates of the lower level geography
#'
#' @return A tibble containing population-weighted average scores,
#'     proportions of highly deprived areas, and the extent for
#'     the higher-level geography.
aggregate_scores <-
	function(data,
	         score_col,
	         rank_col,
	         decile_col,
	         higher_level_geography,
           population
			) {

	  # data <-
	  #   eimd |>
	  #   select(lsoa_code, higher_level_geography = msoa_code, decile_col = IMD_decile, rank_col = IMD_rank, score_col = IMD_score, population)

	  data_proportion <-
	    data |>
	    calculate_proportion({{ decile_col }}, {{ higher_level_geography }})

	  data_extent <-
	    data |>
	    calculate_extent({{ rank_col }}, {{ higher_level_geography }}, {{ population }})

	  data_score <-
	    data |>
	    calculate_pop_weighted_score({{ score_col }}, {{ higher_level_geography }}, {{ population }})

	  # Combine and return all aggregated measures
	  data_score |>
	    dplyr::left_join(
	      data_proportion
	      # by = {{ higher_level_geography }}
	    ) |>

	    dplyr::left_join(
	      data_extent
	      # by = {{ higher_level_geography }}
	    )
	}
