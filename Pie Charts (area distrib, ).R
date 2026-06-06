# Clear workspace
rm(list = ls())

# Define desktop path
desktop_path <- "C:/Users/steph/Desktop/Thesis related/Thesis graphs R/Graphs"

# Load data
datos <- data.frame(
  SizeCategory = c(
    "<50,000 ha", 
    "[50,000 ha -\n <100,000 ha)", 
    "[100,000 ha -\n <250,000 ha)", 
    "[250,000 ha -\n <500,000 ha)", 
    "[500,000 ha -\n <1'000,000 ha)", 
    "[1'000,000 ha -\n <2'500,000 ha)", 
    ">2'500,000 ha"
  ),
  Projects = c(12, 9, 12, 4, 5, 5, 1)
)

# Proportions and labels
datos$Percentage <- round((datos$Projects / sum(datos$Projects)) * 100, 1)
labels <- paste0(datos$Percentage, "%")

# Custom color palette
custom_palette <- c(
  "lightskyblue3",  # <50,000 ha
  "#8dd3c7",  # <100,000 ha
  "#fdb462",  # <250,000 ha
  "#fb8072",   # <500,000 ha
  "#ffffb3",   # <1'000,000 ha
  "#bebada",  # <2'500,000 ha
  "#d9a9b5"   # >2'500,000 ha
)


# Font and text size
font_family <- "Arial"
text_size <- 1.7
legend_size <- 1.2
title_size <- 0.0001
title_color <- "#585858"

# Set output path
output_file <- paste0(desktop_path, "/project_size_distribution.jpg")

# JPG 300 dpi resolution
jpeg(output_file, width = 9, height = 5, units = "in", res = 300)

# Layout: give a bit more space to pie, reduce legend width slightly
layout(matrix(c(1, 2), nrow = 1), widths = c(2.6, 1.6))

# Margins for pie chart — reduce left space
par(family = font_family, mar = c(0, 0, 0, 0))

# Pie chart
pie(
  datos$Projects,
  labels = labels,
  col = custom_palette,
  main = " ",
  cex.main = title_size,
  cex = 1.8,
  col.main = title_color,
  border = "white"
)

# Legend — move leftward
par(family = font_family, mar = c(0, 0, 0, 0))
plot.new()
legend(
  x = 0.000001, y = 1.1,
  legend = datos$SizeCategory,
  fill = custom_palette,
  border = NA,
  cex = 1.5,
  bty = "n",
  text.col = title_color,
  x.intersp = 0.1,
  y.intersp = 1.8  # Reduced spacing
)

# Close the JPG device
dev.off()

# Confirmation message
cat("The pie chart has been saved to:", output_file, "\n")

# Clean workspace
rm(list = ls())

# ---------------------------------------------------------------------------------

# Clear workspace
rm(list = ls())

# Define desktop path
desktop_path <- "C:/Users/steph/Desktop/Thesis related/Thesis graphs R/Graphs"

# Load data
datos <- data.frame(
  Biome = c("Andean", "Amazon", "Pacific", "Orinoco", "Caribbean"),
  Projects = c(8, 17, 16, 5, 2)
)

# Percentages
datos$Percentage <- round((datos$Projects / sum(datos$Projects)) * 100, 1)
labels <- paste0(datos$Percentage, "%")

# Custom colors
custom_palette <- c(
  "lightskyblue3",  # Andean
  "#8dd3c7",        # Amazon
  "#fdb462",        # Pacific
  "#fb8072",        # Orinoco
  "#ffffb3"         # Caribbean
)

# Output path
output_file <- paste0(desktop_path, "/project_biome_distribution.jpg")

# JPG output
jpeg(output_file, width = 9, height = 5, units = "in", res = 300)

# Layout: pie + legend
layout(matrix(c(1, 2), nrow = 1), widths = c(2.4, 1.3))

# Tighter pie chart margins & larger label size
par(mar = c(0, 0, 0, 0), family = "Franklin Gothic Book")

# Pie chart with larger label size (cex = 2)
pie(
  datos$Projects,
  labels = labels,
  col = custom_palette,
  cex = 2.1,         # <-- Increase label size here
  border = "white"
)

# Legend panel
par(mar = c(0, 0, 0, 0))
plot.new()
legend(
  x = 0, y = 0.79,
  legend = datos$Biome,
  fill = custom_palette,
  border = "grey65",
  cex = 2.4,
  bty = "n",
  text.col = "#585858"
)

# Close image device
dev.off()

# Confirmation
cat("The pie chart has been saved to:", output_file, "\n")

