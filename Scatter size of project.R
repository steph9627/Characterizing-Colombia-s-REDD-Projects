# Clear workspace
rm(list = ls())

library(tidyverse)
library(ggplot2)
library(dplyr)

# Set working directory
setwd("C:/Users/steph/Desktop/Stuff/Thesis related/")

# Load data
datos <- read_csv("tabla proyectos redd de mi tesis 2024.csv")

# Filter out outliers
datos_filtered <- datos %>% filter(Area_Ha < 3000000)

# Create scatter plot
scatterpl <- ggplot(datos_filtered, aes(x = `Start date`, y = Area_Ha / 1000, color = factor(single))) +
  geom_point() +
  labs(
    x = "Year",
    y = "Area (thousand ha)",
    color = "Type of project"
  ) +
  scale_color_manual(
    values = c("0" = "cadetblue", "1" = "#fb8072"),
    labels = c("0" = "Grouped", "1" = "Single Polygon")
  ) +
  scale_x_continuous(
    breaks = pretty(datos_filtered$`Start date`),
    labels = as.integer
  ) +
  theme_minimal() +
  theme(
    axis.text = element_text(size = 16),
    axis.title = element_text(size = 16, face = "bold"),
    legend.text = element_text(size = 16),
    legend.title = element_text(size = 17, face = "bold"),
    plot.title = element_text(size = 18, face = "bold")
  )

# Create scatter + boxplot
scatterboxpl <- ggplot(datos_filtered, aes(x = factor(`Start date`), y = Area_Ha / 1000)) +
  geom_boxplot(color = "gray31", fill = NA, outlier.shape = NA) +
  geom_jitter(
    aes(color = factor(single), shape = factor(single)),
    width = 0.2, size = 3, alpha = 1
  ) +
  labs(
    x = "Start date",
    y = "Area (thousand ha)",
    color = "Type of project",
    shape = "Type of project"
  ) +
  scale_color_manual(
    values = c("0" = "cyan3", "1" = "indianred2"),
    labels = c("0" = "Multi-site", "1" = "Single Polygon")
  ) +
  scale_shape_manual(
    values = c("0" = 17, "1" = 16),  # 17 = triangle, 16 = circle
    labels = c("0" = "Multi-site", "1" = "Single Polygon")
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 0, vjust = 0.5, hjust = 0.5, size = 16),
    axis.text.y = element_text(size = 16),
    axis.title = element_text(size = 16, face = "bold"),
    legend.text = element_text(size = 16),
    legend.title = element_text(size = 17, face = "bold"),
    plot.title = element_text(size = 18, face = "bold")
  )

# === Set output directory and filenames ===
output_dir <- file.path(getwd(), "Thesis graphs R", "Graphs")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)  # make sure directory exists

output_file1 <- file.path(output_dir, "scatter_project_size.jpg")
output_file2 <- file.path(output_dir, "scatterboxpl_project_size.jpg")

# === Save scatter plot ===
jpeg(output_file1, width = 14, height = 8, units = "in", res = 300)
print(scatterpl)
dev.off()

# === Save scatter + boxplot ===
jpeg(output_file2, width = 14, height = 8, units = "in", res = 300)
print(scatterboxpl)
dev.off()

# Confirm
cat("✅ Plots saved:\n•", output_file1, "\n•", output_file2, "\n")

