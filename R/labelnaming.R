#' @title Region volumes
#' @description Calculates volumes for all regions.
#' @details Input one or more NIfTI-files and a label name tibble. Returns total
#' volumes, with label names, for all regions in the supplied NIfTI-file(s). A
#' label name tibble must have correct format and unique columns. First column
#' of the label name tibble must contain an integer label number and second
#' column must contain a label name string. Label numbers and label names must
#' be unique. Only regions which are in the label name tibble will be included
#' in the result.
#' @param filename One or more NIfTI-files
#' @param labelnametibble A label name tibble
#' @return Total volumes with label names, taken from the supplied label name
#' tibble, for all regions in the supplied NIfTI-file(s).
#' @export

labelnaming <- function(filename, labelnametibble) {
  labelnametibble <- check_label(labelnametibble)
  voldf <- filename %>%
    purrr::map_dfr(regcount) %>%
    dplyr::right_join(labelnametibble, by = "label_id") %>%
    dplyr::select(filename, label_id, label_name, vol_mm3) %>%
    tidyr::pivot_wider(names_from = "filename", values_from = "vol_mm3")
  return(voldf)
}
