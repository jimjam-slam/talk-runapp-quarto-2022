library(tidyverse)
library(here)

set.seed(1)
dir.create(here("data"), showWarnings = FALSE)

# generate some synthetic footy scores

expand_grid(
  team = c("Pies", "Blues", "Bombers", "Cats"),
  year = 1990:2005) %>%
  mutate(
    data = map(year, ~ tibble(
      game = 1:13,
      score = sample(60:120, 13, replace = TRUE)))) %>%
  unnest(data) %>%
  write_csv(here("data", "footy-scores.csv"))
