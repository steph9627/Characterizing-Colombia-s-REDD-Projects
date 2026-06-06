# Clear workspace
rm(list = ls())

# Define desktop path
desktop_path <- "C:/Users/steph/Desktop/Stuff/Thesis related/Thesis graphs R/Graphs"

# Data for project owners
datos <- data.frame(
  Owner = c(
    "Afro-Colombian (33.3%)",
    "Indigenous (39.6%)",
    "Indigenous + Afro (2.1%)",
    "Indigenous + Farmers (2.1%)",
    "Water Company (2.1%)",
    "Foundations (4.2%)",
    "Fishermen (4.2%)",
    "Landowners (12.5%)"
  ),
  Projects = c(16, 19, 1, 1, 1, 2, 2, 6)
)

# Custom color palette
custom_palette <- c(
  "lightskyblue1", # Afro-Colombian
  "lightskyblue", # Indigenous
  "lightskyblue3", # Indigenous + Afro
  "lightskyblue4", # Indigenous + Farmers
  "#ffffb3",       # Water company
  "#fdb462",       # Foundations
  "#8dd3c7",       # Fishermen
  "#fb8072"        # Landowners
)

# Optional: font settings (if needed)
windowsFonts(Arial = windowsFont("Arial"))
font_family <- "Arial"
title_color <- "#585858"

# Output file path
output_file <- paste0(desktop_path, "/project_owners_pie_only_final.jpg")

# Export as JPG with 300 dpi
jpeg(output_file, width = 9, height = 5, units = "in", res = 300)

# Layout: pie chart on left, legend on right
layout(matrix(c(1, 2), nrow = 1), widths = c(1.83, 2))

# Pie chart without labels
par(family = font_family, mar = c(0, 0, 0, 0))
pie(
  datos$Projects,
  labels = NA,
  col = custom_palette,
  border = "white"
)

# Legend
par(family = font_family, mar = c(0, 0, 0, 0))
plot.new()
legend(
  x = 0.00015, y = 0.8,
  legend = datos$Owner,
  fill = custom_palette,
  cex = 1.5,
  bty = "n",
  text.col = title_color,
  x.intersp = 0.5
)

dev.off()

message("Plot saved successfully.")

