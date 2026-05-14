# xray_ms_fig2.R

library(dplyr)
library(ggplot2)

# Create red egg data frame

df <- tibble(
  sex = c(rep("Female",4),rep("Male",4)),
  dose = rep(c(100,200,300,400),2),
  survivorship = c(78,14,10,3,100,73,43,28)
)
df
# # A tibble: 8 × 3
#   sex     dose survivorship
#   <chr>  <dbl>        <dbl>
# 1 Female   100           78
# 2 Female   200           14
# 3 Female   300           10
# 4 Female   400            3
# 5 Male     100          100
# 6 Male     200           73
# 7 Male     300           43
# 8 Male     400           28

p1 <- ggplot(df, aes(x = dose, y = survivorship, color = sex, linetype = sex, shape = sex)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  scale_linetype_manual(values = c("Female" = "dashed", "Male" = "solid")) +
  scale_color_manual(values = c("Female" = "black", "Male" = "black")) +
  scale_x_continuous(limits = c(0, 400)) +
  labs(color = "Sex irradiated", 
       linetype = "Sex irradiated", 
       shape = "Sex irradiated",
       x = "Dose (Gy)",
       y = "Development to red stage")

p1

p1 <- p1 +
  theme_bw() +
  theme(axis.text.x = element_text(color = "black", size = 10), 
        axis.text.y = element_text(color = "black", size = 10),
        axis.title.x = element_text(color = "black", size = 10),
        axis.title.y = element_text(color = "black", size = 10),
        legend.title = element_text(color = "black", size = 10),
        legend.text = element_text(color = "black", size = 10))

p1

ggsave(filename = "dose_response_red.tif", 
       plot = p1,
       device = "tiff",
       width = 5.83, height = 2.83, dpi = 300)
