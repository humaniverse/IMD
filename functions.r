##
## Functions to calculate deprivation at higher geographies
##
library(tidyverse)
library(Hmisc)

# ---- Functions for aggregating IMD into higher level geographies ----
#' Invert deciles, ranks, percentiles etc.
#' e.g. with decile, a score of 10 --> 1 and score of 1 --> 10
#' @param x Vector of data to invert
invert_this = function(x) (max(x, na.rm = TRUE) + 1) - x

#' Calculate the Extent and population-weighted average scores for small areas
#' 
#' "Extent" is the proportion of the local population that live in areas classified as among the most deprived in the higher geography.
#' To calculate this, we need to first calculate a weighted score based on the population in the most deprived 30% of areas
#' 
#' @param d Dataframe containing ranks, scores and population estimates
#' @param domain Which domain to calculate population-weighted scores for
#' @param score_suffix The wording of the variable containing scores
#' @param rank_suffix The wording of the variable containing ranks
#' @param decile_suffix The wording of the variable containing deciles
#' @param aggregate_by Name of the variable containing the higher-level geography names/codes
#' @param population_col Name of the column containing population estimates
#' 
pop_weighted_scores = function(d, 
                               domain = "Index of Multiple Deprivation (IMD)", 
                               score_suffix = " Score",
                               rank_suffix = " Rank (where 1 is most deprived)",
                               decile_suffix = " Decile (where 1 is most deprived 10% of LSOAs)",
                               aggregate_by, 
                               population_col = "No. people") {
  
  rank_col = paste0(domain, rank_suffix)
  score_col = paste0(domain, score_suffix)
  
  d %>% 
    # group_by(!!sym(aggregate_by)) %>%
    
    # mutate(Percentile = round((!!sym(rank_col) / max(!!sym(rank_col))) * 100, 0)) %>% 
    mutate(Percentile = ntile(IMD_rank, 100)) %>% 
    
    # invert percentiles because, in the Vulnerability Index, higher percentiles mean higher vulnerability - but the extent score calculation below assumes lower percentiles mean higher vulnerability
    # mutate(Percentile = invert_this(Percentile)) %>%
    
    # calculate extent: a weighted score based on the population in the most deprived 30% of areas
    # from the IMD technical report Appendix N:
    # "The population living in the most deprived 11 to 30 per cent of Lower-layer Super Output Areas 
    # receive a sliding weight, ranging from 0.95 for those in the most deprived eleventh percentile, 
    # to 0.05 for those in the most deprived thirtieth percentile. 
    # In practice this means that the weight starts from 0.95 in the most deprived eleventh percentile, 
    # and then decreases by (0.95-0.05)/19 for each of the subsequent nineteen percentiles 
  # until it reaches 0.05 for the most deprived thirtieth percentile, and zero for areas outside the most deprived 30 per cent"
  mutate(Extent = case_when(
    Percentile <= 10 ~ `No. people`,
    Percentile == 11 ~ `No. people` * 0.95,
    Percentile > 11 & Percentile <= 30 ~ `No. people` * (0.95 - ((0.9/19) * (Percentile - 11))),
    TRUE ~ 0
  )) %>% 
    
    # calculate population-weighted average scores
    mutate(Score = !!sym(score_col) * !!sym(population_col)) %>% 
    
    ungroup()
}

#' Aggregate IMD into higher-level geographies, calculating:
#' - proportion of highly deprived areas
#' - extent (proportion of the local population that live the most deprived areas)
#' - population-weighted average score
#'
#' @param d Dataframe containing deciles, ranks, scores and population estimates
#' @param domain Which domain to calculate population-weighted scores for
#' @param score_suffix The wording of the variable containing scores
#' @param rank_suffix The wording of the variable containing ranks
#' @param decile_suffix The wording of the variable containing deciles
#' @param aggregate_by Name of the column to use for higher-level aggregation (e.g. "LAD19CD")
#' @param population_col Name of the column containing population estimates
#'
aggregate_scores = function(d, 
                            domain = "Index of Multiple Deprivation (IMD)", 
                            score_suffix = " Score",
                            rank_suffix = " Rank (where 1 is most deprived)",
                            decile_suffix = " Decile (where 1 is most deprived 10% of LSOAs)",
                            aggregate_by, 
                            population_col = "No. people") {
  
  decile_col = paste0(domain, decile_suffix)
  
  # calculate proportions of highly deprived MSOAs in the higher-level geography
  d_props = d %>% 
    # label MSOAs by whether they're in top 10% most-deprived then summarise by this label
    mutate(Top10 = ifelse(!!sym(decile_col) <= 1, "Top10", "Other")) %>% 
    janitor::tabyl(!!sym(aggregate_by), Top10) %>% 
    
    # calculate proportion of most deprived LSOAs
    mutate(Proportion = Top10 / (Top10 + Other)) %>% 
    select(!!sym(aggregate_by), Proportion)
  
  # calculate population-weighted scores and extent for the higher-level geography
  d_scores = d %>% 
    pop_weighted_scores(domain = domain, 
                        score_suffix = score_suffix, rank_suffix = rank_suffix, 
                        aggregate_by = aggregate_by, population_col = population_col) %>% 
    
    group_by(!!sym(aggregate_by)) %>%
    summarise(Extent = sum(Extent) / sum(!!sym(population_col)),
              Score = sum(Score) / sum(!!sym(population_col)))
  
  # combine and return all aggregated measures
  left_join(d_props, d_scores, by = aggregate_by)
}
