#' @title Check labelnametibble with R, G, B columns
#' @description Checks the format of the label name tibble.
#' @details Checks if label number is an integer and if there are any duplicate
#' label numbers or label names in the tibble. Checks if the tibble includes R,
#' G, B columns.
#' @param labelnametibble A label name tibble
#' @return An error message or a label name tibble.
#' @export
check_label_RGB <- function(labelnametibble) {
  if (prod(c("label_id", "label_name", "R", "G", "B") %in% names(labelnametibble)) == 1) {
    if (is.integer(labelnametibble$label_id) == FALSE) {
      stop("Please convert label number to integer.")
    } else {
      if (sum(duplicated(labelnametibble$label_id)) + sum(duplicated(labelnametibble$label_name)) > 0) {
        stop("There are duplicated label numbers or label names in the label name tibble.")
      } else {
        labelnametibble
      }
    }
  } else {
    stop("label_id, label_name, R, G or B colum do not exit in the labelnametibble.")
  }
}
