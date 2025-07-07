# scratch.R

# Test a vignette provided by MS-Copilot

library(survival)
library(survminer)
library(cowplot)

# Example data
head(lung)
lung <- survival::lung

# Fit models
fit1 <- survfit(Surv(time, status) ~ sex, data = lung)
fit2 <- survfit(Surv(time, status) ~ ph.ecog, data = lung)

# Create survival plots
plot1 <- ggsurvplot(fit1, data = lung, risk.table = FALSE)
plot2 <- ggsurvplot(fit2, data = lung, risk.table = FALSE)

# Combine only the survival curves (not risk tables)
combined_plot <- plot_grid(plot1$plot, plot2$plot, labels = c("A", "B"))

# Save the combined plot
ggsave("combined_survival_plot.png", plot = combined_plot, width = 10, height = 5, dpi = 300)


# ggsave("full_combined_plot.jpg", plot = print(combined_plot), width = 8, 
#        height = 6, dpi = 300,
#        path = "c:/Users/Charles.Burks/Desktop/")
