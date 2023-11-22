setwd("C:/Users/HP ENVY/Desktop/MSc Data Science/Module 2 DATA ECOLOGY/R Practice/DataEcology_practice1/Census Data Lesson 1")
#Load the data. You may need to alter the file directory
Census.Data <-read.csv("practical_data.csv")
# Bivariate correlations
# Runs a Pearson's correlation
cor(Census.Data$Unemployed, Census.Data$Qualification)
# Runs a Pearson's correlation
cor.test(Census.Data$Unemployed, Census.Data$Qualification)
# Runs a Spearman's correlation
cor.test(Census.Data$Unemployed, Census.Data$Qualification, method="spearman")

# creates a data1 object which does not include the 1st column from the original data
data1 <- Census.Data[,2:5]
# creates correlation matrix
cor(data1)

# creates correlation matrix
round(cor(data1),2)

install.packages("reshape2")
library(ggplot2) # should already be opened from the previous stage
library(reshape2)
# Heat map
qplot(x=Var1, y=Var2, data=melt(cor(data1, use="p")), fill=value, geom="tile") +
  scale_fill_gradient2(limits=c(-1, 1))
# Regression analysis
model_1 <- lm(Census.Data$Qualification~ Census.Data$Unemployed)
plot(Census.Data$Unemployed, Census.Data$Qualification, xlab="% Unemployed",
     ylab="% With a Qualification") + abline (model_1)
summary(model_1)

predict(model_1, data.frame(Unemployed = c(15)))
summary(model_1)
confint(model_1, level= 0.95)

# Mutliple regression
# runs a model with two independent variables
model_2 <- lm(Census.Data$Qualification~ Census.Data$Unemployed +
                Census.Data$White_British)
# view the model summary
summary(model_2)