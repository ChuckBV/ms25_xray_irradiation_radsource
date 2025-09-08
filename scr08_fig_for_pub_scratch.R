# scr08_fig_for_pub.R

library(cowplot)
library(ggplot2)

# Open saved plot objects
load("surv_plots.RData")

# Plots--p1 is 0 and 300 Gy, p2 is males vs females
p_dose <- p1$plot
p_sex <- p2$plot

# Change to black-and-white color scheme
  p_dose <- p1$plot + 
    scale_color_manual(values = c("black", "black")) +
    scale_linetype_manual(values = c("solid", "dashed")) +
    theme_bw()

# p_sex <- p2$plot +
#   scale_color_manual(values = c("black", "black")) +
#   scale_linetype_manual(values = c("solid", "dashed")) +
#   theme_bw()

# use cowplot::plot_grid to get the plots side-by-side
combined_plot_bw <- plot_grid(p_dose,p_sex, ncol = 2, labels = "auto")

# use ggsave to save as the desired jpg
ggsave("combined_plot_bw.jpg", combined_plot_bw, width = 8.3, height = 4.98,
       dpi = 300)
