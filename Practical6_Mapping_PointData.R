setwd("C:/Users/HP ENVY/Desktop/MSc Data Science/Module 2 DATA ECOLOGY/R Practice/DataEcology_practice1/Census Data Lesson 1")
# Load the data. You may need to alter the file directory
Census.Data <-read.csv("practical_data.csv")

library(sf)
Camden_oa11 <- system.file("shape/nc.shp", package="sf")
Output.Areas <- st_read("Camden_oa11.shp", quiet =TRUE)

# join our census data to the shapefile
OA.Census <- merge(Output.Areas, Census.Data, by.x="OA11CD", by.y="OA")

# load the house prices csv file
houses <- read.csv("CamdenHouseSales15.csv")

# we only need a few columns for this practical
houses <- houses[,c(1,2,8,9)]

# 2D scatter plot
plot(houses$oseast1m, houses$osnrth1m)

library("sp")
# create a House.Points SpatialPointsDataFrame
House.Points <-SpatialPointsDataFrame(houses[,3:4], houses,
                                      proj4string = CRS("+init=EPSG:27700"))
library("tmap")
# This plots a blank base map, we have set the transparency of the borders to 0.4
tm_shape(OA.Census) + tm_borders(alpha=.4)

# creates a coloured dot map
tm_shape(OA.Census) + tm_borders(alpha=.4) +
  tm_shape(House.Points) + tm_dots(col = "Price", palette = "Reds", style = "quantile")

# creates a coloured dot map
tm_shape(OA.Census) + tm_borders(alpha=.4) +
  tm_shape(House.Points) + tm_dots(col = "Price", scale = 1.5, palette = "Reds",
                                   style = "quantile", title = "Price Paid (£)")
# creates a coloured dot map
tm_shape(OA.Census) + tm_borders(alpha=.4) +
  tm_shape(House.Points) + tm_dots(col = "Price", scale = 1.5, palette = "Purples",
                                   style = "quantile", title = "Price Paid (£)") +
  tm_compass() +
  tm_layout(legend.text.size = 1.1, legend.title.size = 1.4, frame = FALSE)

# creates a proportional symbol map
tm_shape(OA.Census) + tm_borders(alpha=.4) +
  tm_shape(House.Points) + tm_bubbles(size = "Price", col = "Price",
                                      palette = "Blues", style = "quantile",
                                      legend.size.show = FALSE,
                                      title.col = "Price Paid (£)") +
  tm_layout(legend.text.size = 1.1, legend.title.size = 1.4, frame = FALSE)

# creates a proportional symbol map
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds",
                              style = "quantile", title = "% Qualification") +
  tm_borders(alpha=.4) +
  tm_shape(House.Points) + tm_bubbles(size = "Price", col = "Price",
                                      palette = "Blues", style = "quantile",
                                      legend.size.show = FALSE,
                                      title.col = "Price Paid (£)",
                                      border.col = "black", border.lwd = 0.1,
                                      border.alpha = 0.1) +
  tm_layout(legend.text.size = 0.8, legend.title.size = 1.1, frame = FALSE)



