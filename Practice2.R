setwd("C:/Users/HP ENVY/Desktop/MSc Data Science/Module 2 DATA ECOLOGY/R Practice/DataEcology_practice1/Census Data Lesson 1")
# Load the data created in the previous practical
Census.Data <-read.csv("practical_data.csv")
# prints the data within the console
print(Census.Data)
# prints the selected data within the console
print(Census.Data[1:20,1:5])
# to view the top 1000 cases of a data frame
View(Census.Data)
head(Census.Data)
tail(Census.Data)
#Get the number of columns
ncol(Census.Data)
#Get the number of rows
nrow(Census.Data)
#List the column headings
names(Census.Data)
# Descriptive Statistics 
mean(Census.Data$Unemployed)
median(Census.Data$Unemployed)
range(Census.Data$Unemployed)
#mean, median, 25th and 75th quartiles, min, max
summary(Census.Data)
# Univariate plots
# Histograms
# Creates a histogram
hist(Census.Data$Unemployed)
# Creates a histogram, enters more commands about the visualisation
hist(Census.Data$Unemployed, breaks=20, col= "blue",
     main="% in full-time employment", xlab="Percentage")
# box and whisker plots
boxplot(Census.Data[,2:5])

# Install the package
# When you hit enter R will ask you to select a mirror to download the package contents
# from. It doesn't really matter which one you choose, I tend to pick the UK based ones.
install.packages("vioplot")
# loads a package
library(vioplot)
# creates a violin plot for 4 variables, uses 3 shades of blue
vioplot(Census.Data$Unemployed, Census.Data$Qualification, Census.Data$White_British,
        Census.Data$Low_Occupancy, ylim=c(0,100),
        col = "dodgerblue", rectCol="dodgerblue3", colMed="dodgerblue4")
# add names to the plot
vioplot(Census.Data$Unemployed, Census.Data$Qualification, Census.Data$White_British,
        Census.Data$Low_Occupancy, ylim=c(0,100),
        col = "dodgerblue", rectCol="dodgerblue3", colMed="dodgerblue4",
        names=c("Unemployed", "Qualifications", "White British", "Occupancy"))
