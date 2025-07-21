library(tidyverse)

df_timeline <- read.csv("data/timeline.csv") |> 
  filter(item != "packrat") |> 
  mutate(
    item = fct_relevel(item, "glue", "renv", "R",),
    date2 = parse_date(date, "%m/%d/%Y")
    ) 
  

df_timeline |> 
  ggplot(aes(y = item, x = date)) +
  geom_tile(aes(fill = details))
