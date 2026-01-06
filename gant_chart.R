# Load libraries
library(ggplot2)
library(dplyr)


# Define tasks
tasks <- data.frame(
  group =  c("Reproduceable pipeline","Reproduceable pipeline", 
             "Processing data", "Processing data",
             "Analysis", "Analysis","Analysis", "Analysis","Analysis",
             "Collaboration"),
  content = c(
    "Prepare effective and reproducible pipeline\n for FENLAND study",
    "Prepare effective and reproducible pipeline\n for external validation in UK biobank,\n Whitehall II, and ADDITION-PRO",
    "WP2: Process DEXA data",
    "WP2: Process omics data",
    "WP1: Analyse FENLAND study incretin and glucagon\n linked to Danish Health Registers",
    "WP3: Map clinical and biological traits\n to incretin and glucagon responses",
    "WP2: Analyse metabolic traits\n clinical, biological, and DEXA derived adiposity\nwith cardiometabolic risk in FENLAND study",
    "WP2: External validate results from FENLAND study\n in UK bioank and\n ADDITION-PRO",
    "Combine work packages to obtain set of\nbiomarkers to predict and stratify individuals\nwith high risk of type 2 diabetes",
    "Post doc stay abroad at University of Cambridge\nMRC Epidemiology Unit"
  ),
  start = as.Date(c("2026-03-01","2026-11-01","2026-04-01", "2026-04-01", "2026-04-01", "2026-08-01","2026-11-01", "2027-02-01", "2027-10-01", "2027-02-01")),
  end   = as.Date(c("2026-12-01","2027-04-01","2026-09-01", "2026-08-01", "2026-06-01", "2026-11-01","2027-08-01", "2027-11-01", "2028-03-01", "2027-05-01"))
)


# Optional: reorder factor levels for plotting
tasks$content <- factor(tasks$content, levels = rev(c(
  "Prepare effective and reproducible pipeline\n for FENLAND study",
  "Prepare effective and reproducible pipeline\n for external validation in UK biobank,\n Whitehall II, and ADDITION-PRO",
  "WP2: Process DEXA data",
  "WP2: Process omics data",
  "WP1: Analyse FENLAND study incretin and glucagon\n linked to Danish Health Registers",
  "WP3: Map clinical and biological traits\n to incretin and glucagon responses",
  "WP2: Analyse metabolic traits\n clinical, biological, and DEXA derived adiposity\nwith cardiometabolic risk in FENLAND study",
  "WP2: External validate results from FENLAND study\n in UK bioank and\n ADDITION-PRO",
  "Combine work packages to obtain set of\nbiomarkers to predict and stratify individuals\nwith high risk of type 2 diabetes",
  "Post doc stay abroad at University of Cambridge\nMRC Epidemiology Unit"
)))

# Plot Gantt chart
gant_diagram <- ggplot(tasks, aes(x = start, xend = end, y = content, yend = content, color = group)) +
  geom_segment(size = 6) +
  scale_color_brewer(palette = "Set2") +
  labs(title = "Research plan for the Inter-SUSTAIN Part 2 project",
       x = "Date",
       y = NULL,
       color = NULL) +
  theme_minimal() +
  theme(legend.position = "bottom")

ggsave(
  filename = here::here("figures/gant_diagram.pdf"),
  plot = gant_diagram,
  dpi = 1000,
  width = 8,         # Width in inches (adjust as needed)
  height = 6,         # Height in inches (adjust as needed)
  units = "in"        # You can also use "cm" or "mm"
)
