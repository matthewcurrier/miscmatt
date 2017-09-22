library(dplyr)
library(janitor)
library(tidyverse)

dfb <- read.csv("b_data_v2_0.csv", stringsAsFactors = F)

dfb <- clean_names(dfb)


# This works!
my_summarise <- function(df=df, spend=spend, impr=impr, clicks=clicks, ...) {
  spend <- enquo(spend)
  impr <- enquo(impr)
  clicks <- enquo(clicks)
  group_var <- quos(...)
  #group_var <- enquo(group_var)

  sp_q <- paste0("sum_", quo_name(spend))
  im_q <- paste0("sum_", quo_name(impr))
  cl_q <- paste0("sum_", quo_name(clicks))


  df %>%
    group_by(!!!group_var) %>%
    summarise(sp_q := sum(!!spend),
              im_q := sum(!!impr),
              cl_q := sum(!!clicks),
              cpm = sum((!!spend) / (sum(!!impr) / 1000)),
              cpc = sum(!!spend) / sum(!!clicks)
    ) %>%
    arrange(cpm)
}

dfb_summarized <- my_summarise(dfb, Media.Cost, Impressions, Clicks, Division, Device)


dfb_summarized_cross <- dfb %>% crosstab(division, ga_source)

dfb_summarized_cross <- dfb %>% crosstab(division, device)
