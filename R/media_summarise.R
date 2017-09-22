# This works!
media_summarise <- function(df=df, spend=spend, impr=impr, clicks=clicks, ...) {
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
