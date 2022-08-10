## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

## tar_plan supports drake-style targets and also tar_target()
tar_plan(
  
  abs_age_dists_syd_alice = combine_abs_two_age_distributions(
    lga_1 = "Sydney (C)",
    lga_2 = "Alice Springs (T)"
  ), 
  abs_age_dists_syd_melb = combine_abs_two_age_distributions(
    lga_1 = "Sydney (C)",
    lga_2 = "Melbourne (C)"
  ), 
  abs_age_dists_cairns_hobart = combine_abs_two_age_distributions(
    lga_1 = "Cairns (R)",
    lga_2 = "Hobart (C)"
  ), 
  gg_abs_age_dists_syd_alice = plot_two_abs_distributions(
    abs_age_dists_syd_alice
    ),
  gg_abs_age_dists_syd_melb = plot_two_abs_distributions(
    abs_age_dists_syd_melb
    ),
  gg_abs_age_dists_cairns_hobart = plot_two_abs_distributions(
    abs_age_dists_cairns_hobart
    ),
  tar_render(grant_sims, "doc/grant-sims.Rmd")
  
)