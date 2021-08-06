#' Load composite 2020 UK Index of Multiple Deprivation
#'
#' Load data from mySociety's composite 2020 UK Index of Multiple Deprivation:
#' https://github.com/mysociety/composite_uk_imd.
#'
#' @param nation The initial letter of the UK nation whose composite IMD you
#'               want to load. Should be one of: (E)ngland, (W)ales, (S)cotland
#'               (N)orthern Ireland. See the GitHub link about for more details
#'               about why there are separate composite IMDs for each nation.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' imd_uk <- load_composite_imd("E")
#' }
load_composite_imd <-
  function(nation = "E") {
    nation <- tolower(nation)

    if (!nation %in% c("e", "w", "s", "n"))
      stop("Invalid nation: it must be one of 'E', 'W', 'S', 'N'")

    devtools::load_all()

    query_url <-
      query_urls |>
      dplyr::filter(data_set == paste0("imd_uk_", nation)) |>
      dplyr::pull(query_url)

    data <-
      readr::read_csv(query_url)

    return(data)
  }
