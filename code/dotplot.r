# Load required library
library(ggplot2)

# Read the data from the CSV file using the correct separator
data <- read.csv("dotplot_input_file.csv", header = TRUE, sep = ",")

# Ensure that the column names are correct
colnames(data) <- c("Subtype", "Method", "OR", "FDR", "Significance", "Enrichment")

# Print the structure of the data to confirm correct reading
print(str(data))
print(head(data))

# Create dotplot with custom theme
dotplot <- ggplot(data, aes(x = OR, y = Subtype, color = Significance, shape = Method)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("Significant" = "red", "Non-Significant" = "blue")) +
  scale_shape_manual(values = 1:nlevels(factor(data$Method))) + # Use different shapes for each method
  labs(x = "OR", y = "Subtype", color = "Significance", shape = "Method") +
  theme_minimal(base_size = 16) +  # Adjust base font size
  theme(
    axis.line = element_line(color = "black", linewidth = 1),  # Set axis line color and size
    panel.border = element_rect(color = "black", fill = NA, linewidth = 1),  # Set panel border color and size
    axis.text = element_text(size = 14, face = "bold"),  # Adjust axis text size and font weight
    axis.title = element_text(size = 16, face = "bold")  # Adjust axis title size and font weight
  )

# Save the dotplot in PDF format with DPI 600
ggsave("dotplot.pdf", plot = dotplot, width = 6, height = 4, units = "in", dpi = 600)
