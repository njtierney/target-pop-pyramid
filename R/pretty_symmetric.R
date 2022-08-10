#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param range
#' @param n
#' @return
#' @author njtierney
#' @export
pretty_symmetric <- function(range, n = 5){
  range_1 <- c(-range[1], range[2])
  range_2 <- c(range[1], -range[2])
  
  pretty_vec_1 <- pretty(range_1)
  pretty_vec_2 <- pretty(range_2)
  
  pretty(
    c(pretty_vec_1, pretty_vec_2), 
    n = n
  )
  
}
