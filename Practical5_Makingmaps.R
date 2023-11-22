setwd("C:/Users/HP ENVY/Desktop/MSc Data Science/Module 2 DATA ECOLOGY/R Practice/DataEcology_practice1/Census Data Lesson 1")
# Load the data. You may need to alter the file directory
Census.Data <-read.csv("practical_data.csv")


devtools::install_github("rsbivand/sp@evolution")
Sys.setenv("_SP_EVOLUTION_STATUS_"=2)

# New way to read shape files in R after retiring "rgdal" and "rgeos"
install.packages("sf")
library(sf)
Camden_oa11 <- system.file("shape/nc.shp", package="sf")
Output.Areas <- st_read("Camden_oa11.shp", quiet =TRUE)

# plots the shapefile
plot(Output.Areas)

# joins data to the shapefile
OA.Census <- merge(Output.Areas, Census.Data, by.x="OA11CD", by.y="OA")
# Setting a coordinate system
# sets the coordinate system to the British National Grid
install.packages("crs")
library(crs)
proj4string(OA.Census) <- crs("+init=EPSG:27700")

# loads packages
install.packages("tmap")
install.packages("leaflet")
library(tmap)
library(leaflet)

# this will prodyce a quick map of our qualification variable
qtm(OA.Census, fill = "Qualification")

# Creates a simple choropleth map of our qualification variable
tm_shape(OA.Census) + tm_fill("Qualification")

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

# setting a colour palette
library(tmap)
tm_shape(OA.Census) + tm_fill("Qualification", palette = "-Greens")
# changing the intervals
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", palette = "Reds")

# number of levels
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", n = 7,
                              palette = "Reds")

# includes a histogram in the legend
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", n = 5,
                              palette = "Reds", legend.hist = TRUE)

# add borders
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds") +
  tm_borders(alpha=.4)
# north arrow
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds") +
  tm_borders(alpha=.4) +
  tm_compass()

# adds in layout, gets rid of frame
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds",
                              style = "quantile", title = "% with a Qualification") +
  tm_borders(alpha=.4) +
  tm_compass() +
  tm_layout(title = "Camden, London", legend.text.size = 1.1,
            legend.title.size = 1.4, legend.position = c("right", "top"), frame = FALSE)

# Saving the shapefile
library(sf)
st_write(OA.Census, dsn = "C:/Users/HP ENVY/Desktop/MSc Data Science/Module 2 DATA ECOLOGY/R Practice/DataEcology_practice1/Census Data Lesson 1",
         layer = "Census_OA_Shapefile", driver="ESRI Shapefile")


