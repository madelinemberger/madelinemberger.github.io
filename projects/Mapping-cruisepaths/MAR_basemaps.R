# MAR Basemaps


mar_admin_plot <- read_sf(here("projects/Mapping-cruisepaths/mar_admin_plot.shp"))


library(ggplot2)
library(sf)
library(ggspatial)

# Basic MAR basemap using ggplot2
MAR_basemap <- ggplot() +
  geom_sf(data = mar_admin_plot, fill = "#EDEDED", color = NA) +
  annotation_scale(location = "bl", width_hint = 0.3, text_cex = 1) +
  annotation_north_arrow(location = "tl", which_north = "true",
                         style = north_arrow_fancy_orienteering) +
  theme_void()

#MAR_basemap

# Simple - No compass

MAR_basemap_simple <- ggplot() +
  geom_sf(data = mar_admin_plot, fill = "#EDEDED", color = NA) +
  theme_void()

#MAR_basemap_simple

# Bounding box for coastal zoom
coastal_bb <- st_bbox(c(xmin = -89.12, xmax = -84.74,
                        ymin = 15.46, ymax = 21.53), 
                      crs = st_crs(4326))

MAR_basemap_zoom <- ggplot() +
  geom_sf(data = mar_admin_plot, fill = "#EDEDED", color = NA) +
  annotation_scale(location = "bl", width_hint = 0.3, text_cex = 1) +
  annotation_north_arrow(location = "tl", which_north = "true",
                         style = north_arrow_fancy_orienteering) +
  coord_sf(xlim = c(coastal_bb$xmin, coastal_bb$xmax),
           ylim = c(coastal_bb$ymin, coastal_bb$ymax),
           expand = FALSE) +
  theme_void()

#MAR_basemap_zoom

