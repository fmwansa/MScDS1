# Bivariate Plots in R
setwd("C:/Users/HP ENVY/Desktop/MSc Data Science/Module 2 DATA ECOLOGY/R Practice/DataEcology_practice1/Census Data Lesson 1")
#Load the data. You may need to alter the file directory
Census.Data <-read.csv("practical_data.csv")
# Simple scatter plots
plot(Census.Data$Unemployed,Census.Data$Qualification)
# includes axis labels
plot(Census.Data$Unemployed,Census.Data$Qualification, xlab="% in full time employment",
     ylab="% With a Qualification")
# Create a proportional symbols plot
symbols(Census.Data$Unemployed,Census.Data$Qualification,
        circles = Census.Data$White_British,
        fg="white", bg ="purple", inches = 0.2)
# bubble plot
symbols(Census.Data$Unemployed, Census.Data$Qualification,
        circles = Census.Data$White_British,
        fg="white", bg ="purple", inches = 0.2, xlab="% in full time employment",
        ylab="% With a Qualification") +
  # adds a regression line, sets the colour to red
  abline(lm(Census.Data$Qualification~ Census.Data$Unemployed), col="red")
# a bubble plot with a dotted regression line
symbols(Census.Data$Unemployed, Census.Data$Qualification,
        circles = Census.Data$White_British,
        fg="white", bg ="purple", inches = 0.2, xlab="% in full time employmented",
        ylab="% With a Qualification") +
  abline(lm(Census.Data$Qualification~ Census.Data$Unemployed), col="red", lwd=2, lty=2)
# Using the ggplot2 package
# Loads an installed package
library("ggplot2")
p <- ggplot(Census.Data, aes(Unemployed,Qualification))
p + geom_point()

p <- ggplot(Census.Data, aes(Unemployed,Qualification))
p + geom_point(aes(colour = White_British, size = Low_Occupancy))
