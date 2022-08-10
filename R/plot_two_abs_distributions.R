#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param abs_age_dists
#' @return
#' @author njtierney
#' @export
plot_two_abs_distributions <- function(abs_age_dists) {
  data_age_transform <- abs_age_dists %>%
    group_by(lga) %>%
    mutate(
      age_multiplier = cur_group_id(),
      age_multiplier = if_else(age_multiplier == 2,
                               1,
                               -1),
      .after = lga
    ) %>%
    mutate(population_per_capita = population / sum(population)) %>% 
    ungroup() %>%
    mutate(age = as_factor(lower.age.limit),
           population = (population * age_multiplier),
           population_per_capita = (population_per_capita * age_multiplier))
  
  # round to nearest 10
  
  pop_range <- range(data_age_transform$population_per_capita)
  
  age_range_seq <- pretty_symmetric(pop_range, n = 5)
  
  ggplot(data_age_transform,
         aes(x = population_per_capita,
             y = age,
             fill = lga)) +
    geom_col() +
    scale_x_continuous(breaks  = age_range_seq,
                       labels = abs(age_range_seq)) +
    expand_limits(x = range(age_range_seq)) + 
    scale_fill_brewer(palette = "Dark1",
                      guide = guide_legend(
                        title = ""
                      )) +
    theme_minimal() +
    theme(legend.position = "top")
  
}
