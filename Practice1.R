setwd("C:/Users/HP ENVY/Desktop/MSc Data Science/Module 2 DATA ECOLOGY/R Practice/DataEcology_practice1/Census Data Lesson 1")
# Setting the working directory
# Loading data sets
Ethnicity <- read.csv("KS201EW_oa11.csv")
Rooms <- read.csv("KS403EW_oa11.csv")
Qualifications <-read.csv("KS501EW_oa11.csv")
Employment <-read.csv("KS601EW_oa11.csv")
# to view the top 1000 cases of a data frame
View(Employment)
# view column names of a dataframe
names(Employment) 
# selecting specific columns only
# note this action overwrites the labels you made for the original data,
# so if you make a mistake you will need to reload the data into R
Ethnicity <- Ethnicity[, c(1, 21)]
Rooms <- Rooms[, c(1, 13)]
Employment <- Employment[, c(1, 20)]
Qualifications <- Qualifications[, c(1, 20)]
# to change an individual column name
names(Employment)[2] <- "Unemployed"
# to change both column names
names(Ethnicity)<- c("OA", "White_British")
names(Rooms)<- c("OA", "Low_Occupancy")
namesEmployment)<- c("OA", "Unemployed")
names(Qualifications)<- c("OA", "Qualification")
# Joining data in R
#1 Merge Ethnicity and Rooms to create a new object called "merged_data_1"
merged_data_1 <- merge(Ethnicity, Rooms, by="OA")
#2 Merge the "merged_data_1" object with Employment to create a new merged data object
merged_data_2 <- merge(merged_data_1, Employment, by="OA")
#3 Merge the "merged_data_2" object with Qualifications to create a new data object
Census.Data <- merge(merged_data_2, Qualifications, by="OA")
#4 Remove the "merged_data" objects as we won't need them anymore
rm(merged_data_1, merged_data_2)
# Writes the data to a csv named "practical_data" in your filedirectory
write.csv(Census.Data, "practical_data.csv", row.names=F)
