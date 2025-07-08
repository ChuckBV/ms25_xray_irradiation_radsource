# scr08_fig_for_pub.R

library(cowplot)
library(ggplot2)

# Open saved plot objects
load("surv_plots.RData")

# Plots--p1 is 0 and 300 Gy, p2 is males vs females
p_dose <- p1$plot
p_sex <- p2$plot

# use cowplot::plot_grid to get the plots side-by-side
combined_plot <- plot_grid(p_dose,p_sex, ncol = 2, labels = "auto")

# use ggsave to save as the desired jpg
ggsave("combined_plot.jpg", combined_plot, width = 8.3, height = 4.98,
       dpi = 300)
