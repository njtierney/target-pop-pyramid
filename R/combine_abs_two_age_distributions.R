#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param lga_1
#' @param lga_2
#' @return
#' @author njtierney
#' @export
combine_abs_two_age_distributions <- function(lga_1 = "Hobart (C)", 
                                              lga_2 = "Alice Springs (T)") {

  bind_rows(
    lga_1 = abs_age_lga(lga_1),
    lga_2 = abs_age_lga(lga_2),
    .id = "thing"
  )
    

}
